---
title: "What's new in TeleIRC v2.0.0"
date: 2020-05-24
categories: 
  - "foss"
  - "tech"
tags: 
  - "2020s"
  - "communication"
  - "development"
  - "fedora-planet"
  - "irc"
  - "open-source"
  - "rit-linux-users-group-ritlug"
  - "rochester-institute-of-technology"
  - "rochester-ny-usa"
  - "telegram"
  - "teleirc"
  - "upstream"
  - "working-together"
images: ["/img/teleirc-development-update.jpg"]
---

TeleIRC v2.0.0 is the latest major release of our open source Telegram <=> IRC bridge. Download the [latest release](https://github.com/RITlug/teleirc/releases/tag/v2.0.0) and read the [release announcement](https://jwfblog.wpenginepowered.com/2020/05/teleirc-v2-0-0-is-officially-here/) for the full story.

There are several new and noteworthy changes in TeleIRC v2.0.0. This post walks you through the major changes and differences for TeleIRC v2.0.0. Read on for the highlight reel of this release.

<!--more-->

## Full rewrite to Go

TeleIRC v2.0.0 is a complete and total rewrite. With the lessons learned and best practices of the NodeJS v1.x.x releases under our belt, the team set out in September 2019 to rewrite TeleIRC in Go. The rewrite was motivated by fun and personal interest, but it was also intended to make the future of TeleIRC more sustainable.

The rewrite makes TeleIRC simple, fast, and lightweight. TeleIRC is unique from other chat bridge software, which usually focus on extensive configuration and supporting many chat platforms.

Additionally, the success criteria in order to release was feature parity with v1.x.x releases. The team accomplished this almost completely, with one exception. **TeleIRC v2.0.0 does not include Imgur image upload for IRC**; however, a v2.1.0 feature release will include Imgur support.

To summarize, TeleIRC v2.0.0 is written to be a simple and excellent Telegram <=> IRC bridge. No more, no less.

## Run TeleIRC v2.0.0 as a compiled binary

The new release is available as a standalone 8 MB binary. The only deployment assets needed are the binary and a config file. Other pathways, including build from source and Ansible Roles, are also available.

This is a departure from TeleIRC v1.x.x releases, which required a NodeJS run-time and installing project dependencies. TeleIRC v2.0.0 does not require a Go run-time on the host.

## Improved TeleIRC v2.0.0 documentation

End user feedback shaped and improved documentation during development.

Thanks to feedback collected during the pre-release process, the documentation is simplified and written to be easy to understand. We hope you find the [TeleIRC Quick Start](https://docs.teleirc.com/en/latest/user/quick-start/) page a helpful introduction to getting TeleIRC running in little time.

## Future roadmap for containers

Because of [v2.0.0 design decisions](https://jwfblog.wpenginepowered.com/2020/03/teleirc-v2-0-0-march-2020-progress-update/), there is a planned future for container and container orchestration use cases. At release time, a [Dockerfile is available](https://github.com/RITlug/teleirc/tree/v2.0.0/deployments/container), but it is not yet tested or documented.

In future releases, the TeleIRC Team will continue to test the container image and iron out bugs. Future deployment assets and documentation will offer pathways to run TeleIRC in Kubernetes or OpenShift v4.x.x.

* * *

_Article format inspired by Ryan Lerch's format for "[What's new in Fedora Workstation](https://fedoramagazine.org/whats-new-fedora-32-workstation/)"._
