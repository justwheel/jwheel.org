---
title: "Sign at the line: Deploying an app to CoreOS Tectonic"
date: 2017-08-04
categories: 
  - "tech"
tags: 
  - "cluster-computing"
  - "containers"
  - "coreos"
  - "fedora-planet"
  - "google"
  - "high-performance-computing-hpc"
  - "infrastructure"
  - "kubernetes"
  - "scalability"
  - "system-administration"
---

_This is a short series to introduce Kubernetes, what it does, and how to experiment with it on Fedora. This is a beginner-oriented series to help introduce some higher level concepts and give examples of using it on Fedora. In the first post, we covered [key concepts in Kubernetes](https://fedoramagazine.org/introduction-kubernetes-fedora/). The second post showed how to build a [single-node Kubernetes deployment](https://fedoramagazine.org/minikube-kubernetes/) on your own computer. The last post and this post build on top of the Fedora Magazine series. The third post introduced how to [deploy CoreOS Tectonic](https://blog.justinwflory.com/2017/07/tectonic-amazon-web-services-aws/) to Amazon Web Services (AWS). This fourth post teaches how to deploy a simple web application to your Tectonic installation._

* * *

Welcome back to the **Kubernetes and Fedora** series. Each week, we build on the previous articles in the series to help introduce you to using Kubernetes. This article picks up from where we left off last when you installed Tectonic to Amazon Web Services (AWS). By the end of this article, you will…

- Start up [Redis](https://redis.io/) master and slave pods
- Start a front-end pod that interacts with the Redis pods
- Deploy a simple web app for all of your friends to leave you messages

Compared to previous articles, this article will be a little more hands-on. Also like before, this is based off an excellent tutorial in the [upstream Kubernetes documentation](https://github.com/kubernetes/kubernetes/tree/master/examples/guestbook). Let's get started!

<!--more-->

## Pre-requisites

This tutorial assumes you followed the [Minikube how-to](https://fedoramagazine.org/minikube-kubernetes/) earlier in this series and that you already [have a Tectonic installation](https://fedoramagazine.org/tectonic-amazon-web-services-aws/) running (doesn't have to be on AWS). In case you're jumping in now, make sure you have the Kubernetes client tools installed on your Fedora system, like `kubectl`. If not, you can install them now.

```
$ sudo dnf install kubernetes-client
```

## Configure `kubectl` for Tectonic

To use `kubectl` with your Tectonic installation, you need to have a valid configuration in `~/.kube/config` for your cluster. This is how `kubectl` knows where and how to talk to Tectonic. To get these values, first log into the Tectonic Console you installed.

1. Click _username_ (usually _admin_) > _My Account_ on the bottom left.
2. Click _Download Configuration_.
3. When the _Set Up kubectl_ window opens, click _Verify Identity_.
4. Enter your username and password, and click _Login_.
5. From the _Login Successful_ screen, copy the provided code.
6. Switch back to Tectonic and enter the code in the field.

Now you will be able to download `kubectl-config` from Tectonic. There's two ways to proceed from here.

#### Add a new configuration

If this is your first time using `kubectl`, your configuration is likely empty. If it's empty or you don't care about overwriting an old configuration, you can run the following commands to add the configuration.

```
$ mkdir ~/.kube/
$ mv ~/Downloads/minikube-config ~/.kube/config
$ chmod 600 ~/.kube/config
```

#### Append to an existing configuration

If you already have a configuration, like from Minikube, you might not want to wipe it all out. In this case, you can merge the files manually together. You'll need to copy the `clusters`, `users`, and `contexts` from the Tectonic configuration into your existing one. The benefit of doing this is that you'll be able to change contexts to switch from one cluster to another.

#### Test your configuration

Once you finished your configuration, test to see if it works.

```
$ kubectl config use-context tectonic       # if you have multiple contexts in config
$ kubectl get nodes
NAME                                        STATUS    AGE
ip-10-0-0-59.us-east-2.compute.internal     Ready     1d
ip-10-0-23-239.us-east-2.compute.internal   Ready     1d
ip-10-0-44-211.us-east-2.compute.internal   Ready     1d
ip-10-0-61-218.us-east-2.compute.internal   Ready     1d
ip-10-0-67-239.us-east-2.compute.internal   Ready     1d
ip-10-0-95-51.us-east-2.compute.internal    Ready     1d
```

Huzzah! Now we're ready to get to work.

## Getting the deployment and service files

All of the example files come from the official Kubernetes GitHub repo. You can find them in the [Guestbook example](https://github.com/kubernetes/kubernetes/tree/master/examples/guestbook). To get started, create a new directory and download all of the files.

```
$ wget https://raw.githubusercontent.com/kubernetes/kubernetes/master/examples/guestbook/redis-{master,slave}-{deployment,service}.yaml \
       https://raw.githubusercontent.com/kubernetes/kubernetes/master/examples/guestbook/frontend-{deployment,service}.yaml

```

We'll explain what all of these do in next steps. All of these next steps will start with the command to run, followed by a short explanation of what's actually happening.

## Start the Redis master

```
$ kubectl create -f redis-master-service.yaml
service "redis-master" created
$ kubectl create -f redis-master-deployment.yaml
deployment "redis-master" created
```

#### Define the deployment

The `redis-master-deployment.yaml` file downloaded earlier defines the deployment and its characteristics. In this case, we have one pod that runs the Redis master in a container. Since we're using a deployment, that means if our pod goes down, Kubernetes will **spin up a new pod** to replace it. Worth noting in this example, if the pod _did_ go down, there would be a potential for data loss until the new one replaces the old one (since the Redis master is not highly available, i.e. there are multiple).

#### Define the service

Our service in this example is a **named load balancer** that **proxies traffic** across one or many containers. Even though we only have one Redis master pod, we still want to use a service. This is a deterministic way of making the route to the master with a dynamic (or elastic) IP address.

Labeling the pods is important in this case, as Kubernetes will use the pods' labels to determine which pods receive the traffic sent to the service, and load balance it accordingly.

#### Create the service

The next important step is to create the service. Note that we're doing this _before_ we create the deployment. It's best practice to create the service first. This allows the scheduler to later spread the service across the deployments you create to support your application.

After creating the service, you can check its status by running this command. You should see similar output.

```
$ kubectl get services
NAME              CLUSTER-IP       EXTERNAL-IP       PORT(S)       AGE
redis-master      10.0.76.248      <none>            6379/TCP      1s
```

Now your Redis master serivce is up and running! The next step will be to create the Redis master deployment.

If you look at the service configuration file, you'll notice `port` and `targetPort` are two defined variables. Once everything is up and running, these will be important for determining how the traffic from the slaves to the masters is routed.

1. Redis slave connects to `port` on Redis master service
2. Traffic forwarded from service's `port` to `targetPort` on pod the service listens to

#### Create the deployment

Next, we created the Redis master pod in the cluster. To see our deployment and pods, we can run the following commands to see what was created.

```
$ kubectl get deployments
NAME           DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
redis-master   1         1         1            1           27s

```

```
$ kubectl get pods
NAME                            READY     STATUS    RESTARTS   AGE
redis-master-2353460263-1ecey   1/1       Running   0          1m
...

```

You should see all of the pods in your cluster so far. For now, that's just the Redis master. Let's give it some friends!

## Start the Redis slaves

```
$ kubectl create -f redis-slave-service.yaml
service "redis-slave" created
$ kubectl create -f redis-slave-deployment.yaml
deployment "redis-slave" created
```

#### Defining the deployment

In the configuration file, we defined two replicas, unlike the master. By doing this, it tells Kubernetes that the minimum number of pods that should always be running is two. If one of your pods goes down, Kubernetes automatically creates a new one to support the application. If you want, you can try killing the Docker process for one of your pods to see it happen in real time.

## Start the guestbook front-end

```
$ kubectl create -f frontend-service.yaml
service "frontend" created
$ kubectl create -f frontend-deployment.yaml
deployment "frontend" created
```

The front-end is a PHP application with an AJAX interface and Angular-based UI. When using the form on the front-end application, it talks to the Redis master or slave, depending on if it's reading or writing to Redis. Again, we're deploying the front-end with multiple replicas. In this case, there will be three pods to support the front-end.

## Say hello!

Once you've finished deploying everything, your web app should now be accessible! To get the full domain from AWS, run this command to figure out where to look.

```
$ kubectl get deploy/frontend svc/frontend -o wide
NAME           CLUSTER-IP   EXTERNAL-IP                                                             PORT(S)        AGE       SELECTOR
svc/frontend   10.3.0.175   aaebd8247ef2311e6a045021d1620193-54019671.us-east-2.elb.amazonaws.com   80:31020/TCP   1m        k8s-app=guestbook,tier=frontend

NAME              DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
deploy/frontend   3         3         3            3           1m
```

Congratulations, we're all finished!

## Cleaning up

Once you're finished or when you want to stop running the guestbook, it's easy to get rid of the deployments and services we created. Using labels, all the deployments and services can be deleted with one command.

```
$ kubectl delete deployments,services -l "app in (redis, guestbook)"
```

And now your guestbook application is offline. (It was nice while it lasted!)

## Learn more about Kubernetes and Tectonic

If you want to explore more about Kubernetes, you can read some of the earlier articles in this series. You can also read the original tutorial published by Kubernetes [on GitHub](https://github.com/kubernetes/kubernetes/tree/master/examples/guestbook). Additionally, the upstream documentation for [Kubernetes](https://kubernetes.io/docs/home/) and [Tectonic](https://coreos.com/tectonic/docs/latest/) is thorough and can help answer more advanced questions.

Questions, Tectonic stories, or tips for beginners? Add your comments below.
