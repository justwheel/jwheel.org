---
title: "HFOSS: Community Architecture (CommArch) Project Proposal"
date: 2016-03-04
categories: 
  - "fedora"
  - "foss"
  - "tech"
tags: 
  - "communication"
  - "community"
  - "fedora"
  - "fedora-planet"
  - "getting-started"
  - "hfoss"
  - "open-source"
  - "rochester-institute-of-technology"
---

## What is this?

This post serves as the project proposal for me and my team's [Humanitarian Free and Open Source Software Development](https://hfoss-ritjoe.rhcloud.com/) "[Community Architecture](https://hfoss-ritjoe.rhcloud.com/static/hw/commarch.txt)" project (shortened to CommArch)!

In this project proposal, we take a preliminary look at the project we're looking at analyzing, [Tahrir](https://github.com/fedora-infra/tahrir), and the different criteria we are assigned to look at.

\[caption id="attachment\_17" align="aligncenter" width="300"\][![Fedora is a free and open-source Linux distribution.](/img/Full-Logo.png)](/img/Full-Logo.png) Fedora is a free and open-source Linux distribution.\[/caption\]

<!--more-->

## Team Members

| **Name** | **Email** |
| --- | --- |
| [Bobby Pruden](https://rdp1070.wordpress.com/) | \*\*\*\*\*\*\*@rit.edu |
| [Wilfried Hounyo](http://blog.wilfriede.me/) | \*\*\*\*\*\*\*\*.\*\*\*\*\*\*@gmail.com |
| [Stephen Garabedian](https://spg1502igme582.wordpress.com/) | \*\*\*\*\*\*\*@rit.edu |
| Justin W. Flory | \*\*\*\*\*\*\*@gmail.com |

## Project

_Tahrir_ by the [Fedora Project](https://fedoraproject.org/wiki/Overview)

## Description

Tahrir is a [Pyramid](http://www.pylonsproject.org/) app for distributing your own custom badges (based off of [Mozilla Open Badges](https://wiki.mozilla.org/Badges)). The back-end is written in Python with an HTML/CSS and JavaScript front-end and the project is a smaller part of the [Fedora Project](https://fedoraproject.org/wiki/Overview).

## Team Member Roles

#### Justin and Wilfried

1. Project Report I-R
2. git\_by\_a\_bus

#### Stephen and Bobby

1. Project Report A-H
2. Calloway Coefficient of Fail

## Source Code Repository URL

[fedora-infra/tahrir](https://github.com/fedora-infra/tahrir)

## Upstream Mentors

| **Name** | **Email** |
| --- | --- |
| Ralph Bean (threebean) | \*\*\*\*\*@redhat.com |
| Remy DeCausemaker (decause) | \*\*\*\*\*\*\*@redhat.com |
| Pierre-Yves Chibon (pypingou) | \*\*\*\*\*\*@pingoured.fr |

## Communication Methods

The following methods of communication are ordered in the most preferred way to the least.

1. **IRC channel** on freenode ([#fedora-apps](https://webchat.freenode.net/?channels=fedora-apps))
2. **Issue tracker** on [GitHub](https://github.com/fedora-infra/tahrir/issues)
3. **Mailing list** via [infrastructure@lists.fedoraproject.org](https://lists.fedoraproject.org/archives/list/infrastructure@lists.fedoraproject.org/)

## What are the easy parts?

- Project is fairly small (even though it is part of a larger project)
- People to ask for help when needed
- [Git-by-a-bus](https://github.com/tomheon/git_by_a_bus) is going to make analytics of contributors super easy
- Distribution of work will allow us to complete the project in a timely manner

## What are the hard parts?

- Lack of a frame of reference for some team members who have never worked with open source projects in the past (e.g. we are unable to compare activity or its community to other projects)
- Since the project is a smaller project inside of a larger one (Fedora Project), it will be challenging to look at it in a modular sense
- Separation of dependencies from project requirements ([Open Badges](http://openbadges.org/) requirements and Tahrir requirements)

## How will you overcome both?

#### Hard Stuff

- We have two people who are more advanced at hacking who can hopefully guide the two who aren't through the project, effectively eliminating the lack of reference point.
- Three of our members are not people involved in the Fedora Project, and as such won't be distracted by its involvement with Fedora and will only look at the project itself.
- Read up on the existing documentation and test the various endpoints of the project to identify what is needed with Open Badge and what the project is implementing itself.
