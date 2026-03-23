---
title: "Hacktoberfest 2020 with TeleIRC"
date: 2020-10-12
categories: 
  - "foss"
  - "tech"
tags: 
  - "development"
  - "events"
  - "fedora-planet"
  - "github"
  - "hackathons"
  - "irc"
  - "open-source"
  - "open-source-communities"
  - "telegram"
  - "teleirc"
coverImage: "/img/teleirc-development-update.jpg"
---

October is here! If you contribute to Open Source projects, you might know that October is the month of Hacktoberfest. [DigitalOcean teams up](https://hacktoberfest.digitalocean.com/) with different partners each year to send a t-shirt (or plant a tree on your behalf) for anyone who makes four GitHub Pull Requests in October. And guess what? TeleIRC is a participating project for you to get your Hacktoberfest t-shirt or tree!

This post identifies specific tasks the TeleIRC team identified as "good first issues" for Hacktoberfest hackers. They are in order of least difficult to most difficult. Golang developers especially are encouraged to participate!

<!--more-->

## Why work on TeleIRC for Hacktoberfest?

Before sharing how you can contribute for Hacktoberfest, what about _why_ you should contribute?

TeleIRC originally launched in 2016. Since then, we have [built up a community of users](https://jwfblog.wpenginepowered.com/tag/teleirc/) around the world. TeleIRC is also used in other larger Open Source projects like the Fedora Project and LibreOffice! Of course, it is still used in the Rochester Institute of Technology community where it was first developed.

Working on TeleIRC means you can contribute to a project that is actually used in the real world. Hundreds of user communities, some even the size of thousands of people, use TeleIRC. Your improvements and changes will help the many downstream users of our project. (P.S. – See the full list of [who uses TeleIRC](https://docs.teleirc.com/en/latest/about/who-uses-teleirc/) in our docs!)

With that out of the way… let's talk about what there is to do!

## #1: Large messages go to a pastebin

This corresponds to [RITlug/teleirc#56](https://github.com/RITlug/teleirc/issues/56).

- **Goal**: When a Telegram user writes a single line that exceeds the maximum number of characters for an IRC message (512 characters, per [RFC 1459, section 2.3](https://www.rfc-editor.org/rfc/rfc1459.html#section-2.3)), send the string to a pastebin service.
- **Success criteria**: Any line greater than 512 characters is sent to a pastebin-like service.
- **What we think**: Note the difference between "lines" and "messages". Telegram users can add line breaks to messages. TeleIRC should respect those line breaks as new IRC messages. So, only a single line that exceeds the maximum should go to a pastebin-like service.

## #2: Telegram Poll handler

This corresponds to [RITlug/teleirc#267](https://github.com/RITlug/teleirc/issues/267).

- **Goal**: Send text representations of Telegram Polls to IRC. Currently, Polls are ignored by TeleIRC and do not appear in any way on IRC.
- **Success criteria**: If a Telegram user sends a Poll to a group, a text representation should appear in IRC.
- **What we think**: IRC users will not be able to participate in Polls. This is a platform limitation. However, IRC users should get some context about what a Poll includes, e.g. what the question is and what answer choices are available.

## #3: Support more encoding types (e.g. CP1251)

This corresponds to [RITlug/teleirc#332](https://github.com/RITlug/teleirc/issues/332).

- **Goal**: Support more string encoding types than UTF-8.
- **Success criteria**: If a Telegram user writes a message in Cyrillic script, it should appear in Cyrillic script on IRC (if the server supports it, e.g. CP1251).
- **What we think**: This is one of the toughest issues we have and requires knowledge about string encoding methods. The current core developers are native English speakers and we do not use other languages that have non-Latin script. The GitHub issue has more info, but it will need additional research or knowledge about string encoding.

## Need Hacktoberfest help? Come talk to us!

**Want to work on any of these?** Add a new comment to the GitHub Issue and let us know you are interested in working on it.

**Have questions about the project or getting started?** Come talk with the TeleIRC team! Of course, you can find us both on IRC (`#rit-lug-teleirc` on Freenode IRC) and Telegram ([@teleirc](https://t.me/teleirc)).

Additionally, the TeleIRC team meets virtually **every Sunday at 11:00 U.S. EDT / 15:00 UTC**. Ask us for a calendar invite in our team chat if you would like one!
