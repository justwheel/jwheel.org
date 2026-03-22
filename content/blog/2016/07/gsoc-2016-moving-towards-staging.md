---
title: "GSoC 2016: Moving towards staging"
date: 2016-07-29
categories: 
  - "fedora"
tags: 
  - "ansible"
  - "fedora-commops"
  - "fedora-infrastructure"
  - "fedora"
  - "fedora-magazine"
  - "fedora-planet"
  - "flock"
  - "flock-2016"
  - "gsoc"
  - "summer-activities"
  - "wordpress"
coverImage: "Google-Summer-of-Code-announcement.png"
---

This week wraps up for July and the last period of Google Summer of Code (GSoC 2016) is almost here. As the summer comes to a close, I'm working on the last steps for preparing my project for deployment into Fedora's [Ansible infrastructure](https://infrastructure.fedoraproject.org/cgit/ansible.git/). Once it checks out in a staging instance, it can make the move to production.

<!--more-->

## Next steps for GSoC 2016

My last steps for the project are moving closer to production. Earlier this summer, the best plan of action was to use my [development cloud instance](http://derezzed.justinwflory.com/) for quick, experimental testing. Once a point of stability is reached, it would be tested on a staging instance of the real [Fedora Magazine](https://stg.fedoramagazine.org/) or Community Blog. Once reviewed and tested, it would work its way to production for managing future installations and upgrades for any WordPress platform in Fedora.

When the time comes to move it to production, I will file a ticket in the [Infrastructure Trac](https://fedorahosted.org/fedora-infrastructure/) with my patch file to the Ansible repository.

## One last correction

One sudden difficulty I've found is using the `synchronize` module in my upgrade playbook. Originally, I was copying and replacing the files using the `copy` module to carry out this, but I found `synchronize` to offer a better solution, using `rsync`. However, after switching, I ran into a small error that had me hung up.

When running the upgrade playbook, it would trigger an issue with `rsync` requiring a TTY session to work as a privileged user. I found a [filed bug](https://github.com/ansible/ansible/issues/4676) for this in the Ansible repository. Fixing it required setting a specific flag in the server configuration when using `rsync`. To avoid doing this, I altered my upgrade playbook to not avoid dependence on a root user for running, and instead using user and group permissions for the `wordpress` user. I'm working through smoothing out a few minor hiccups with the `synchronize` module during today, mostly dealing with the directory not being found when executing the module, even though it exists.

## Flock 2016

On Sunday, I'll be [flying out to Poland](https://jwfblog.wpenginepowered.com/2016/07/czesc-poland-back-europe/) for [Flock 2016](https://flocktofedora.org/), Fedora's annual contributor conference. During Flock, I'll meet several other Fedora contributors in person, including my mentor. We plan to set up the staging instance either later tonight or during Flock, depending on how time ends up going.

I'll also be delivering a talk and hosting a workshop during the week as well! One of the workshops I'm hoping to attend is the [Ansible best practice working session](https://flock2016.sched.org/event/76oY/ansible-best-practice-working-session). I'll be seeing if there's anything I can glean to build into the last week of the project during the workshop.
