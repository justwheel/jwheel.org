---
title: "Clustered computing on Fedora with Minikube"
date: 2017-07-07
categories: 
  - "tech"
tags: 
  - "cluster-computing"
  - "containers"
  - "fedora-planet"
  - "getting-started"
  - "google"
  - "high-performance-computing-hpc"
  - "infrastructure"
  - "kubernetes"
  - "scalability"
  - "system-administration"
coverImage: "k8s-2-minikube.jpg"
---

_**This article was originally published [on the Fedora Magazine](https://fedoramagazine.org/minikube-kubernetes/).**_

* * *

_This is a short series to introduce Kubernetes, what it does, and how to experiment with it on Fedora. This is a beginner-oriented series to help introduce some higher level concepts and give examples of using it on Fedora. In the first post, we covered [key concepts in Kubernetes](https://fedoramagazine.org/introduction-kubernetes-fedora/). This second post shows you how to build a single-node Kubernetes deployment on your own computer._

* * *

Once you have a better understanding of what the key concepts and terminology in Kubernetes are, getting started is easier. Like many programming tutorials, this tutorial shows you how to build a "Hello World" application and deploy it locally on your computer using Kubernetes. This is a simple tutorial because there aren't multiple nodes to work with. Instead, the only device we're using is a single node (a.k.a. your computer). By the end, you'll see how to deploy a Node.js application into a Kubernetes pod and manage it with a deployment on Fedora.

<!--more-->

This tutorial isn't made from scratch. You can find the [original tutorial](https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/) in the official Kubernetes documentation. This article adds some changes that will let you do the same thing on your own Fedora computer.

## Introducing Minikube

[Minikube](https://kubernetes.io/docs/getting-started-guides/minikube/) is an official tool developed by the Kubernetes team to help make testing it out easier. It lets you run a single-node Kubernetes cluster through a virtual machine on your own hardware. Beyond using it to play around with or experiment for the first time, it's also useful as a testing tool if you're working with Kubernetes daily. It does support many of the features you'd want in a production Kubernetes environment, like DNS, NodePorts, and container run-times.

## Installation

This tutorial requires virtual machine and container software. There are many options you can use. Minikube supports `virtualbox`, `vmwarefusion`, `kvm`, and `xhyve` drivers for virtualization. However, this guide will use KVM since it's already packaged and available in Fedora. We'll also use Node.js for building the application and Docker for putting it in a container.

#### Pre-requirements

You can install the prerequisites with this command.

```
$ sudo dnf install kubernetes libvirt-daemon-kvm kvm nodejs docker
```

After installing these packages, you'll need to add your user to the right group to let you use KVM. The following commands will add your user to the group and then update your current session for the group change to take effect.

```
$ sudo usermod -a -G libvirt $(whoami)
$ newgrp libvirt
```

#### Docker KVM drivers

If using KVM, you will also need to install the KVM drivers to work with Docker. You need to add [Docker Machine](https://github.com/docker/machine/releases) and the [Docker Machine KVM Driver](https://github.com/dhiltgen/docker-machine-kvm/releases/) to your local path. You can check their pages on GitHub for the latest versions, or you can run the following commands for specific versions. These were tested on a Fedora 25 installation.

##### Docker Machine

```
$ curl -L https://github.com/docker/machine/releases/download/v0.12.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine
$ chmod +x /tmp/docker-machine
$ sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
```

##### Docker Machine KVM Driver

This installs the CentOS 7 driver, but it also works with Fedora.

```
$ curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.10.0/docker-machine-driver-kvm-centos7 >/tmp/docker-machine-driver-kvm
$ chmod +x /tmp/docker-machine-driver-kvm
$ sudo cp /tmp/docker-machine-driver-kvm /usr/local/bin/docker-machine-driver-kvm
```

#### Installing Minikube

The final step for installation is getting Minikube itself. Currently, there is no package in Fedora available, and official documentation recommends grabbing the binary and moving it your local path. To download the binary, make it executable, and move it to your path, run the following.

```
$ curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
$ chmod +x minikube
$ sudo mv minikube /usr/local/bin/
```

Now you're ready to build your cluster.

## Create the Minikube cluster

Now that you have everything installed and in the right place, you can create your Minikube cluster and get started. To start Minikube, run this command.

```
$ minikube start --vm-driver=kvm
```

Next, you'll need to set the context. Context is how `kubectl` (the command-line interface for Kubernetes) knows what it's dealing with. To set the context for Minikube, run this command.

```
$ kubectl config use-context minikube
```

As a check, make sure that `kubectl` can communicate with your cluster by running this command.

```
$ kubectl cluster-info
Kubernetes master is running at https://192.168.99.100:8443
To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

## Build your application

Now that Kubernetes is ready, we need to have an application to deploy in it. This article uses the same Node.js application as the official tutorial in the Kubernetes documentation. Create a folder called `hellonode` and create a new file called `server.js` with your favorite text editor.

```
var http = require('http');

var handleRequest = function(request, response) {
 console.log('Received request for URL: ' + request.url);
 response.writeHead(200);
 response.end('Hello world!');
};
var www = http.createServer(handleRequest);
www.listen(8080);
```

Now try running your application and running it.

```
$ node server.js
```

While it's running, you should be able to access it on [localhost:8080](http://localhost:8080/). Once you verify it's working, hit `Ctrl+C` to kill the process.

## Create Docker container

Now you have an application to deploy! The next step is to get it packaged into a Docker container (that you'll pass to Kubernetes later). You'll need to create a `Dockerfile` in the same folder as your `server.js` file. This guide uses an existing Node.js Docker image. It exposes your application on port 8080, copies `server.js` to the image, and runs it as a server. Your `Dockerfile` should look like this.

```
FROM node:6.9.2
EXPOSE 8080
COPY server.js .
CMD node server.js
```

If you're familiar with Docker, you're likely used to pushing your image to a registry. In this case, since we're deploying it to Minikube, you can build it using the same Docker host as the Minikube virtual machine. For this to happen, you'll need to use the Minikube Docker daemon.

```
$ eval $(minikube docker-env)
```

Now you can build your Docker image with the Minikube Docker daemon.

```
$ docker build -t hello-node:v1 .
```

Huzzah! Now you have an image Minikube can run.

## Create Minikube deployment

If you remember from the [first part](https://fedoramagazine.org/introduction-kubernetes-fedora/) of this series, deployments watch your application's health and reschedule it if it dies. Deployments are the supported way of creating and scaling pods. `kubectl run` creates a deployment to manage a pod. We'll create one that uses the `hello-node` Docker image we just built.

```
$ kubectl run hello-node --image=hello-node:v1 --port=8080
```

Next, check that the deployment was created successfully.

```
$ kubectl get deployments
NAME         DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
hello-node   1         1         1            1           30s
```

Creating the deployment also creates the pod where the application is running. You can view the pod with this command.

```
$ kubectl get pods
NAME                          READY     STATUS    RESTARTS   AGE
hello-node-1644695913-k2314   1/1       Running   0          3
```

Finally, let's look at what the configuration looks like. If you're familiar with Ansible, the configuration files for Kubernetes also use easy-to-read YAML. You can see the full configuration with this command.

```
$ kubectl config view
```

`kubectl` does many things. To read more about what you can do with it, you can read the [documentation](https://kubernetes.io/docs/user-guide/kubectl-overview/).

## Create service

Right now, the pod is only accessible inside of the Kubernetes pod with its internal IP address. To see it in a web browser, you'll need to expose it as a service. To expose it as a service, run this command.

```
$ kubectl expose deployment hello-node --type=LoadBalancer
```

The type was specified as a `LoadBalancer` because Kubernetes will expose the IP outside of the cluster. If you were running a load balancer in a cloud environment, this how you'd provision an external IP address. However, in this case, it exposes your application as a service in Minikube. And now, finally, you get to see your application. Running this command will open a new browser window with your application.

```
$ minikube service hello-node
```

![Minikube: Exposing Hello Minikube application in browser](https://cdn.fedoramagazine.org/wp-content/uploads/2017/06/minikube-hello-world-browser-e1497995645454.png)

Congratulations, you deployed your first containerized application via Kubernetes! But now, what if you need to our small Hello World application?

## How do we push changes?

The time has come when you're ready to make an update and push it. Edit your `server.js` file and change "Hello world!" to "Hello again, world!"

```
response.end('Hello again, world!');
```

And we'll build another Docker image. Note the version bump.

```
$ docker build -t hello-node:v2 .
```

Next, you need to give Kubernetes the new image to deploy.

```
$ kubectl set image deployment/hello-node hello-node=hello-node:v2
```

And now, your update is pushed! Like before, run this command to have it open in a new browser window.

```
$ minikube service hello-node
```

If your application doesn't come up any different, double-check that you updated the right image. You can troubleshoot by getting a shell into your pod by running the following command. You can get the pod name from the command run earlier (`kubectl get pods`). Once you're in the shell, check if the `server.js` file shows your changes.

```
$ kubectl exec -it <pod-name> bash
```

## Cleaning up

Now that we're done, we can clean up the environment. To clear up the resources in your cluster, run these two commands.

```
$ kubectl delete service hello-node
$ kubectl delete deployment hello-node
```

If you're done playing with Minikube, you can also stop it.

```
$ minikube stop
```

If you're done using Minikube for a while, you can unset Minikube Docker daemon that we set earlier in this guide.

```
$ eval $(minikube docker-env -u)
```

## Learn more about Kubernetes

You can find the [original tutorial](https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/) in the Kubernetes documentation. If you want to read more, there's plenty of great information online. The [documentation](https://kubernetes.io/docs/home/) provided by Kubernetes is thorough and comprehensive.

Questions, Minikube stories, or tips for beginners? Add your comments below.
