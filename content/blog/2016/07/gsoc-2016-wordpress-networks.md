---
title: "GSoC 2016 Weekly Rundown: Breaking down WordPress networks"
date: 2016-07-02
categories: 
  - "fedora"
tags: 
  - "fedora-infrastructure"
  - "fedora"
  - "fedora-planet"
  - "gsoc"
  - "open-source"
  - "research-and-learning"
  - "wordpress"
coverImage: "Google-Summer-of-Code-announcement.png"
---

This week, with an [initial playbook](https://pagure.io/jflory7-ansible/blob/master/f/playbooks/deliverables) for creating a WordPress installation created (albeit needing polish), my next focus was to look at the idea of creating a WordPress [multi-site network](https://codex.wordpress.org/Create_A_Network). Creating a multi-site network would offer the benefits of only having to keep up a single base installation, with new sites extending from the same core of WordPress. Before making further refinements to the playbook, I wanted to investigate whether a WordPress network would be the best fit for Fedora.

<!--more-->

## Background for Fedora

Understanding the background context for how WordPress fits into the needs for Fedora is important. There are two sites powered by WordPress within Fedora: the [Community Blog](https://communityblog.fedoraproject.org/) and the [Fedora Magazine](https://fedoramagazine.org/). Each site uses a different domain ([communityblog.fedoraproject.org](https://communityblog.fedoraproject.org/) and [fedoramagazine.org](https://fedoramagazine.org/), respectively).

At the moment, there are not any plans to set up or offer a blog-hosting service to contributors (and for good reason). The only two websites that would receive the benefits of a multi-site network would be the Community Blog and the Magazine. For now, the intended scale of expanding WordPress into Fedora is to these two platforms.

## Setting up the WordPress network

To test the possibilities of using a network for our needs, I used a development CentOS 7 machine for my project testing purposes. There are some [guidelines](https://codex.wordpress.org/Before_You_Create_A_Network) on creating networks for reading first before proceeding. After reading these, it was clear the approach to take was the domain method. I moved to the [installation guide](https://codex.wordpress.org/Create_A_Network) on the development machine.[![GSoC 2016 - Adding sites to WordPress network](https://blog.justinwflory.com/wp-content/uploads/2016/07/GSoC-2016-Adding-sites-to-WordPress-network-1024x474.png)](https://blog.justinwflory.com/wp-content/uploads/2016/07/GSoC-2016-Adding-sites-to-WordPress-network.png)

I wanted to document the process I was following for the multi-site network, so I created a [short log file](https://github.com/jflory7/logbook/blob/master/logs/gsoc/notes/multisite.md) of my observations and information I found as I proceeded.

One of the time burners of this section was picking up Apache again. A few years ago, I switched my own personal web servers to [nginx](http://nginx.com/) from Apache. Fedora's infrastructure [uses Apache](https://infrastructure.fedoraproject.org/cgit/ansible.git/tree/roles/apache) for its web servers. It took me a little longer than I had hoped to get familiar with it again, mostly with virtual hosts and SELinux contexts for WordPress media uploads. Despite the extra time it took with Apache, I feel like this will save me time later when I am working on polishing the final deliverable or working with the Apache roles available.

In addition to this, I also picked out the dependencies for WordPress, such as the PHP packages needed and setting up a MariaDB database. After a while, I was able to get the WordPress network established and running on the development machine. It was convenient having a testable interface at my fingertips to work with.

## WordPress network: Conclusion?

At the end of my testing and poking around, it appeared to me that there would not be an _easy_ solution to using a WordPress network for Fedora. The network had the best ability when set up to use wildcard sub-domains, which wouldn't be a plausible solution for us because of the two different domains. There were more manual ways of doing it (i.e. not in the WordPress interface) with Apache virtual hosts. However, I felt like it would be easier to write one playbook that handles a single WordPress installation, and can be run for both sites separately (or new sites).

Given that the factor of scale is two websites, I think maintaining two separate WordPress installations will be the easier method and save time and keep efficiency.

## This week's challenges

This week had a late start for me on Wednesday due to traveling on a [short vacation](https://apps.fedoraproject.org/calendar/meeting/4373/) with my family from Sunday to Tuesday. Coming back from the trip, I also have a new palette of responsibilities that I am assisting with in [Community Operations](https://fedoraproject.org/wiki/CommOps) and [Marketing](https://fedoraproject.org/wiki/Marketing), following [decause's departure](https://lists.fedoraproject.org/archives/list/commops@lists.fedoraproject.org/thread/CG5JS4DQ3G2TVA5YZX7LBOSXVNCUPTIB/) from Red Hat. I'm still working on finding a healthy balance of time and focus between other important tasks I am responsible for and my project work.

I'm hoping that having a full week will allow me to make further progress and continue to overcome some of the challenges that have arisen in the past few weeks.

## Next week's goals

For next week, I'm planning on focusing on my existing product and making it feel and run more like a "Fedora playbook". I mostly want to work on saving unnecessary effort and being consistent by tapping into the [existing Ansible roles](https://infrastructure.fedoraproject.org/cgit/ansible.git/tree/roles) in Fedora Infrastructure. This would make setting up an Apache web server, MySQL database, and a few other tasks more automated. It keeps the tasks and organization in a consistent manner as well since they are across Fedora's infrastructure already.

By next Friday, the plan is to have a more idempotent product that runs effectively and as expected in my development server. Beyond that, the next step would be to work on getting my site into a staging instance.
