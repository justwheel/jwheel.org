---
title: "How to automatically scale Kubernetes with Horizontal Pod Autoscaling"
date: 2018-03-06
categories: 
  - "tech"
tags: 
  - "cloud-computing"
  - "cluster-computing"
  - "containers"
  - "fedora-planet"
  - "infrastructure"
  - "kubernetes"
  - "scalability"
  - "system-administration"
---

Scale is a critical part of how we develop applications in today's world of infrastructure. Now, containers and container orchestration like Docker and [Kubernetes](https://jwfblog.wpenginepowered.com/2017/07/introduction-kubernetes-fedora/) make it easier to think about scale. One of the "magical" things about The potential of Kubernetes is fully realized when you have a sudden increase in load, your infrastructure scales up and grows to accommodate. How does this work? With **Horizontal Pod Autoscaling**, Kubernetes adds more pods when you have more load and drops them once things return to normal.

This article covers Horizontal Pod Autoscaling, what it is, and how to try it out with the [Kubernetes guestbook](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/) example. By the end of this article, you will…

- Understand what Horizontal Pod Autoscaling (HPA) is
- Be able to create an HPA in Kubernetes
- Create an HPA for the Guestbook and watch it work with [Siege](https://github.com/JoeDog/siege)

<!--more-->

## What is Horizontal Pod Autoscaling?

[Horizontal Pod Autoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) (HPA) is a Kubernetes API resource to dynamically grow an environment. To help simplify things, consider it in three pieces:

- **Horizontal**: Think of _horizontal_ growth, i.e. adding more nodes to your available pool (unlike _vertical_, which would be adding more memory / CPU to your existing nodes)
- **Pod**: Your deployable units in Kubernetes
- **Autoscaling**: Automatically scaling out when needed

![Diagram to explain how Horizontal Pod Autoscaler (HPA) works](/blog/2017/08/k8s-hpa.png "Diagram to explain how a Horizontal Pod Autoscaler (HPA) works. From [Kubernetes documentation](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/).")

To help visualize it, imagine you have a [Python Flask](http://flask.pocoo.org/) web server that reads and writes data to a [Redis](https://redis.io/) back-end. Your web server is the front-end for all of your incoming traffic. You run it with three pods in Kubernetes, with 512MB of RAM and 50m of CPU. Now, suddenly, BuzzFeed writes an article about your app, Kanye West name drops the app in a TV interview, and the president of the United States retweets a link to your site.

Oops.

Now you have a serious problem on your hands, where your tiny application is overloaded. Three pods aren't cutting it anymore. You get woken up at 3:00am to hastily adjust the number of replicas and rapidly scale your infrastructure. While you're wondering _how this happened_, you also wonder… isn't there an easier way? Could I have avoided this panicked, pre-dawn scaling crisis? Yes, there is! At least, somewhat.

#### Building to scale

By creating and managing your deployments with HPAs, your application grows horizontally to handle the load. As the CPU utilization rises, HPAs trigger the addition of more pods to scale automatically. Previously, you could create a Horizontal Pod Autoscaler that would begin scaling when cumulative CPU utilization was at 60%. You could also tell it to scale to a maximum of 500 pods, but no less than three. So then, when the Apocalypse of Viral Sharing happened to your web application, it could have grown dynamically.

If you want to dive deeper in the technical implementation of HPAs, you can read more in the [Kubernetes documentation](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/).

## Create a Horizontal Pod Autoscaler

Now that you understand how a Horizontal Pod Autoscaler (HPA) is helpful, how do you create one? Like any other resource in Kubernetes, define HPAs in a YAML definition file. Here's a template for getting started.

```
---
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: my-app-hpa
  namespace: my-app-space
  labels:
    app: my-app
    tier: frontend
spec:
  scaleTargetRef:
    apiVersion: apps/v1beta1
    kind: Deployment
    name: my-app-deployment
  minReplicas: 2
  maxReplicas: 20
  targetCPUUtilizationPercentage: 60
```

This is the minimal spec you need to deploy an HPA. It's not that different from other Kubernetes resources you may have seen.

#### Explaining the configuration

Let's look at what some of the specific lines are.

- `spec.scaleTargetRef.name`: Name of resource to scale (e.g. name of a deployment)
- `spec.minReplicas`: Minimum number of replicas running when CPU use is minimal
- `spec.maxReplicas`: Maximum number of replicas running when CPU use peaks
- `spec.targetCPUUtilizationPercentage`: Percentage threshold when HPA begins scaling out pods

When starting out for the first time, tweak these values based on the amount of traffic you expect to receive or what your budget is. Load testing your application is one way to see the HPAs do their job.

## Obliterating the Guestbook

But this guide wouldn't be complete without a live demo to try. You can create one with an existing application and put it to the test. This section assumes you have a running [Guestbook application](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/) in your Kubernetes environment. As a quick refresh, the Guestbook is a three-part application:

- PHP web application for writing messages into a virtual guestbook
- Primary Redis node for writing new messages from web page
- Replica Redis nodes for reading the data into web page

We'll add an HPA as a fourth part to scale the PHP web application for new traffic.

#### Create the HPA for Guestbook

Now, create a new HPA spec file for the guestbook.

```
---
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: guestbook-frontend
  namespace: guestbook
  labels:
    app: guestbook
    env: production
    tier: frontend
spec:
  scaleTargetRef:
    apiVersion: apps/v1beta1
    kind: Deployment
    name: guestbook-frontend
  minReplicas: 2
  maxReplicas: 10
  targetCPUUtilizationPercentage: 75
```

Put this into a file and create the HPA with `kubectl`.

```
$ kubectl apply --record -f guestbook-frontend-hpa.yaml
```

Now, the Horizontal Pod Autoscaler is operational and monitoring the CPU utilization of your deployment.

#### Load test with Siege

To force the HPA into action, we'll use [Siege](https://github.com/JoeDog/siege), an HTTP load testing and benchmark utility. Siege is a multi-threaded load testing tool and has a few other capabilities included to make it a good option for putting some force onto a simple web app.

First, put various permutations of the URL in a plaintext file. By doing this, Siege can randomly scan the URLs in he text file and ping them in "Internet mode" by randomly selecting a URL from the list for each request. This could look like the following…

```
http://my-guestbook.example.com/
http://my-guestbook.example.com/index.html
http://my-guestbook.example.com/guestbook.php
http://my-guestbook.example.com/guestbook.php?cmd=get&key=messages
```

Once this is done, you can fire up Siege to begin load testing. In this case, to get fast results, we'll use 255 concurrent users for five minutes, using Internet and benchmark modes.

```
$ siege --verbose --benchmark --internet --concurrent 255 --time 10M --file siege-urls.txt
```

You should see Siege begin to rapidly send requests to your Guestbook application. Now that the action is in progress, you can slowly observe your CPU utilization begin to climb. Watch it slowly change by using `watch`.

```
$ watch -d -n 2 -b -c kubectl get hpa -l app=guestbook
```

During the five minute load test, you should notice CPU usage rise and then new replicas will appear. Depending on what your original requests and limits are for the deployment, you will see different results. Next, try setting the deployment's requests / limits to lower values if nothing seems to happen while testing.

## Learn more about Horizontal Pod Autoscaler

Horizontal Pod Autoscalers are a stable resource in Kubernetes and are available for you to begin playing around with now. To learn more, read the [documentation](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) or see another example in the [official walkthrough](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/).
