---
title: "HFOSS: Double bugfix"
date: 2016-02-15
categories: 
  - "education"
  - "fedora"
  - "foss"
tags: 
  - "bugfix"
  - "fedora"
  - "fedora-planet"
  - "getting-started"
  - "hfoss"
  - "rochester-institute-of-technology"
---

This article is a further addition to the series of blog posts for my [Humanitarian Free and Open Source Software Development](https://hfoss-ritjoe.rhcloud.com/) course at [RIT](https://www.rit.edu/). For this week's homework, we are tasked with finding an open source project, looking at known bugs or finding new ones, and [submitting a bugfix](https://hfoss-ritjoe.rhcloud.com/hw/bugfix). I focused on two projects to begin with: [møte](https://github.com/fedora-infra/mote) and [FOSSProfiles](https://github.com/FOSSRIT/FOSSProfiles).

<!--more-->

## Step 1: Identifying the bugfix

#### møte

[![HFOSS bugfix: Looking at møte](/blog/2016/02/Fedora-Booth-Wide.jpg)](/blog/2016/02/Fedora-Booth-Wide.jpg)

When I started this homework assignment, there was originally one project I had in mind. As a non-code contributor to the Fedora Project, I frequently interact with Fedora's own implementation of Meetbot. [Meetbot](https://wiki.debian.org/MeetBot) is an IRC bot that adds meeting functionality to IRC channels. It makes it easy to highlight important info and summarize the meeting into a tidy HTML summary afterwards.

Fedora has a custom front-end for the Meetbot bot. This project is called [møte](https://github.com/fedora-infra/mote) and is developed by Fedora contributors [Chaoyi Zha](https://github.com/cydrobolt), [Ralph Bean](https://github.com/ralphbean), and [many others](https://github.com/fedora-infra/mote/graphs/contributors). One of its features is clustering Fedora sub-projects into teams and sorting their meetings together with JSON mappings.

Some Fedora sub-projects do not have their alias or meeting names set in these JSON files, making it difficult for their own team members or the general public from finding the records of their meetings. This inadvertently reduces transparency. Seeing as Fedora is an open project not only in code, but also in action, it made sense to try to clarify these mappings in a better way.

#### FOSSProfiles

More recently than møte, I am working with [Prof. Stephen Jacobs](https://www.rit.edu/gccis/stephen-jacobs) this semester with [FOSS@MAGIC](http://magic.rit.edu/foss/). I am on an independent study on Open Source Journalism to help assist with marketing and growing additional exposure for the program. The website for the program is dated in its current form, and one of the goals this semester is to get it rewritten with a more modern, up-to-date layout and information.

One thing we want to have on the site is profiles of our students, alumni, mentors, and faculty. A Jinja-powered HTML generator for student profiles was made over a year ago, titled [FOSSProfiles](https://github.com/FOSSRIT/FOSSProfiles). In this project, students add their information to the repo in the form of YAML files. A user runs a Python script, and the program generates a raw HTML template with all of the students' information in the repository. Wow! Useful.

When I went to try running it, I immediately ran into an issue and the program spat out a stacktrace at me. After troubleshooting the program and reading logs, I found two issues:

1. Student biography lines could not be over 140 characters
2. Python script did not support Python3

## Step 2: Doing the bugfix

#### møte

My commits ranged throughout the month of January and I tried to accomplish a number of things. Before I cloned the repo and started making changes, I crawled around møte for a while to find any teams or meetings that may not have been added.

Thanks to the power of [fedmsg](http://www.fedmsg.com), I was able to make a week of observations about teams that were frequently meeting in Fedora. As I observed for a week about what teams were active or inactive, I made bookmarks to their meeting pages to revisit later on.

After comparing the teams that were present in møte to the meetings I observed in a week, I began adding aliases and mappings for the teams that were lacking in the [`name_mappings.json`](https://github.com/fedora-infra/mote/blob/master/name_mappings.json) file. I also added a new category to the [`category_mappings.json`](https://github.com/fedora-infra/mote/blob/master/category_mappings.json) file for the [Fedora Community Operations](https://fedoraproject.org/wiki/CommOps) team (where I spend a lot of my own time in Fedora).

The Fedora teams I helped identify and add to møte are as follows.

- CommOps
- EMEA (Europe, Middle East, Africa) Ambassadors
- Fedora Council (formerly known as Fedora Board)
- LATAM (Latin America) Ambassadors
- Fedora Magazine editorial board meetings

During my time of my bugfix, I made [13 commits](https://github.com/fedora-infra/mote/commits?author=jflory7) to the repository. I'm not planning to stop there, either – there's a few more teams I hope to try adding to møte in the near future, like the Fedora Workstation, Server, and Cloud special interest groups.

Also in the process of contributing, I discovered a handful of problems and reported them in the issue tracker (see: [#75](https://github.com/fedora-infra/mote/issues/75) and [#83](https://github.com/fedora-infra/mote/issues/83)).

You can see my bugfix changes live in møte [here](https://meetbot.fedoraproject.org/browse/)! Thanks Chaoyi for helping mentor me along in contributing.

#### FOSSProfiles

###### 140 char maximum

My first step with this bugfix was in troubleshooting the stacktrace I was given running the program in Python2. The stacktrace confirmed the error was that a profile biography was over 140 characters long, and I began sorting through all existing profiles to find any that were over the limit. After a little bit of searching, I found that [`wilfriedE.yaml`](https://github.com/FOSSRIT/FOSSProfiles/blob/4b680e03e0a113e874687403b0de797b7f8a5d62/profiles/student/wilfriedE.yaml) was the one over the 140 character limit. This was an easy correction and after making changes, I was able to run the program with Python2.

###### Python3 support

Lastly, I wanted to add support for Python3 to this program so it would run in a modern and current workstation. This in particular required a lot of research for me to look into as I had never programmed in Python before.

My first problem with running the script in Python3 was an ImportError for a specific module, [`ifilter`](https://docs.python.org/2/library/itertools.html#itertools.ifilter). After searching for an answer, I found an easy fix. It was supported by default in Python3! To fix this error was as simple as removing the line.

Secondly, after fixing the ImportError, I found a certain string was required to be encoded as [UTF-8](https://en.wikipedia.org/wiki/UTF-8) before Python3 was able to handle it. After looking up the [encode() method](http://pythoncentral.io/encoding-and-decoding-strings-in-python-3-x/) and figuring out how it worked, I simply encoded the string to UTF-8. That wasn't so bad…

## Step 3: Post-bugfix analysis

For me, the most fun part was the optional part of the assignment to the end. As part of the assignment, we could add our projects to OpenHub. [OpenHub](https://www.openhub.net/) is an aggregator of open source projects that makes it easy to discover, track, and compare open source projects across the web.

I added a project page for [møte](https://www.openhub.net/p/mote-meetbot) and [FOSSProfiles](https://www.openhub.net/p/FOSSatMAGIC-FOSSProfiles) and claimed my contributions as a contributor.

I'm also playing around with other projects in OpenHub… you can find my profile [here](https://www.openhub.net/accounts/jflory7).
