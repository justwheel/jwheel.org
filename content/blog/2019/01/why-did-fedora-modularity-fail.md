---
title: "Why did Fedora Modularity fail in 2017? A brief reflection"
date: 2019-01-21
categories: 
  - "fedora"
  - "tech"
tags: 
  - "community"
  - "education"
  - "fedora-infrastructure"
  - "fedora-packaging"
  - "fedora-planet"
  - "open-source-communities"
  - "reflections"
  - "rochester-institute-of-technology"
---

For the ISTE-430 Information Requirements Modelling course at the [Rochester Institute of Technology](https://www.rit.edu/), students are asked to analyze an example of a failed software project and write a short summary on why it failed. For the assignment, I evaluated the [December 2017 announcement](https://communityblog.fedoraproject.org/modularity-dead-long-live-modularity/) on [Fedora Modularity](https://docs.pagure.org/modularity/). I thought it was an interesting example of a project that experienced initial difficulty but re-calibrated and succeeded in the end. And it is a project I am biased towards, as a Fedora user and sysadmin.

I thought sharing it on my blog might be interesting for others. Don't read into this too much – it was a quick analysis from a single primary source and a few secondary references.

<!--more-->

## What is Fedora Modularity?

The [Fedora Project](https://getfedora.org/) is a common Linux operating system which ships software in "packages". [Since June 2015](https://fedoraproject.org/wiki/Objectives/Fedora_Modularization,_Requirements_Phase), project members built a pipeline to ship modular versions of existing packages, known as Modularity. [Modularity](https://docs.pagure.org/modularity/) allows someone to use different versions of the same software (e.g. a programming library) on the same system without dependency conflicts.

In a way, Fedora Modularity shifts some responsibility from the Linux distribution (as a provider of known, good combinations of co-dependent packages) to the sysadmin (as a decision-maker to use different combinations of software versions in their environment). It's more flexible for a variety of deployment requirements. I see it as a net-positive win for the sysadmin experience since its final release.

## Why did Modularity fail in 2017?

However, in [this post-mortem](https://communityblog.fedoraproject.org/modularity-dead-long-live-modularity/) from December 2017, a project lead (Stephen Gallagher) announced Fedora Modularity efforts are scrapped for a total redesign. Even though it was not a final release, it was regarded as a failure because of the late status of the project, since its proposal in mid-2015. The post-mortem explained the amount of effort required by all software packagers was significant and also noted the wide amount of engagement necessary from different stakeholders. New requirements and steps to packaging guidelines were not understood by the community of software packagers, and project milestones were not met because of low participation in the packager community.

Their report reveals the amount of moving parts Fedora Modularity must account for. It demonstrated a flawed understanding of user and developer needs during initial feedback from the beta's implementation. In other words, the level of complexity for the project exceeded the amount of employee resources available to accomplish the project. The redesigned model (proposed in the reflection) pivoted by utilizing existing tools and infrastructure to support the new features, which required less changes for new software package updates. Thus, the packager community was better able to participate in providing new functionality in existing packages.

Additionally, sufficient documentation of new guidelines was unavailable to users, stemming from lack of engagement and feedback by existing users. This was later remedied with user experience testing through events like Test Days, which allowed any community member to try out new features and functionality with their own packaging workflows.

Since the project was finally implemented in late 2018, it was better received in the community than the failed launch in December 2017. Most success since the first failure came by simplifying project requirements (e.g. by leveraging how existing infrastructure was designed instead of reinventing the pipeline) and getting more user feedback on a regular basis (e.g. with community outreach events like Test Days and classroom sessions hosted live on YouTube).

* * *

Gallagher, S. (2017). Modularity is Dead, Long Live Modularity! _Fedora Community Blog_. Retrieved from [https://communityblog.fedoraproject.org/modularity-dead-long-live-modularity/](https://communityblog.fedoraproject.org/modularity-dead-long-live-modularity/)
