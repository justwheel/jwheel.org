---
title: "Setting up Vagrant for testing Ansible"
date: 2016-06-10
categories: 
  - "fedora"
  - "foss"
  - "tech"
tags: 
  - "ansible"
  - "devops"
  - "fedora-infrastructure"
  - "fedora"
  - "fedora-planet"
  - "gsoc"
  - "open-source"
  - "vagrant"
  - "virtual-machines-vm"
coverImage: "/img/Google-Summer-of-Code-announcement.png"
---

As part of my [Google Summer of Code](https://summerofcode.withgoogle.com/) project proposal for the [Fedora Project](https://fedoraproject.org/wiki/Overview), I've spent a lot of time learning about the ins and outs of Ansible. [Ansible](https://www.ansible.com/) is a handy task and configuration automation utility. In the Fedora Project, Ansible is [used extensively](https://infrastructure.fedoraproject.org/cgit/ansible.git/) in Fedora's infrastructure. But if you're first starting to learn Ansible, it might be tricky to test and play with it if you don't have production or development servers you can use. This is where Vagrant comes in.

<!--more-->

## What is Vagrant?

\[caption id="attachment\_318" align="alignright" width="246"\][![Together, Vagrant and Ansible are a powerful combination.](/blog/2016/06/Vagrant.png)](/blog/2016/06/Vagrant.png) Together, Vagrant and Ansible are a powerful combination.\[/caption\]

Many people in the tech industry are already familiar with virtual machines (VMs) and using them for testing. If using a virtual machine is useful for testing and experimentation, Vagrant takes that idea and makes it a thousand times for powerful. [Vagrant](https://www.vagrantup.com/) creates and configures a single virtual machine or several groups of inter-connected virtual machines. For someone trying to learn configuration management software like Ansible (or Puppet, or Chef, or Salt…), it features tight integration for creating virtual machines from playbooks.

Using Vagrant allows you to make quick, simple, and easy changes in a safe, local environment. Vagrant is also incredibly easy to set up, and in my experiences, it also ran well on a laptop. My trusty Toshiba Satellite with 8GB of RAM and an Intel i3 chip was able to handle three CentOS 7 virtual machines at once, and still manage to do other regular tasks.

## Installing Vagrant for Fedora

Since I'm working with Fedora on my hardware while working on the Fedora Project over the summer, it would make sense for this guide to cover how to install and set up Vagrant inside of Fedora. However, I imagine it's similar for most other distributions, so try adapting these commands for your own distribution.

The Fedora repositories have a Vagrant package available. To install it, run the following command.

```
$ sudo dnf install vagrant
```

This will pull down Vagrant and all the dependencies it needs to run. However, what it won't do is pull down some of the many providers that it might need to use a virtual machine.

### Vagrant and providers

For my testing, I used a [centos7 box image](https://atlas.hashicorp.com/geerlingguy/boxes/centos7) from geerlingguy. This image creates a current, updated CentOS 7 virtual machine. In order to use it, you must have one of the two providers available: VMware or VirtualBox. Seeing as how VirtualBox is easier for me to install and use on my system, I chose to use VirtualBox as the "provider" for building and simulating the CentOS 7 box within Vagrant.

It took a bit of figuring out at first, but I found a current and well-documented [guide](http://www.if-not-true-then-false.com/2010/install-virtualbox-with-yum-on-fedora-centos-red-hat-rhel/) on how to install VirtualBox on to a Fedora 22 or 23 system. For a more detailed explanation of how to do it, you can read the [instructions](http://www.if-not-true-then-false.com/2010/install-virtualbox-with-yum-on-fedora-centos-red-hat-rhel/), but for simplicity, I have the commands here to show how to add it to your Fedora system quickly.

```
$ sudo dnf upgrade
$ cd /etc/yum.repos.d/
$ sudo wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
$ sudo dnf install VirtualBox-5.0 binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms
$ sudo /usr/lib/virtualbox/vboxdrv.sh setup
$ sudo usermod -a -G vboxusers your_username
```

From here,  VirtualBox  will be available as a provider within Vagrant.

## Running a CentOS 7 image

Now that you have both Vagrant and VirtualBox installed, you can create a Vagrant virtual machine with this image. Navigate to a new directory you want to use for managing your virtual machines. Once there, you can use the following commands to start your CentOS 7 virtual machine.

```
$ vagrant box add geerlingguy/centos7
$ vagrant init geerlingguy/centos7
$ vagrant up --provider virtualbox
```

After a lot of downloading and then waiting for the first setup to finish, you should receive a notification that your virtual machine started! Huzzah! You can log in directly to it by typing `vagrant ssh` in the same directory you ran the above commands.

There's a lot of cool things you can do to set up your virtual machines and configure how they start. For example, you can choose to use the VirtualBox GUI for running your virtual machines if you don't want to SSH into it. You can tweak several different flags to alter the environment for the virtual machine. However, that is out of the scope of this guide, and there is a fair amount of documentation already online.

## Provisioning with Ansible

The fun part (and what was really cool for me) was provisioning new virtual machines with Ansible. You can instruct Vagrant to seek an Ansible playbook when creating a new virtual machine. It will use the instructions of the playbook to configure, install, or tweak whatever is in the playbook, as if it's being run for the first time. Or maybe it's the second, the third, the fourth time you've run it. In either case, the idempotent nature of Ansible should help make sure you avoid repeating anything that doesn't need repeating.

In order to tell Vagrant to search for an Ansible playbook, you will need to edit the `Vagrantfile` for wherever you initialized Vagrant. Open it up in your favorite text editor and add the following bits at the bottom, but before the final `end` statement.

```
config.vm.provision "ansible" do |ansible|
  ansible.playbook = "playbook.yml"
end
```

These short but sweet instructions tell Vagrant to look for a `playbook.yml` file when starting this virtual machine. It will then be easy to provision (i.e. configure / modify / change) the machine with your playbook later on.

### Writing the playbook

For this blog post, I'll offer a simple but clear example of a playbook you can use to start a Vagrant machine. This snippet specifically comes from _[Ansible for DevOps](http://www.ansiblefordevops.com/)_ by [Jeff Geerling](http://jeffgeerling.com/), which I have (and am) using as a guide as I continue to learn more about Ansible (I highly recommend the book, consider getting a copy).

```
---
- hosts: all
  sudo: yes
  tasks:
  - name: Ensure NTP (for time synchronization) is installed.
    yum: name=ntp state=present
  - name: Ensure NTP is running.
    service: name=ntpd state=started enabled=yes
```

All this example playbook does installs NTP if it is not present on the system, and then start and enable it, if it is not already. This is a very simple example, but it's good for getting started quickly.

### Running the playbook

In the same directory as your `Vagrantfile`, create a `playbook.yml` with the above content. Once you have the YAML file there, running the following command will run the Ansible playbook and allow you to see how it runs.

```
$ vagrant provision
```

Now, Vagrant will take your playbook and instantly run it in your machine. If all goes right, your virtual machine will now have NTP installed and be syncing your clock to the Internet! While a simple task, it was a satisfying feeling for me to see this run, but also to imagine the other possibilities that this could be used for. It would be easy to run a playbook on one, two, ten, a hundred, a thousand servers, and have it do the same thing on all of them.

The automation was fascinating to me and began giving me ideas of how I could automate my infrastructure, as well as to creating one for WordPress (for my GSoC project).

Congratulations! By the end of this short but (hopefully) useful guide, you will have Vagrant virtual machines that are controlled and orchestrated by Ansible.
