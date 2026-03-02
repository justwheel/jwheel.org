---
title: "Statistics proposal and self-hosting ListenBrainz"
date: 2017-12-18
categories: 
  - "education"
  - "metabrainz"
  - "foss"
tags: 
  - "data"
  - "fedora-planet"
  - "getting-started"
  - "google"
  - "google-bigquery"
  - "independent-study"
  - "listenbrainz"
  - "metabrainz"
  - "music"
  - "musicbrainz"
  - "open-source"
  - "reflections"
  - "rit-2171"
  - "rochester-institute-of-technology"
coverImage: "listenbrainz-rit-independent-study.png"
---

_This post is part of a series of posts where I contribute to the ListenBrainz project for my independent study at the Rochester Institute of Technology in the fall 2017 semester. For more posts, find them in [this tag](https://blog.justinwflory.com/tag/rit-2171/)._

* * *

This week is the last week of the fall 2017 semester at RIT. This semester, I spent time with the MetaBrainz community working on ListenBrainz for an independent study. This post explains what I was working on in the last month and reflects back on my [original objectives](https://blog.justinwflory.com/2017/10/contributing-listenbrainz/) for the independent study.

<!--more-->

## Running my own ListenBrainz

The [RIT Linux Users Group](http://ritlug.com/) hosts various virtual machines for our projects. I requested one to set up and host a "production" ListenBrainz site. The purpose of doing this was to…

1. Test my changes in a "production" environment
2. Offer a service for the RIT Linux Users Group to poke around with

I spent most of this time working with our system administrator to set up the machine and adjust hardware specs for ListenBrainz. Once we fixed storage space and memory issues, it was easy to set it up and get ListenBrainz running. My experience writing the [development guide](https://listenbrainz.readthedocs.io/en/latest/dev/devel-env.html) made it easy to get set up and get working. On the first run, it worked!

Now, [listen.ritlug.com](http://listen.ritlug.com/) is live.

#### Figuring out HTTPS

My next challenge for the site is to set up HTTPS. I tried using a [reverse proxy in nginx](https://www.nginx.com/resources/admin-guide/nginx-https-upstreams/) to set up HTTPS, but I received _502 Bad Gateway_ errors. I realized I spent too much time figuring this out on my own and decided to [ask for help](https://community.metabrainz.org/t/how-does-metabrainz-use-https-on-listenbrainz/347319) in the MetaBrainz community forums.

## Proposing new statistics

Halfway through the independent study, I realized I would fall short of my original objective of implementing basic statistics in ListenBrainz. To compromise, I wrote a [proposal for new statistics](https://docs.google.com/document/d/1kByAgC9kbuDHNbsEJDkYkTMJ-wAoouWj0qNyi2UPb2Y/edit?usp=sharing) to start in the project. My proposal looked at other proprietary platforms that compete with ListenBrainz to see some of their statistics. I also came up with some of my own.

I [proposed this to the MetaBrainz community](https://community.metabrainz.org/t/feedback-needed-listenbrainz-statistics-proposal/347327) on the community forums. I'm awaiting feedback on my ideas. Once I get feedback, I plan to file new tickets for each statistic to track their implementation over time.

I don't expect statistics being at the forefront of ListenBrainz for some time. A lot of work is going towards other areas of the project. But later in 2018, I expect more focus on the user-facing side of the project.

## My statistic and Google BigQuery

My biggest blocker over the last month was [Google BigQuery](https://cloud.google.com/bigquery/). I wrote a statistic to [calculate play counts](https://github.com/metabrainz/listenbrainz-server/pull/318/commits/c1c08ce7f8d207591daeb288087872616d5063a4) over a time period, but was asked to test my statistic. To test my statistic, I needed real data to work with.

Originally, I tried using the [Simple Last.fm Scrobbler](https://github.com/tgwizard/sls) to submit listens to the local IP address for my development environment, but I wasn't able to get the app to reach my ListenBrainz server. To get the data, I had to set up Google BigQuery credentials so I could make queries against data on the production site, [listenbrainz.org](https://listenbrainz.org/).

I tried working through the [Google BigQuery documentation](https://cloud.google.com/bigquery/docs/). There's a lot of documentation for using BigQuery as a developer, but it was confusing where to find the information I needed to set it up in my development environment. I tried creating a new project in the Google Cloud Platform, but I was confused because it prompted me to upload my own data instead of accessing data already in BigQuery.

Too late, I realized I spent too much time on my own and not asking for help. I [submitted a pull request](https://github.com/metabrainz/listenbrainz-server/pull/318) with the statistic I made and [asked for help](https://community.metabrainz.org/t/how-to-set-up-google-bigquery-in-a-listenbrainz-development-environment/347307) in the MetaBrainz community. I also offered to write documentation for setting this up once I learn how to do it.

## Reflecting back

I looked back on my [original objectives](https://blog.justinwflory.com/2017/10/contributing-listenbrainz/) for the independent study, and I was satisfied and dissatisfied.

#### Not enough programming

I wanted this independent study to enhance my programming knowledge. I especially wanted to focus on Python because I wanted to become more familiar with the language. However, I actually didn't do much programming during the independent study, to my own fault.

My biggest challenge was I bit off more than I could chew. I wanted to write code, and made a big goal before I knew the code base of the project. Even now, I still am not completely comfortable with the code yet. It's a big project with a lot of things going on. I was able to understand the things I did work on, but there's still a lot.

I realized that next time, I need to spend more time evaluating the code base of a project before writing out my milestones. I wish I set more realistic, smaller milestones for myself. My milestone of implementing basic reports was lofty given my existing programming knowledge.

#### Successes

One of my other objectives was to write documentation for the project. I felt I succeeded in this milestone, and actually found it enjoyable and interesting to do! I helped separate out documentation from the README into the dedicated [ReadTheDocs site](https://listenbrainz.readthedocs.io/en/latest/). I wrote the [development environment guide](https://listenbrainz.readthedocs.io/en/latest/dev/devel-env.html) and helped fix some build issues with the docs site. I also plan to write more for some of the other pain points I found, like Google BigQuery.

My last milestone was to create a use case for a data visualization course at RIT. While I didn't implement my basic reports, I did create the proposal and make an effort to write new statistics. There's a lot of potential now to work with the data in Google BigQuery and do front-end work with tools like [D3.js](https://d3js.org/) and [Plotly.js](https://plot.ly/javascript/). I believe there's significant potential to use ListenBrainz as a hands-on project for students to explore data visualization with real data. I hope to support my independent study professor, Prof. Roberts, with questions and logistics of using it as a tool for learning in the future.

#### Unexpected success

I also think I had an unplanned success too. I immersed myself in the community for ListenBrainz too. Over the last few months, I realized that many of my strengths are in community management and tooling. During my time in the community, I did the following:

- [Fixed SELinux labels in Docker](https://github.com/metabrainz/listenbrainz-server/pull/290)
- [Contributed a pull request template](https://github.com/metabrainz/listenbrainz-server/pull/288)
- [Drafted contributing guidelines](https://github.com/metabrainz/listenbrainz-server/pull/287)
- [Fixed a PostgreSQL bug](https://github.com/metabrainz/listenbrainz-server/pull/294)
- [And more…](https://github.com/metabrainz/listenbrainz-server/pulls?utf8=%E2%9C%93&q=is%3Apr+author%3Ajflory7+)

## To the future!

This ends my independent study with ListenBrainz, but it doesn't end my time contributing! I chose ListenBrainz because it's a project I'm passionate about. An independent study allowed me to justify more time on it than a side project in my free time. I'm happy to have that opportunity, but I don't want to end here!

I want to follow through on the statistics because I'm passionate about understanding music listening trends. I think there's a lot of power for psychological research through music data. To this point, I filed a ticket to request [tagging listens with "emotion" words](https://tickets.metabrainz.org/browse/LB-243) that are synced back to [MusicBrainz entities](https://musicbrainz.org/doc/MusicBrainz_Database).

I won't have as much time to work on the project without the course credit, but I hope to stay involved for the future. I love the project and I love the community. I'm thankful for the opportunity to work on this project as an independent study, and learn some things along the way.
