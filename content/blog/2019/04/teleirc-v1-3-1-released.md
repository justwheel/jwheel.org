---
title: "TeleIRC v1.3.1 released with quality-of-life improvements"
date: 2019-04-22
categories: 
  - "foss"
  - "tech"
tags: 
  - "development"
  - "fedora-planet"
  - "fossmagic"
  - "irc"
  - "javascript"
  - "messaging"
  - "open-source"
  - "open-source-communities"
  - "rit-linux-users-group-ritlug"
  - "rochester-institute-of-technology"
  - "telegram"
  - "teleirc"
  - "upstream"
coverImage: "teleirc-development-update.jpg"
---

On April 20th, 2019, the TeleIRC development team [released TeleIRC v1.3.1](https://github.com/RITlug/teleirc/releases/tag/v1.3.1), the latest version after the final development sprint for the university semester. This release introduces minor improvements in order to accommodate heavier work-balance loads on our volunteer contributors. However, it gave us an opportunity to reduce technical debt. This blog post explains what's new in TeleIRC v1.3.1 and also offers a retrospective into how this last sprint went.

Special thanks and appreciation goes to [Tim Zabel](https://www.linkedin.com/in/tim-zabel/) and [Nic Hartley](https://github.com/nic-hartley) for their contributions this release cycle.

<!--more-->

## What's new

- Bold usernames in message prefixes ([#134](https://github.com/RITlug/teleirc/pull/134), [Nic Hartley](https://github.com/nic-hartley))
- Include filetype in IRC string when a document is uploaded on Telegram ([#139](https://github.com/RITlug/teleirc/pull/139), [Tim Zabel](https://github.com/Tjzabel))
- Include zero-width space in username for join/part messages to group ([#139](https://github.com/RITlug/teleirc/pull/139), [Tim Zabel](https://github.com/Tjzabel))

Additionally, contributor documentation improved. I added [contributor guidelines](https://github.com/RITlug/teleirc/blob/master/.github/CONTRIBUTING.md) and instructions to set up a development environment. Also, our friends at [Ura Design](https://ura.design/) designed our new project logo. Thanks to Ura, we have an awesome project logo and stickers in time for [Imagine RIT 2019](https://www.rit.edu/imagine/) later this month!

https://twitter.com/RITlug/status/1118641571291901952

## TeleIRC v1.3.1: sprint retrospective

Originally, we [planned to release v1.4](https://blog.justinwflory.com/2019/03/teleirc-roadmap-v1-4/) at the end of this sprint. For a number of reasons, this did not happen. We decided to reduce our scope and finish strong with a bugfix release instead of the originally-planned feature release. This retrospective summarizes "lessons learned" for future project sprints with a team of university students.

### Extended holidays are sprint bookends

In the last sprint, our university had a week-long break from classes. Most students use this time to visit family or travel outside of Rochester. Originally, we agreed to pause the sprint and resume when we returned. In retrospect, it didn't work out like that.

It was harder to start again when we returned from the break. Instead of an extended holiday acting as a pause in an ongoing sprint, extended holiday breaks should divide two separate sprints. The breaks from classes are personal time; working on projects is not possible for everyone. The interruption caused by a break impacts productivity of the team. Therefore, future sprint planning will take the [university calendar](https://www.rit.edu/calendar) into consideration.

### Adjustable sprint length to semester

Sprint lengths should have an adjustable length depending on what part of the academic semester the sprint is. For example, earlier this semester, we released v1.3 in a two-week sprint. For this v1.3.1 release, it was over a month. What happened? Should sprints have a variable length?

When working with an academic crowd, variable sprint lengths are worth considering. The first half of a semester typically has less assigned coursework. Final projects are not at play. Therefore, usually team members have more time to invest in the project at the start of a semester. Towards the end of the semester, coursework and class projects pile on and make it difficult to find bandwidth to work on side projects like TeleIRC.

The compromise is keeping our sprints short at the start of a semester and stretching them out as a semester goes on. This gives students more flexibility to work at a pace that encourages quality work but isn't overwhelming with other responsibilities of being a student. Going forward, we will try variable-length sprints in the Fall 2019 semester.

## Get involved with TeleIRC!

More opportunities are coming to participate with TeleIRC! The team is happy for new people to join us. Opportunities are available for short-term and long-term contributions.

Come say hello in our developer chat rooms, either on [IRC](https://webchat.freenode.net/?channels=ritlug-teleirc) or in [Telegram](https://t.me/teleirc)! Watch for [TeleIRC development reports](https://blog.justinwflory.com/tag/teleirc/) on my blog for more announcements.

* * *

_[Background photo](https://unsplash.com/photos/guiQYiRxkZY) by [Daria Nepriakhina](https://unsplash.com/@epicantus) on [Unsplash](https://unsplash.com/)._
