---
title: "Introduction to Kubernetes with Fedora"
date: 2017-07-03
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
  - "research-and-learning"
  - "scalability"
  - "system-administration"
  - "things-you-should-know-understand"
images: ["/blog/2017/07/k8s-1-intro.jpg"]
---

_**This article was originally published [on the Fedora Magazine](https://fedoramagazine.org/introduction-kubernetes-fedora/).**_

* * *

_This article is part of a short series that introduces Kubernetes. This beginner-oriented series covers some higher level concepts and gives examples of using Kubernetes on Fedora._

* * *

The information technology world changes daily, and the demands of building scalable infrastructure become more important. Containers aren't anything new these days, and have various uses and implementations. But what about building scalable, containerized applications? By itself, Docker and other tools don't quite cut it, as far as building the infrastructure to support containers. How do you deploy, scale, and manage containerized applications in your infrastructure? This is where tools such as Kubernetes comes in. [Kubernetes](https://kubernetes.io/) is an open source system that automates deployment, scaling, and management of containerized applications. Kubernetes was originally developed by Google before being donated to the [Cloud Native Computing Foundation](https://en.wikipedia.org/wiki/Linux_Foundation#Cloud_Native_Computing_Foundation), a project of the [Linux Foundation](https://www.linuxfoundation.org/). This article gives a quick precursor to what Kubernetes is and what some of the buzzwords really mean.

<!--more-->

## What is Kubernetes?

Kubernetes simplifies and automates the process of deploying containerized applications at scale. Just like Ansible [orchestrates software](https://fedoramagazine.org/using-ansible-provision-vagrant-boxes/), Kubernetes orchestrates deploying infrastructure that supports the software. There are various "layers of the cake" that make Kubernetes a strong solution for building resilient infrastructure. It also assists with making systems that can grow at scale. If your application has increasing demands such as higher traffic, Kubernetes helps grow your environment to support increasing demands. This is one reason why Kubernetes is helpful for building long-term solutions for complex problems (even if it's not complex… yet).

![Kubernetes: The high level design](https://cdn.fedoramagazine.org/wp-content/uploads/2017/06/kubernetes-high-level-design.jpg "Kubernetes: The high level design. Daniel Smith, Robert Bailey, Kit Merker (https://www.slideshare.net/RohitJnagal/kubernetes-intro-public-kubernetes-meetup-4212015).")

At a high level overview, imagine three different layers.

- **Users**: People who deploy or create containerized applications to run in your infrastructure
- **Master(s)**: Manages and schedules your software across various other machines, for example in a clustered computing environment
- **Nodes**: Various machines to support the application, called _kubelets_

These three layers are orchestrated and automated by Kubernetes. One of the key pieces of the master (not included in the visual) is **etcd**. etcd is a lightweight and distributed key/value store that holds configuration data. Each node, or kubelet, can access this data in etcd through a HTTP/JSON API interface. The components of communication between master and node such as etcd are explained [in the official documentation](https://kubernetes.io/docs/concepts/architecture/master-node-communication/).

Another important detail not shown in the diagram is that you might have many masters. In a high-availability (HA) set-up, you can keep your infrastructure resilient by having multiple masters in case one happens to go down.

## Terminology

It's important to understand the concepts of Kubernetes before you start to play around with it. There are many core concepts in Kubernetes, such as services, volumes, secrets, daemon sets, and jobs. However, this article explains four that are helpful for the next exercise of building a mini Kubernetes cluster. The three concepts are _pods_, _labels_, _replica sets_, and _deployments_.

#### [Pods](https://kubernetes.io/docs/concepts/workloads/pods/pod/)

If you imagine Kubernetes as a Lego® castle, pods are the smallest block you can pick out. By themselves, they are the smallest unit you can deploy. The containers of an application fit into a pod. The pod can be one container, but it can also be as many as needed. Containers in a pod are unique since they share the Linux namespace and aren't isolated from each other. In a world before containers, this would be similar to running an application on the same host machine.

When the pods share the same namespace, all the containers in a pod:

- Share an IP address
- Share port space
- Find each other over _localhost_
- Communicate over IPC namespace
- Have access to shared volumes

But what's the point of having pods? The main purpose of pods is to have groups of "helping" containers on the same namespace (co-located) and integrated together (co-managed) along with the main application container. Some examples might be logging or monitoring tools that check the health of your application, or backup tools that act when certain data changes.

In the big picture, containers in a single pod are always scheduled together too. However, Kubernetes doesn't automatically reschedule them to a new node if the node dies (more on this later).

#### [Labels](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)

Labels are a simple but important concept in Kubernetes. Labels are key/value pairs attached to _objects_ in Kubernetes, like pods. They let you specify unique attributes of objects that actually mean something to humans. You can attach them when you create an object, and modify or add them later. Labels help you organize and select different sets of objects to interact with when performing actions inside of Kubernetes. For example, you can identify:

- **Software releases**: Alpha, beta, stable
- **Environments**: Development, production
- **Tiers**: Front-end, back-end

Labels are as flexible as you need them to be, and this list isn't comprehensive. Be creative when thinking of how to apply them.

#### [Replica sets](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/)

Replica sets are where some of the magic begins to happen with automatic scheduling or rescheduling. Replica sets ensure that a number of pod instances (called _replicas_) are running at any moment. If your web application needs to constantly have four pods in the front-end and two in the back-end, the replica sets are your insurance that number is always maintained. This also makes Kubernetes great for scaling. If you need to scale up or down, change the number of replicas.

When reading about replica sets, you might also see _replication controllers_. They are somewhat interchangeable, but replication controllers are older, semi-deprecated, and less powerful than replica sets. The main difference is that sets work with more advanced set-based selectors -- which goes back to labels. Ideally, you won't have to worry about this much today.

Even though replica sets are where the scheduling magic happens to help make your infrastructure resilient, you won't actually interact with them much. Replica sets are managed by deployments, so it's unusual to directly create or manipulate replica sets. And guess what's next?

#### [Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

Deployments are another important concept inside of Kubernetes. Deployments are a declarative way to deploy and manage software. If you're familiar with Ansible, you can compare deployments to the playbooks of Ansible. If you're building your infrastructure out, you want to make sure it is easily reproducible without much manual work. Deployments are the way to do this.

Deployments offer functionality such as revision history, so it's always easy to rollback changes if something doesn't work out. They also manage any updates you push out to your application, and if something isn't working, it will stop rolling out your update and revert back to the last working state. Deployments follow the mathematical property of [idempotence](https://en.wikipedia.org/wiki/Idempotence), which means you define your specs once and use them many times to get the same result.

Deployments also get into imperative and declarative ways to build infrastructure, but this explanation is a quick, fly-by overview. You can read more [detailed information](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) in the official documentation.

## Installing on Fedora

If you want to start playing with Kubernetes, install it and some useful tools from the Fedora repositories.

```
sudo dnf install kubernetes
```

This command provides the bare minimum needed to get started. You can also install other cool tools like _cockpit-kubernetes_ (integration with [Cockpit](http://cockpit-project.org/)) and _kubernetes-ansible_ (provisioning Kubernetes with [Ansible](https://www.ansible.com/) playbooks and roles).

## Learn more about Kubernetes

If you want to read more about Kubernetes or want to explore the concepts more, there's plenty of great information online. The [documentation](https://kubernetes.io/docs/home/) provided by Kubernetes is fantastic, but there are also other helpful guides from [DigitalOcean](https://www.digitalocean.com/community/tutorials/an-introduction-to-kubernetes) and [Giant Swarm](https://blog.giantswarm.io/understanding-basic-kubernetes-concepts-i-introduction-to-pods-labels-replicas/). The next article in the series will explore building a mini Kubernetes cluster on your own computer to see how it really works.

Questions, Kubernetes stories, or tips for beginners? Add your comments below.
