---
title: "Thirteen Year Legacy: Last.fm Downfall?"
date: 2015-12-11
categories: 
  - "foss"
  - "perspective"
  - "tech"
tags: 
  - "fedora-planet"
  - "last-fm"
  - "music"
  - "ui"
  - "web-development"
---

\[caption id="attachment\_76" align="alignright" width="2000"\][![Last.fm logo](http://blog.justinwflory.com/wp-content/uploads/2015/11/Lastfm-Logo.png)](http://blog.justinwflory.com/wp-content/uploads/2015/11/Lastfm-Logo.png) The Last.fm logo. Source: [Xfdr](http://www.xfdrmag.net/ive-had-the-last-of-this-why-the-new-last-fm-layout-sucks/)\[/caption\]

[Last.fm](http://www.last.fm/) is a web service for users to track and share their music tastes with friends in an easy, simple way. A single play of a song is known as a "Scrobble". Listening to music and recording the listen with Last.fm is known as "Scrobbling". This is a service that has existed since 2002, originally under the name of Audioscrobbler. In 2015, Last.fm rolled out their [new website beta](http://www.digitalspy.com/tech/news/a664005/lastfm-unveils-brand-new-site-design-and-most-users-are-really-upset-about-it/), originally optional, but later forced upon all users.

Last.fm's site redesign is criticized widely by users, but nobody seems to be listening on the other side in CBS Interactive London offices. What went wrong with the redesign and what can be learned going forward?

<!--more-->

## Last.fm wasn't listening

Perhaps the greatest, singular point of failure with the new Last.fm redesign (and the many months leading up to the redesign) was lack of communication and transparency with users. As someone who signed up in 2009 but only started really using the service in 2013, I never saw major interaction between employees of CBS Interactive and users of Last.fm. Usually, it has always been community volunteers speaking the voice of Last.fm and appearing as the public face of the site. The employees may have commented from time to time, but they were otherwise invisible to most users.

The new site redesign was the epitome of this continued state of "non-listening". Without warning, the optional beta that had been available for months was forcibly rolled out, forever replacing the old layout that had existed for many years. While the new appearance certainly could be defined as "modern" and mobile-friendly, it was missing many of the key features users had come to know, like groups and friends. Navigating was difficult and at times buggy. The redesign felt like it was still in beta testing, but now forced as the default. There is an [online petition](https://www.change.org/p/cbs-interactive-bring-old-last-fm-back) that has attracted over 11,000 signers to go back to the original user interface.

Even with 11,000 voices of protest, word from CBS Interactive is minimal. Not many people seem to know what's going on, if anything. This is never a good sign for any website or service. Are the doors closing soon for this thirteen year old service? Is a buyout in the cards? Nobody knows. Nobody will likely ever know until the day of an announcement, because nothing is transparent or open about Last.fm or its management.

## Last.fm's small staff

Another issue with this service (and perhaps an issue for a longer time) is that the Last.fm staff is a very small team. Even now, they're hiring for new web developers and Java developers - if you live in the UK, you could even [work for CBS Interactive today](http://www.last.fm/about/jobs) (although I don't know if this is a job with a good outlook).

So what would the solution be? If the development team behind Last.fm is small, then there are better ways to create a more productive environment. Perhaps the software development model employed by the company needs reconsideration. Maybe Last.fm needs to make a larger [foray into open source](https://github.com/lastfm). In either case, from the outside, there it looks like a major disconnect between corporate management and the Last.fm team. Because of how opaque Last.fm is managed, it's impossible to know what happens behind closed doors, but something isn't working with their team size - that much is clear.

## Now what?

Because of these decisions made over the past few months, the future of Last.fm is unclear. Many dedicated users are just Scrobbling and using [other services](http://nicholast.fm) to use their data in a meaningful way, according to [Reddit](https://www.reddit.com/r/lastfm/comments/3u2ic3/lastfm_any_hope_left/cxbegwl).

#### Libre.fm

As for myself, I'm preparing for a move to a new service. The future for Last.fm is bleak. I want to stay on the boat for as long as possible, but I don't know if this is a sustainable idea for any longer, and I have invested too much time, music, and data into Last.fm to willingly part with it. I was recently made aware to an awesome, open source [Python toolset](https://github.com/kabniel/last2libre) that lets users back up any user's Scrobbles to a text file and export it to a service such as [Libre.fm](https://libre.fm/). Libre.fm isn't the most aesthetically pleasing or the most powerful site, but it's stable and open. Anyone who wants to hack on a new feature has access to the source code to do whatever they'd like. A platform such as this is much more collaborative and allows for a more positive future than what Last.fm has now.

If you're a developer, you can have a hand in building the future by contributing to [GNU FM](https://git.gnu.io/gnu/gnu-fm), the platform powering Libre.fm. If there's a feature you want, you can add a request on their [issue tracker](https://git.gnu.io/gnu/gnu-fm/issues). Or if you're a system administrator, you can even [install GNU FM yourself](https://git.gnu.io/gnu/gnu-fm/blob/master/gnufm_install.txt) and run your own "private Last.fm" site.

Hopefully there is something to be learned about everything that went wrong with Last.fm and we can look forward to a more open future with the availability of options such as Libre.fm.
