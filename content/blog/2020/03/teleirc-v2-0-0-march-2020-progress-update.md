---
title: "TeleIRC v2.0.0: March 2020 progress update"
date: 2020-03-19
categories: 
  - "foss"
  - "tech"
tags: 
  - "2020s"
  - "containers"
  - "development"
  - "fedora-planet"
  - "hacking"
  - "irc"
  - "messaging"
  - "open-source"
  - "research-and-learning"
  - "rit-linux-users-group-ritlug"
  - "rochester-institute-of-technology"
  - "telegram"
  - "teleirc"
  - "upstream"
  - "working-together"
coverImage: "/img/teleirc-development-update.jpg"
---

Since September 2019, the [RITlug](https://ritlug.com/) TeleIRC team is hard at work on the [v2.0.0 release](https://github.com/RITlug/teleirc/milestone/8) of TeleIRC. This blog post is a short update on what is coming in TeleIRC v2.0.0, our progress so far, and when to expect the next major release.

## What's coming in TeleIRC v2.0.0?

<!--more-->

TeleIRC v2.0.0 is a complete rewrite of TeleIRC. The team is migrating the code base [from NodeJS to Go](https://github.com/RITlug/teleirc/issues/163). In September 2019, the team began scoping the requirements and how to approach this large task. TeleIRC v2.0.0 does not add new features, but aims to have feature parity with the v1.x.x version of TeleIRC.

You might be asking, why bother with a total rewrite? What does this actually accomplish for the project? To answer this question, some historical context is needed!

### TeleIRC v1.0.0 was an experiment.

[TeleIRC v1.0.0](https://github.com/RITlug/teleirc/releases/tag/v1.0.0) was originally created and released in September 2016 by RIT alum [Mark Repka](https://github.com/repkam09). Mark created TeleIRC as a cool project for the RIT Linux Users Group (RITlug) when he was a student and vice president of RITlug. The project was written in hackathon spirit: to prove that something that was not yet common wasn't that hard to do.

Fast forward to today: TeleIRC ends up being pretty popular! As do chat bridges (Matterbridge, Matrix/Riot, etc.) as a whole. The [Fedora Project](https://docs.fedoraproject.org/en-US/project/) is one of our largest users, with a dedicated [Special Interest Group](https://docs.fedoraproject.org/en-US/teleirc-sig/) to manage the bots. The [LibreOffice community](https://www.libreoffice.org/about-us/who-are-we/) is another one of our biggest users. Several international communities also adopted TeleIRC to make their chat rooms more accessible to a new generation of open source fans. Some example users are Linux and BSD user groups and hackerspaces in Argentina, Albania, and across Asia. You can see the [full list of TeleIRC users](https://docs.teleirc.com/en/latest/about/who-uses-teleirc/) for yourself.

TeleIRC has grown in a way we never thought it would. Which is awesome! But the project was not originally designed to grow or scale the way it has. Additionally, by being at a university, contributors come and go as students graduate and move on to industry. We also have to think about how to maintain TeleIRC beyond the typical student life-cycle common in the academic world.

### Let's approach TeleIRC v2.0.0 as engineers.

A full rewrite allows us to fully leverage our knowledge as software engineers. In 2020, we know TeleIRC has a large user community and is an important part of how many open source communities communicate. We also know that breaking code into smaller, more modular pieces makes it easier to maintain and bring in new contributors. A full rewrite allows us to apply the lessons the team has learned over the years, in a way that incremental feature releases does not allow.

A few areas are in clear focus for the TeleIRC v2.0.0 rewrite:

1. Write clean, simple code that is easy to understand
2. Test the code so it is easy to tell when things are working and when they aren't
3. Think about how to bring in new contributors to continue the project in the future

But maybe you are also asking, why the jump to Go?

### A Go rewrite distinguishes our project.

When Mark and I launched the project in 2016, we didn't look around to see if anything else like RITlug's TeleIRC already existed. Turns out, there was [another NodeJS project](https://github.com/FruitieX/teleirc) with the same name. Skip forward a few years, and there are also projects like [Matterbridge](https://github.com/42wim/matterbridge), [pytgbridge](https://github.com/sfan5/pytgbridge), and [other implementations](https://github.com/xypiie/teleirc). So, with all this commotion out there these days, why bother with our version of yet another chat bridge?

First, there is one design principle guiding our project from others like us: to do one thing and to do it well. Matterbridge is an excellent tool, and we even use it in conjunction with TeleIRC at our university. However, it is a complex tool with many features and options. For some people, this is a non-issue. But the TeleIRC team likes to think there is beauty in simplicity. Instead of offering a tool with the most features and configuration options, we aspire to do a single thing and to do it really well: connect Telegram groups and IRC channels together.

Second, although the FruitieX/teleirc project is archived today, it was once the biggest alternative to our project, also written in NodeJS. When we decided to launch TeleIRC v2.0.0 development, it had a larger community and user base then ours. So instead of offering a "similar but different" NodeJS project, we would be the first Telegram-IRC bridge written in Go. (Yes, Matterbridge is also written in Go, but see the above paragraph.)

Third… many of the existing maintainers of TeleIRC simply wanted an excuse to learn Go. It is an opportunity to expand our knowledge, experience, and skills, especially since we are students preparing to enter the industry.

### Go has a better story for Kubernetes / OpenShift.

Finally, we are carefully considering the needs of one of our biggest downstream users: the **Fedora Project**. Several TeleIRC developers also support Fedora's TeleIRC SIG. Recently, the Fedora Infrastructure team launched an OpenShift instance for the Fedora community, called [Communishift](https://fedoraproject.org/wiki/Infrastructure/Communishift). All existing infrastructure in Fedora is gradually moving from virtual machines or OpenStack to OpenShift. To support this migration, we want to make a Go-based TeleIRC as easy to deploy in OpenShift as possible.

And fortunately, Go has a great story in the container orchestration world. Kubernetes and OpenShift are also Go-based projects. Go is the dominant language of this ecosystem. Its excellent performance in the niche of networking makes it a great choice for what TeleIRC does.

Now that you know more about the "why is this happening," let's talk on where things are and what you can expect!

## TeleIRC v2.0.0: Progress so far

**TeleIRC v2.0.0 is approximately 76% complete**. All progress is tracked in the [v2.0.0 milestone](https://github.com/RITlug/teleirc/milestone/8) on GitHub. [46 issues and pull requests were closed](https://github.com/RITlug/teleirc/milestone/8?closed=1) since we began in September 2019. At publishing time, about 16 more issues and pull requests are left before we cut the v2.0.0 release.

Earlier in 2019, the maintainer team consisted of [Justin W. Flory](https://github.com/jwflory), [Tim Zabel](https://github.com/Tjzabel), [Seth Hendrick](https://github.com/xforever1313), [Nate Levesque](https://github.com/thenaterhood), [Nic Hartley](https://github.com/nic-hartley), and [Robby O'Connor](https://github.com/robbyoconnor). Now joining the committer group, we are happy to welcome **[Nicholas Jones](https://github.com/Zedjones), [Kevin Assogba](https://github.com/10eMyrT), and [Kennedy Kong](https://github.com/kennedy)** to the team. The current core group of maintainers for v2.0.0 are Justin, Tim, Nicholas, Kevin, and Kennedy.

## When to expect TeleIRC v2.0.0

TeleIRC v2.0.0 is targeted for a release date of **Friday, May 15th, 2020**. At this point, we expect to have full feature parity with the v1.x.x version. We will recommend all existing users to upgrade to the latest release then.

In the meanwhile, the team is getting ready to [cut a v2.0.0-pre1 release](https://github.com/RITlug/teleirc/issues/265), our first "pre-release" of the Go port. We expect this release to be available on our _[Releases](https://github.com/RITlug/teleirc/releases)_ by Saturday, March 28th. Along with the v2.0.0-pre1 release, there are a few other details to note:

1. [TeleIRC v1.5.0](https://github.com/RITlug/teleirc/milestone/9?closed=1), the final version of the NodeJS version, will be released.
2. No future contributions will be accepted to the NodeJS version.
3. `master` branch in git will reflect the latest Go version of TeleIRC.

Once the v2.0.0-pre1 release is available, we want help to take it for a test drive! If TeleIRC is critical for you, we do not recommend using it yet, as it does not have full feature parity yet. But your early feedback can help improve the future of the next release while we are in active development.

## Get involved with TeleIRC!

You can be a part of the upcoming TeleIRC v2.0.0 release. We'd love your help! There is no formal commitment to contributing, although we ask for participation through a single sprint cycle.

Read our [_Contributing guidelines_](https://docs.teleirc.com/en/latest/dev/contributing/) on how to get started with TeleIRC. [Virtual developer meetings](https://rit.bluejeans.com/564315135) take place every Saturday at 15:00 US EDT, so anyone can join and participate.

Come say hello in our developer chat rooms, either on [IRC](https://webchat.freenode.net/#ritlug-teleirc) or in [Telegram](https://t.me/teleirc)!

* * *

_[Background photo](https://unsplash.com/photos/guiQYiRxkZY) by [Daria Nepriakhina](https://unsplash.com/@epicantus) on [Unsplash](https://unsplash.com/)._
