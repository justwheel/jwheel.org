---
title: "GSoC 2016 Weekly Rundown: Assembling the orchestra"
date: 2016-06-24
categories: 
  - "fedora"
  - "foss"
tags: 
  - "ansible"
  - "fedora-infrastructure"
  - "fedora-magazine"
  - "fedora-planet"
  - "gsoc"
images: ["/img/Google-Summer-of-Code-announcement.png"]
---

This week is the [Google Summer of Code 2016](https://summerofcode.withgoogle.com/) midterm evaluation week. Over the past month since the program started, I've learned more about the technology I'm working with, implementing it within my infrastructure, and moving closer to completing my proposal. My [original project proposal](https://fedoraproject.org/wiki/GSOC_2016/Student_Application_jflory7) details how I am working with [Ansible](https://www.ansible.com/) to bring improved automation for WordPress platforms within Fedora, particularly to the [Fedora Community Blog](https://communityblog.fedoraproject.org/) and the [Fedora Magazine](https://fedoramagazine.org/).

<!--more-->

## Understanding background

My project proposal originated from a discussion based on an observation about managing the Fedora Magazine. Fedora's infrastructure is entirely automated in some form, often times using Ansible playbooks to "conduct" the Fedora orchestra of services, applications, and servers. However, all the WordPress platforms within Fedora are absent from this automated setup. This has to do with the original context of setting up the platforms.

However, now that automation is present in so much of the Infrastructure through a variety of tasks and roles, it makes sense to merge the two existing WordPress platforms in Fedora into the automation. This was the grounds for my proposal back in March, and I've made progress towards learning a completely new technology and learning it by example.

## Initial research

[![GSoC 2016: "Ansible For DevOps" as a learning resource](/blog/2016/06/ansible-for-devops-cover.jpg)](/blog/2016/06/ansible-for-devops-cover.jpg)From the beginning, I've used two resources as guides and instructions for GSoC 2016. "[_Ansible For DevOps_](http://www.ansiblefordevops.com/)", a book by [Jeff Geerling](http://jeffgeerling.com/), has played a significant part in helping bootstrap me with Ansible and the in's and out's. I'm about halfway through the book so far, and it has helped profoundly with learning the technology. Special thanks to [Alex Wacker](http://impactvps.com/about.html) for introducing me to the book!

The second resource is, as one would expect, the [Ansible documentation](https://docs.ansible.com/). The documentation for Ansible is complete and fully explanatory. Usually if there is an Ansible-specific concept I am struggling with learning, or finding a module for accomplishing a task, the Ansible documentation helps point me in the right direction quickly.

## Research into practice

After making some strides through the book and the documentation, I began turning the different concepts into practical playbooks for my own personal infrastructure. I run a handful of machines for different purposes, ranging from my [Minecraft server](https://crystalcraftmc.com/), a [ZNC bouncer](https://irc.jwheel.org/), some [PHP forum websites](https://tipforums.com/), and more. Ever since I began using headless Linux servers, I've never explored automation too deeply. Every time I set up a new machine or a service, I would configure it all manually, file by file.

#### First playbook

After reading more about Ansible, I began seeing ways I could try automating things in my "normal" setup. This helped give a way to ease myself into Ansible without overwhelming myself with too large of tasks. I created repositories on Pagure for my [personal playbooks](https://pagure.io/jflory7-ansible) and [Minecraft playbooks](https://pagure.io/ccmc-ansible). The very first one I wrote was my "first 30 minutes" on a new machine. [This playbook](https://pagure.io/jflory7-ansible/blob/master/f/playbooks/basic-provisioning/initial-centos-rhel-7-setup.yml) sets up a RHEL / CentOS 7 machine with basic security measures and a few personal preferences ready to go. It's nothing fancy, but it was a satisfying moment to run it in my Vagrant machine and see it do all of my usual tasks on a new machine instantly.

For more information on using Ansible in a Vagrant testing environment, check out [my blog post](/blog/2016/06/setting-vagrant-testing-ansible/) about it below.

#### Moving to Minecraft

After writing the first playbook, I tried moving to focusing on some other areas I could try automating to improve my "Ansible chops". Managing my Minecraft server network is one place where I recognized I could improve automation. I spend a lot of time repeating the same sort of tasks, and having an automated way to do these tasks would make sense.

I started writing playbooks in the [adding](https://pagure.io/ccmc-ansible/blob/master/f/playbooks/add-servers.yml) and [restarting](https://pagure.io/ccmc-ansible/blob/master/f/playbooks/start-servers.yml) Minecraft servers based on the popular open source server software, [Spigot](https://www.spigotmc.org/). Writing these playbooks helped introduce me to different core modules in Ansible, like `lineinfile`, `template`, `copy`, `get_url`, and more.

I have also been using sites like ServerFault to find answers for any starting questions I have. Some of the changes between Ansible 1.x and 2.x caused some hiccups in [one case](https://serverfault.com/questions/784465/parse-through-a-list-of-ansible-variables-and-refer-to-itself-while-running-task/) for me.

#### Using Infrastructure resources

After getting a better feel for the basics, I started focusing less on my infrastructure and more on the project proposal. One of the key differences from me writing playbooks, roles, and tasks for my infrastructure is that there are already countless [Ansible resources](https://infrastructure.fedoraproject.org/cgit/ansible.git/) available from Fedora Infrastructure. For example, to create a WordPress playbook for Fedora Infrastructure, I would want to use the [`mariadb_server`](https://infrastructure.fedoraproject.org/cgit/ansible.git/tree/roles/mariadb_server) role for setting up a database for the site. Doing that in my playbook (or writing a separate role for it just for WordPress) would increase the difficulty of maintaining the playbooks and make it inconvenient for other members of Fedora Infrastructure.

## Creating a deliverable

In my personal Ansible repository, I have begun constructing the [deliverable product](https://pagure.io/jflory7-ansible/blob/master/f/playbooks/deliverables) for the end of the summer. So far, I have a playbook that creates a basic, single-site WordPress installation. The intention for the final deliverable is to have a playbook for creating a "base" installation of a [WordPress network](https://codex.wordpress.org/Create_A_Network), and then any other tasks for creating extra sites added to the network. This will make sure that any WordPress sites in Fedora are running the same core version, receive the same updates, and are consistent in administration.

I also intend to write documentation for standing up a WordPress site in Fedora based on my deliverable product. Fortunately, there is already a guide on [writing a new SOP](https://infrastructure.fedoraproject.org/cgit/infra-docs.git/tree/infra-sop.rst), so after talking with my mentor, [Patrick Uiterwijk](https://fedoraproject.org/wiki/User:Puiterwijk), on documentation expectations and needs next week, I will be referring back to this document as a guide for writing my own.

## Reflection on GSoC 2016 so far

I was hoping to have advanced farther by this point, but due to learning bumps and other tasks, I wasn't able to move at a pace as I hoped. However, since starting GSoC 2016, I've made some personal observations about the project and how I can improve.

- Despite being behind from where I wanted to be, I feel I am at a point where I am mostly on track and able to work towards completing my project proposal on schedule.
- I recognize communication on my progress has not been handled well, and I am making plans to make sure shorter, more frequent updates are happening at a consistent and regular basis. This includes a consistent, weekly (if not twice every week) blog post about my findings, progress, commits, and more.
- After talking with Patrick this week, we are going to begin doing more frequent check-ins about where I am in the project and making sure I am on track for where I should be.

#### Excerpt from GSoC 2016 evaluation form

As one last bit, I thought it would be helpful to share my answers from Google's official midterm evaluation form from the experience section.

###### "What is your favorite part of participating in GSoC?"

"Participating in GSoC gave me a means to continue contributing to an open source community I was still getting involved in. I began contributing to Fedora in September 2015, and up until the point when I applied for GSoC, I had anticipated having to give up my activity levels of contributing to open source while I maintained a job over the summer. GSoC enabled me to remain active and engaged with the Fedora Project community and it has kept me involved with Fedora.

The Fedora Project is also a strong user of Ansible, which is what my project proposal mostly deals with. My proposal gives me a lot of experience and the opportunity to learn new technology that not only allows me to complete my proposal, but also understand different levels and depths of contributing to the project far beyond the end of the summer. With the skills I am learning, I am being enabled as a contributor for the present and the future. To me, this is exciting as the area that I am contributing in has always been one that's interested to me, and this project is jump-starting me with the skills and abilities needed to be a successful contributor in the future.

GSoC is also actively teaching me lessons about time management and overcoming challenges of working remote (which I will detail in the next question). I believe the experience I am getting now from participating in GSoC allows me to improve on myself as an open source developer and contributor and learn important skills about working remotely with others on shared projects."

###### "What is the most challenging part of participating in GSoC?"

"The hardest part for me was (is) learning how to work remotely. In the past, when I was contributing at school, I had resources available to me where I could reach out to others nearby for assistance, places I could leave to focus, and a more consistent schedule. Working from home has required me to reach out for help either by improving how well I can search for something or reaching out to others in the project community about how to accomplish an objective.

There are also different responsibilities at home, and creating a focused, constructive space for me to focus on project work is an extremely important part of helping me accomplish my work. Learning to be consistent in my own work and setting my own deadlines is a large part of what I'm working on doing now. Learning the ability to follow and set personal goals for working on the project was a hard lesson to learn at first, but finding that balance quickly and swiftly is something that is helping me move forward."
