---
title: "Deploy CoreOS Tectonic to Amazon Web Services (AWS)"
date: 2017-07-28
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

_This is a short series to introduce Kubernetes, what it does, and how to experiment with it on Fedora. This is a beginner-oriented series to help introduce some higher level concepts and give examples of using it on Fedora. In the first post, we covered [key concepts in Kubernetes](https://fedoramagazine.org/introduction-kubernetes-fedora/). The second post showed how to build a [single-node Kubernetes deployment](https://fedoramagazine.org/minikube-kubernetes/) on your own computer. This post builds on top of the Fedora Magazine series by showing how to deploy CoreOS Tectonic to Amazon Web Services (AWS)._

* * *

Welcome back to the **Kubernetes and Fedora** series. Each week, we build on the previous articles in the series to help introduce you to using Kubernetes. This article takes off from running Kubernetes on your own hardware and moves us one step closer to the cloud. By the end of this article, you will…

- Understand what CoreOS Tectonic is
- Set up Amazon Web Services (AWS) for Tectonic
- Deploy Tectonic to AWS

This article is also based off of the excellent tutorial provided in the [CoreOS documentation](https://coreos.com/tectonic/docs/latest/tutorials/creating-aws.html). Let's get started!

<!--more-->

## What is Tectonic?

In the [first article](https://fedoramagazine.org/introduction-kubernetes-fedora/), some of the key concepts of Kubernetes and why it's useful were explained. Kubernetes automates the deployment and setting up of your infrastructure across the three layers (users, masters, nodes). If you're working on your own at a small scale, Kubernetes itself can be plenty to meet your needs. However, there is still a decent amount of human involvement in managing the different pieces of Kubernetes. If you're working with multiple people in a team and across different environments, vanilla Kubernetes can be a lot to manage. For an enterprise environment, there's still some unmet needs. This is where Tectonic steps in.

Tectonic is a commercial product offered by [CoreOS](https://coreos.com/), the providers of [Container Linux](https://coreos.com/os/docs/latest) and the original developers of `etcd`, now one of the core components of Kubernetes. Tectonic takes all of the open source components and pre-packages them. The self-proclaimed goal of doing this is to let anyone build a Google-style infrastructure into a cloud or on-premise environment. The outcome for the user is that it's easy to install a Kubernetes infrastructure across many different environments. In addition to simplifying the installation of the various components of a Kubernetes stack, Tectonic also provides a management console, a container registry for building and sharing containers, additional tools for deployment, and a few other nice features.

If we think about Kubernetes as a cake like we did before with three layers, Tectonic is like the box you set it in. Now, you can take your cake anywhere, move it around, and stack it with other cakes-in-a-box. All of your cakes are in their own boxes and you don't have to worry about them accidentally being damaged. If you're still a little confused, this diagram might help make more sense of it.

\[caption id="attachment\_17848" align="aligncenter" width="350"\]![Understanding where CoreOS Tectonic fits into the Kubernetes puzzle](https://cdn.fedoramagazine.org/wp-content/uploads/2017/06/platform-features.png) Understanding where Tectonic fits into the Kubernetes puzzle. From [coreos.com/tectonic](https://coreos.com/tectonic/)\[/caption\]

Fortunately, Tectonic has a free license that lets you use it for ten nodes. In this example, we'll register, get a free license, and deploy it into AWS.

(_Note_: If you want to revert anything we do in this example, there's an easy way to dismantle it across AWS and bring your bill to $0.00.)

## Pre-requisites

In order to successfully run this guide, there's a few things you'll need first.

- **Amazon Web Services (AWS) account** (_free_)
    - Register [here](https://aws.amazon.com)
- **CoreOS Tectonic account and license** (_free_)
    - Register [here](https://account.coreos.com/)
- **A root-level or sub-domain** (_e.g. example.com or k8s.example.com_)
    - If you look around, you can probably find some for less than USD$1 a year if you need one
- **Curiosity**!

## Setting up DNS with Route 53

The first things we'll do is set up our domain with Route 53 in AWS. Route 53 can do a lot of things, like DNS management, traffic management, availability monitoring, domain registration, and more. However, we're only going to be using it for DNS management. Tectonic will use this to automatically provision DNS records for internal and external use.

#### Add your domain

\[caption id="attachment\_17849" align="alignright" width="283"\]![Adding a new domain to AWS Route 53 for Tectonic](https://cdn.fedoramagazine.org/wp-content/uploads/2017/06/tectonic-add-domain-route-53-283x300.png) Adding a new domain to AWS Route 53 for Tectonic\[/caption\]

To add your domain to Route 53, follow these steps from AWS.

1. From _Services_, select _Networking & Content Delivery_ > _Route 53_.
2. Select _Hosted zones_ from the left pane and click _Create Hosted Zone_.
3. Enter your domain or sub-domain, add a comment if you want, and choose a Public Zone for the type.

Once you've done this, you can go ahead and click "_Create_".

#### Change the nameservers

After adding the hosted zone to Route 53, you'll need to change the nameservers for your domain via the domain registrar (whoever you bought the domain from). Usually it should be easy to find this, but it varies among registrars. If you're having a hard figuring out how to do this, try searching for a how-to or contacting your registrar's support.

After you added the hosted zone, you should see the nameservers in Route 53. There will be four nameservers provided there. You can copy and paste them from Route 53 to your domain registrar. Also note that if you're using a subdomain, the instructions might be a little different. You can read how to do this in the [Route 53 documentation](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/creating-migrating.html).

The nameservers could take minutes or hours to update, depending on how lucky you are. If you're impatient and want to check, open up a terminal and run this command. If you see the AWS nameservers in the output, then your domain has propagated and is now usable by Route 53.

```
dig -t ns <example.com>
```

## Configuring EC2 with SSH key pair

This guide assumes you already have an SSH key pair created on your system. If you don't have one generated, you can read how to generate one [here](https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/).

The next step for us is to add an SSH key pair to EC2, one of the compute engine products offered by AWS. We'll import an existing key on your system into EC2.

1. From AWS, go to _Services_ > _Compute_ > _EC2_.
2. Confirm that you are in the **correct EC2 region** by checking the location next to your name in the menu bar.
3. Under _Network & Security_, click _Key Pairs_.
4. Click _Import Key Pair_.
5. Either upload your public key file (`~/.ssh/id_rsa.pub`) or paste it into the text field. Don't forget to give it a name.

And that's all you need to do!

## Assigning AWS user privileges

Tectonic does the magic of setting up AWS for you, so you don't have to manually add and create the services from the web interface. In order to do this, you need to add a user account that Tectonic can use to do all of the provisioning it needs. To do this, you'll need to create a new Access ID and Secret key pair from AWS.

1. Select _Services_ > _Security, Identity & Compliance_ > _IAM_.
2. From the left hand pane, click _Users_, then click _Add user_.
3. Set the user details:
    1. _User name_ can be anything you like (I used `tectonic-mydomain.com`)
    2. _Access type_ only needs to be _Programmatic access_
4. For permissions, click _Add user to group_ and create a new group for your user.
5. When creating a new group, attach only the policies needed by Tectonic to operate correctly:
    1. `AmazonEC2FullAccess`
    2. `IAMFullAccess`
    3. `AmazonS3FullAccess`
    4. `AmazonVPCFullAccess`
    5. `AmazonRoute53FullAccess`
6. Finish creating the user. You'll then see the _Access key ID_ and _Secret access key_. Hold onto these, you'll need them later. You won't get to see the secret key again!

Now we're ready to install Tectonic! Let's grab your credentials next.

## Download Tectonic credentials

Jump back over to the [CoreOS accounts page](https://account.coreos.com/). When you're logged in, you'll see the _Account Assets_ area. Download the CoreOS license file and pull secret. Later on in the installer, you'll need to insert these to finish the installation.

## Running the installer

Now things get interesting! We finally get to install and deploy Tectonic into AWS. The installer takes the form of a graphical installer in your web browser. To use the installer, you need to download the binary and run it. If you're curious, you can find the installer source code [on GitHub](https://github.com/coreos/tectonic-installer).

#### Download and run installer

First, open up a new terminal window and navigate to a directory you want to download the installer to. Even though you likely won't need to run the installer again, you will want to hang on to this if you ever want to easily dismantle everything in AWS later.

```
curl -O https://releases.tectonic.com/tectonic-1.6.4-tectonic.1.tar.gz
```

Next, extract the tarball and navigate into the directory.

```
tar -xzvf tectonic-1.6.4-tectonic.1.tar.gz
cd tectonic/tectonic-installer
```

Now execute the installer binary. After running this, a new browser window will open that features the graphical installer.

```
./linux/installer
```

\[caption id="attachment\_17850" align="aligncenter" width="857"\]![Now we're ready to deploy Tectonic into AWS!](https://cdn.fedoramagazine.org/wp-content/uploads/2017/06/tectonic-installer-aws.png) Now we're ready to deploy Tectonic into AWS!\[/caption\]

#### Running the installer

The installer is thorough and assumes safe defaults for most of the steps. Be sure to have your AWS Access and Secret ID keys on hand. You should be able to run through the installer without issue. If you're confused about what any of the values mean or want to make custom changes, you can read more in the [upstream documentation](https://coreos.com/tectonic/docs/latest/tutorials/installing-tectonic.html).

Once you're finished, congrats! You've successfully installed Tectonic!

## Check out your Tectonic install

Once you finish the installation successfully, your Tectonic installation will be accessible within AWS. You can navigate to the domain you specified during the install to find it. Unless you added a CA authority and certificates, your browser will probably complain about invalid SSL certificates, but you can ignore the warning safely. It might also take a few minutes before the URL is accessible, so if you were looking for a coffee or tea break, now would be a good time!

Once you're logged in, you should see something like this.

\[caption id="attachment\_17851" align="aligncenter" width="1350"\]![Looking at a freshly installed Tectonic status page on AWS](https://cdn.fedoramagazine.org/wp-content/uploads/2017/06/tectonic-status-page.png) Looking at a freshly installed Tectonic status page on AWS\[/caption\]

\[caption id="attachment\_17852" align="aligncenter" width="2434"\]![A more advanced use case of what Tectonic can do with monitoring](https://cdn.fedoramagazine.org/wp-content/uploads/2017/06/prometheus-monitoring.png) A more advanced use case of what Tectonic can do with monitoring\[/caption\]

## Blow it all away!

If you're like me, you might be frustrated by guides that tell you how to install things but not how to take it all apart. Fortunately, this guide not only tells you how to do that, but the Tectonic installer also makes it super easy to do. If you're sure that you're done with Tectonic and don't want any leftovers to remain in AWS, this is the best way to do it, instead of deleting everything manually from the AWS Console.

Every installation has a time-stamped folder in the `tectonic` directory we used earlier. First, you need to navigate into the specific folder for the cluster you installed. It's important to be inside of this directory first.

```
cd tectonic/tectonic-installer/linux/clusters/<CLUSTERNAME>
```

`<CLUSTERNAME>` will be the time-stamped directory. Once you're in the folder, run this command to trigger the uninstaller. After running this, you'll see the installer slowly dismantle everything and delete any leftovers in AWS.

```
../../terraform destroy
```

Once it finishes, you should see an output message confirming how many AWS resources were destroyed. And now you're back to where you started.

## Learn more about Tectonic

If you thought this was exciting and want to learn more, there is no shortage of resources for you to read. You can learn more about Tectonic from the [CoreOS website](https://coreos.com/tectonic/) or the [original release announcement](https://tectonic.com/blog/announcing-tectonic/). You can also dig into the installer's source code [on GitHub](https://github.com/coreos/tectonic-installer). If you're still trying to wrap your head around Tectonic, there's a good write-up [on virtualizationreview.com](https://virtualizationreview.com/articles/2017/04/04/coreos-tectonic-to-shake-up-kubernetes.aspx).

Next week, we'll install a simple guestbook application to our Tectonic installation to see how it all works and what you can do with it. Stay tuned!

Questions, Tectonic stories, or tips for beginners? Add your comments below.
