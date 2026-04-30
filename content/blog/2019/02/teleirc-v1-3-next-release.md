---
title: "TeleIRC v1.3: Developers map out next release"
date: 2019-02-03
categories: 
  - "foss"
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
images: ["/img/teleirc-development-update.jpg"]
---

On Saturday, February 2nd, 2019, the [TeleIRC](https://github.com/RITlug/teleirc) community in Rochester, NY held the first developers' meeting. Starting this month, weekly meetings are held to discuss blocking issues and plan ahead for the future of the project. Current project lead [Justin Wheeler](https://jwheel.org/) met with [Tim Zabel](https://github.com/Tjzabel) and [Nic Hartley](https://github.com/nic-hartley/) to finish planning the v1.3 milestone for TeleIRC. Notably, this marks the next feature-release of TeleIRC since v1.2 in October 2018.

Read on to learn more about what's coming in TeleIRC v1.3.

<!--more-->

## What's coming in TeleIRC v1.3?

The developers' meeting focused on identifying critical tasks to work on for the next sprint. The following open issues were identified as essential for v1.3:

- **[#41](https://github.com/RITlug/teleirc/issues/41)**: Sending an image with a caption in telegram then editing the caption causes the image to get sent again
- **[#44](https://github.com/RITlug/teleirc/issues/44)**: Add Telegram-side highlighting for IRC messages prefixed with username
- **[#53](https://github.com/RITlug/teleirc/issues/53)**: multi-line messages should have each lined prefixed with the userid
- **[#102](https://github.com/RITlug/teleirc/pull/102)**: Splitting of messages sent to IRC, prepending TG username to each one
- **[#112](https://github.com/RITlug/teleirc/issues/112)**: Insert zero-width space in Telegram usernames sent to IRC
- **[#115](https://github.com/RITlug/teleirc/issues/115)**: Image url reveals bot's token
- **[#118](https://github.com/RITlug/teleirc/issues/118)**: Refactor documentation into smaller pages (to make it more readable)

Of these, #53 and #102 will be closed by [pull request #102](https://github.com/RITlug/teleirc/pull/102). [Michał Rudowicz](https://github.com/michalrud) contributed #102 and it should be merged during this sprint window. (_Thanks Michał!_)

Keep up with more development news by watching the [v1.3 milestone](https://github.com/RITlug/teleirc/milestone/5) on GitHub.

## When is TeleIRC v1.3 coming?

TeleIRC v1.3 is projected for **Saturday, March 2nd**. For the selected issues, we felt four weeks was sufficient to accomplish and meet all existing goals. If we move faster than expected, we may move items from the [v1.4 milestone](https://github.com/RITlug/teleirc/milestone/6) up to this release.

## How can I participate?

Want to help out or get involved with TeleIRC? We are happy to welcome you! Past contributors have come from all around the world.

Say hello in our Freenode IRC channel, [#ritlug-teleirc](https://webchat.freenode.net/?channels=ritlug-teleirc), or [join the Telegram group](https://t.me/teleirc). You can also look through our "[good first issue](https://github.com/RITlug/teleirc/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22+no%3Aassignee)" tickets in GitHub. If something looks interesting, leave a comment of interest in the GitHub issue and a committer can offer more guidance.

If you are a user and want to share feedback or thoughts with the team, leave a comment on this blog post and they will be shared with the team.

* * *

_[Background photo](https://unsplash.com/photos/guiQYiRxkZY) by [Daria Nepriakhina](https://unsplash.com/@epicantus) on [Unsplash](https://unsplash.com/)._
