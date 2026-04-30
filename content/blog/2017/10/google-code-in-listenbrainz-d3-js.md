---
title: "Exploring Google Code-In, ListenBrainz easyfix bugs, D3.js"
date: 2017-10-21
categories: 
  - "education"
  - "metabrainz"
  - "foss"
  - "tech"
tags: 
  - "containers"
  - "data"
  - "docker"
  - "fedora-planet"
  - "getting-started"
  - "independent-study"
  - "listenbrainz"
  - "metabrainz"
  - "music"
  - "musicbrainz"
  - "open-source"
  - "rit-2171"
  - "rochester-institute-of-technology"
images: ["/img/listenbrainz-rit-independent-study.png"]
---

_This post is part of a series of posts where I contribute to the ListenBrainz project for my independent study at the Rochester Institute of Technology in the fall 2017 semester. For more posts, find them in [this tag](https://jwfblog.wpenginepowered.com/tag/rit-2171/)._

* * *

Last week moved quickly for me in ListenBrainz. I submitted multiple pull requests and participated in the weekly developer's meeting on Monday. I was also invited to take part as a mentor for ListenBrainz for the upcoming round of Google Code-In! In addition to my changes and new role as a mentor, I'm researching libraries like D3.js to help build visualizations for music data.  Suddenly, everything started moving fast!

<!--more-->

## Last week: Recap

The ListenBrainz team accepted my [development environment improvements](https://github.com/metabrainz/listenbrainz-server/pull/257) and [documentation](https://github.com/metabrainz/listenbrainz-server/pull/259). This gave me an opportunity to better explore project documentation tools. I experimented with [Sphinx](http://www.sphinx-doc.org/en/stable/) and [Read the Docs](https://readthedocs.org/). Sphinx introduced me to [reStructuredText](http://docutils.sourceforge.net/rst.html) for documentation formats. I've avoided it in favor of Markdown for a long time, but I see where reStructuredText is stronger for advanced documentation.

Since ListenBrainz is a new project, I plan to contribute documentation for any of my work and improve documentation for pre-existing work. One of the goals for this independent study is to make ListenBrainz a viable candidate for a future data analysis course. To make it easy to use and understand, ListenBrainz needs excellent documentation. Since one of my strengths is technical writing, I plan to contribute more documentation this semester.

You can see some of the [new documentation](https://listenbrainz.readthedocs.io/en/master/) already!

## Google Code-In mentor

The MetaBrainz community manager, [Freso Olesen](https://musicbrainz.org/user/Freso), approached me to mentor for Google Code-In. [Google Code-In](https://codein.withgoogle.com/) is an opportunity for teenagers to meaningfully contribute to open source projects. Google describes Google Code-In as…

> Pre-university students ages 13 to 17 are invited to take part in Google Code-in: Our global, online contest introducing teenagers to the world of open source development. With a wide variety of bite-sized tasks, it’s easy for beginners to jump in and get started no matter what skills they have.
> 
> Mentors from our participating organizations lend a helping hand as participants learn what it’s like to work on an open source project. Participants get to work on real software and win prizes from t-shirts to a trip to Google HQ!

MetaBrainz is a participating organization of Google Code-In this cycle. Because of my work with ListenBrainz, I will contribute a few hours a week to help mentor participating students with ListenBrainz. Beginner problems should be easy to help with since I'm still beginning too, and as I spend more time with ListenBrainz, I can help with harder problems.

I'm excited to give back to one of my favorite open source projects in this way! I'm grateful to have this chance to help out during Google Code-In.

## Choosing easyfix bugs

After I figured out the development environment issues, I went through [open tickets](https://tickets.metabrainz.org/projects/LB/issues/) filed against ListenBrainz to find some to work on. I made a preliminary pass through all open tickets and left some comments for more information, when needed. The tickets I highlighted to look into next were

- [**LB-85**](https://tickets.metabrainz.org/browse/LB-85): Username in the profile URL should be case insensitive
- [**LB-124**](https://tickets.metabrainz.org/browse/LB-124): Install messybrainz as a a python library from requirements
- [**LB-176**](https://tickets.metabrainz.org/browse/LB-176): Add stats module and begin calculating some user stats from BigQuery
- **[LB-206](https://tickets.metabrainz.org/browse/LB-206)**: "playing\_now" submissions not showing on profile
- [**LB-212**](https://tickets.metabrainz.org/browse/LB-212): Show the MetaBrainz logo on the listenbrainz footer.

Of these five, LB-124 and LB-212 are already closed. While drafting this article, I completed LB-124 in [PR #266](https://github.com/metabrainz/listenbrainz-server/pull/266). This was part of a test to get the documentation building again because of odd import errors. Later, a new student also learning the project for the first time asked to work on LB-212. Since it was a good first task to explore the project code, I passed the ticket to him.

I want to do one more "easyfix" bug before going into the main part of my independent study timeline. I don't yet feel comfortable with the code and one more bug solved will help. After this, I plan to pursue the heavier lifting of the independent study to explore data operations and queries to make.

## Researching D3.js

Prof. Roberts introduced [D3.js](https://d3js.org/) as a library to build interactive, dynamic charts and visual representations of data. I haven't yet looked into much front-end work, but this was a cool project that I wanted to highlight in my weekly report. This feels like it could be a powerful match for ListenBrainz, especially since the data has high detail.

## Upcoming activity

This next week, I won't have as much time to contribute to ListenBrainz. On October 21, I'm traveling to Raleigh, NC for [All Things Open](https://allthingsopen.org/). On October 24, I [present my talk](https://allthingsopen.org/speakers/justin-w-flory/), "_What open source and J.K. Rowling have in common_". Since I'll be out of Rochester and missing other classwork, I expect less time on my ListenBrainz work.

This next week will be slower than the last two weeks. Hopefully I'll learn something at the conference too to bring back for ListenBrainz.

Until then… keep the FOSS flag high.
