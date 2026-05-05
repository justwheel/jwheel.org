---
title: "Google Summer of Code, Fedora Class of 2016"
date: 2016-04-27
categories: 
  - "education"
  - "fedora"
  - "foss"
tags: 
  - "fedora-magazine"
  - "fedora-planet"
  - "getting-started"
  - "gsoc"
  - "hfoss"
  - "summer-activities"
images: ["/img/Google-Summer-of-Code-announcement.png"]
---

This summer, I'm excited to say I will be trying on a new pair of socks for size.

Bad puns aside, I am actually enormously excited to announce that I am participating in this year's [Google Summer of Code](https://summerofcode.withgoogle.com/) program for the [Fedora Project](https://fedoraproject.org/wiki/Overview). If you are unfamiliar with Google Summer of Code (or often shortened to GSoC), Google describes it as the following.

> Google Summer of Code is a global program focused on bringing more student developers into open source software development. Students work with an open source organization on a 3 month programming project during their break from school.

I will work with the Fedora Project over the summer on the CommOps slot. As part of my proposal, I will assist with migrating key points of communication in Fedora, like the Fedora Magazine and Community Blog, to Ansible-based installations. I have a few more things planned up my sleeve too.

<!--more-->

## Google Summer of Code proposal

My proposal summary is on the [GSoC 2016 website](https://summerofcode.withgoogle.com/organizations/5630777857409024/#5114063432450048). The full proposal is available on the [Fedora wiki](https://fedoraproject.org/wiki/GSOC_2016/Student_Application_jflory7).

#### The What

The [Community Blog](https://fedoraproject.org/wiki/Community_Blog) is becoming an important part of the Fedora Project. This site is a shared responsibility between [CommOps](https://fedoraproject.org/wiki/CommOps) and the [Infrastructure](https://fedoraproject.org/wiki/Infrastructure) team. Unlike most applications in the Fedora infrastructure, the Community Blog is not based off Ansible playbooks. [Ansible](https://www.ansible.com/) is an open-source configuration management suite designed to make automation easier. Fedora already uses Ansible extensively across its infrastructure.

My task would consist of migrating the Community Blog (and by extension, [Fedora Magazine](https://fedoraproject.org/wiki/Magazine)) to an Ansible-based set up and writing the documentation for any related SOPs.

#### The Why

Ansible is a useful tool to make automation and configuration easier. In their current set up, the Community Blog and Fedora Magazine are managed separately from each other, and are managed by a single member of the Infrastructure team. By moving them to Ansible-based installations and merging the WordPress bases together, it provides the following benefits:

1. Makes it easier for other Infrastructure team members to fix, maintain, or apply updates to either site
2. Prevents duplicate work by maintaining a single, Ansible-based WordPress install versus two independent WordPress sites
3. Creates a standard operating procedure for hosting blog platforms within Fedora (can be used for other extensions in the future)

## Thanks to my mentors

I would like to issue a special thanks to my mentors, [Patrick Uiterwijk](https://fedoraproject.org/wiki/User:Puiterwijk) and [Remy DeCausemaker](https://fedoraproject.org/wiki/User:Decause). Patrick will be my primary mentor for the slot, as a member of the Fedora Infrastructure team. I will be working closest with him in the context of my proposal. I will also be working with Remy on the "usual" CommOps tasks that we work on week by week.

Another thanks goes out to all of those in the Fedora community who have positively affected and influenced my contributions. Thanks to countless people, I am happy to consider Fedora my open source home for many years to come. There is so much to learn and the community is amazing.

## Getting started

As of the time of publication, the Community Bonding period is currently happening. The official "coding" time hasn't started yet. Without much delay, I will be meeting up with Patrick and Remy later today in a conference call to check in after the official announcement, make plans for what's coming up in the near future, and become more acquainted with the Infrastructure community.

In addition to our conference call, I'm also planning on (formally) attending the next Fedora Infrastructure meeting on Thursday. Shortly afterwards, I hope to begin my journey as an Infrastructure apprentice and learn more about the workflow of the team.

Things are just getting started for the summer and I'm beyond excited that I will have a paid excuse to work on Fedora full-time. Expect more check-ins as the summer progresses!
