---
title: "GSoC 2016 Weekly Rundown: Documentation and upgrades"
date: 2016-07-18
categories: 
  - "fedora"
tags: 
  - "ansible"
  - "fedora-commops"
  - "fedora-infrastructure"
  - "fedora-magazine"
  - "fedora-planet"
  - "flock"
  - "flock-2016"
  - "gsoc"
  - "summer-activities"
  - "wordpress"
images: ["/img/Google-Summer-of-Code-announcement.png"]
---

This week and the last were busy, but I've made some more progress towards creating the last, idempotent product for managing WordPress installations in Fedora's Infrastructure for GSoC 2016. The past two weeks had me mostly working on writing the standard operating procedure / documentation for my final product as well as diving more into handling upgrades with WordPress. My primary playbook for installing WordPress is mostly complete, pending [one last annoyance](https://serverfault.com/questions/790104/using-external-variables-inside-of-an-ansible-template/790111?noredirect=1#comment999485_790111).

<!--more-->

## Documentation

The first complete draft of my documentation for managing WordPress installations in Fedora's infrastructure is available on my Pagure repository. The guide covers deployment, including upgrades, as well as more notes about working with the playbooks. As my project work begins to finish, the documented procedure is an outline for the final work. It will also be expanded as I close out the project.

## Installing new WordPress site

After testing on my development instance in the Fedora cloud, my playbook is able to successfully install multiple WordPress sites to various hosts (pending [one caveat](https://serverfault.com/questions/790104/using-external-variables-inside-of-an-ansible-template/) for automatically setting up MySQL databases). I was able to spin up multiple sites quickly and easily to a point where I was satisfied with how it worked.

A few challenges I faced in this part were figuring out templating the right information into the WordPress configuration file. I was originally going to try using a variable file, but due to the issue of storing private information, I was trying to use external variables. After revisiting the idea with Patrick, I'm going to use a variables file with the information for each hypothetical installation. This file will then be stored in the private Ansible repository that holds server and application credentials.

Determining SELinux flags and contexts was also challenging. I had to learn which ones to apply to WordPress for basic functionality to still work (particularly for things like uploading media files to the server and letting WordPress cron work as expected). I'm not wholly satisfied with how I implemented it yet, as I want to dig more into setting the contexts with different parts of modules like `unarchive` and `file`, if possible.

## Upgrading and master

The last significant task to handle is writing the playbook for handling upgrades for WordPress installations. There were two options originally available. The first option would be to allow upgrading via the WordPress admin panel. The second option would be writing a playbook to handle the upgrade. We opted for the second method as this will allow the files on the web server to be read-only, which will serve as an extra measure of hardened security.

I hope to have a playbook created in the next week to tackle upgrading an existing WordPress installation to a newer version. This will be the last significant task of my proposal, before I begin taking what I have so far and finding ways to integrate it into Fedora's infrastructure.

One of these smaller but important tasks will be writing a "master" playbook to orchestrate the entire process of setting up a machine to run it (and referring to the necessary roles). Some of these roles I'll be referring to are the `httpd` and `mariadb` roles.

## Moving towards Flock

With Flock fast on approach, I'm hoping to have the majority of my project work finished and completed before that time frame. Anything past Flock should mostly be tidying up or fully documenting any changes made in the last stretch. This is my target goal at the moment! I'm looking forward to being a part of Flock again this year and meeting many members of the Fedora community.
