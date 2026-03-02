---
title: "The day open source died: a story about Minecraft, Bukkit, and the GPL"
date: 2020-04-07
categories: 
  - "foss"
  - "perspective"
tags: 
  - "community-management"
  - "copyright"
  - "gaming"
  - "history"
  - "independent-study"
  - "minecraft"
  - "open-source-communities"
  - "open-source-licenses"
  - "rochester-institute-of-technology"
coverImage: "open-source-minecraft-bukkit-gpl.png"
---

Once upon a time, when I was a teenager, I volunteered in the Minecraft open source community. I volunteered as a staff member of the largest open source Minecraft server today, called [Spigot](https://www.spigotmc.org/wiki/about-spigot/). Spigot is a fork of the Bukkit project.

This blog post is a story roughly covering 2010 to 2014 on the meaning, values, and promise of open source. This story impacted a community of hundreds of thousands of people, mostly adolescent children, teenagers, and young adults. It is a tale about the simultaneous success and failure of the GNU Public License (GPL).

<!--more-->

## From the beginning: Bukkit, Minecraft, and the GPL

In the beginning, in December 2010, there was **Bukkit**.

![Bukkit Project logo](/blog/2020/03/bukkit-logo.png)

> Bukkit is an up-and-coming Minecraft Server mod that will completely change how running and modifying a Minecraft server is done - making managing and creating servers easier and providing more flexibility. Learning from the mistakes made by other mods, Bukkit aims to be different and fill the void left by them: built from the ground up we've focused on performance, ease-of-use, extreme customisability and better communication between the Team and, you, our users. The overall design of Bukkit has been inspired by other mods and our experience as Minecraft players just like yourselves, giving us a unique perspective and advantage going into the creation of the Bukkit Project.
> 
> [About Us](https://web.archive.org/web/20141211115250/https://bukkit.org/pages/about-us/), Bukkit.org

Bukkit was an open source server for Minecraft. It provided an API for developers to create plugins that extended Minecraft in unique and fun ways. While Bukkit was not the first open source Minecraft server, it was the first organized project. Bukkit launched with the GNU Public License (GPL) v3 license.

From 2011 to 2014, Bukkit was the de-facto standard for running a Minecraft multiplayer game server. Over time, more Bukkit servers (and derivatives) were used than the official server software distributed by Mojang. Mojang is the company responsible for Minecraft development.

### Hard work on Bukkit recognized

The project's success was also recognized by Mojang too. At the first-ever Minecraft convention in 2011, MINECON, four Bukkit lead developers were hired by Mojang to work on Minecraft. All but one of the hired employees then departed from Bukkit. That one developer who remained active in Bukkit would depart from Mojang mysteriously in 2013.

{{< x user="EvilSeph" id="385537792794959872" >}}

However, there was always one caveat. Bukkit was an open source project licensed under the GPLv3. However, it also reverse-engineered some parts of the Minecraft game code to build its server code and API. This was never a problem for Bukkit or Mojang:

> "When we started up Bukkit in December of 2010, we decided we wanted to do things right. Right from the beginning we wanted to be sure we were bringing about a positive change to Minecraft, one that Mojang themselves would approve of. To that end, we set up a meeting with Mojang to get a feel for their opinions on our project and make sure we weren't doing anything they didn't like. The gist of the meeting was that Mojang "liked what we were doing" but not how we had to go about doing things. Unfortunately, we both knew that we had no alternatives, so we continued along - albeit now with the reassurance that our project would most likely not be shut down any time in the future."
> 
> EvilSeph (Warren Loo), "[Bukkit: The Next Chapter](https://web.archive.org/web/20150112163638/https://bukkit.org/threads/bukkit-the-next-chapter.62489/)"

Nobody ever raised a copyright issue over the reverse-engineered code from Minecraft in Bukkit. Yet, for years, the GPL code released by Bukkit included bits from official Minecraft code.

## Act 1: The Minecraft EULA

_An alternative perspective on the Minecraft EULA is in this Guardian article. "[Minecraft: how a change to the rules is tearing the community apart.](https://www.theguardian.com/technology/2014/jun/24/minecraft-how-a-change-to-the-rules-is-tearing-the-community-apart)"_

* * *

All was fine for a number of years. Bukkit was a volunteer-led project even after some of its core developers were hired to work at Mojang. However, in 2014, unrelated tension started to grow in the Minecraft community.

The tension was about the language used in Minecraft's End User License Agreement (EULA). The EULA used ambiguous language over the monetization of Minecraft multiplayer servers:

> "The one major rule is that you must not distribute anything we‘ve made. By “distribute anything we‘ve made” what we mean is “give copies of the game away, make commercial use of, try to make money from, or let other people get access to our game and its parts in a way that is unfair or unreasonable"."
> 
> 2014: [account.mojang.com/documents/minecraft\_eula](https://web.archive.org/web/20140706191831/https://account.mojang.com/documents/minecraft_eula)

While many open source projects flourished around Minecraft, a huge game server industry also co-existed in this ecosystem. Multiplayer server owners running Bukkit (or derivative projects, like Spigot) created web stores for their servers. Players paid real money to buy in-game perks for a specific multiplayer server. Using open source plugins, players paid for things like item packages with diamond swords or virtual currency to spend in-game.

This behavior was allowed to flourish for years. However, the EULA was discreetly edited in December 2013. In mid-2014, someone in the community noticed the changed language. They tweeted and tagged a Mojang employee asking if this meant multiplayer servers had to stop selling in-game items for real money. In as much detail that a 2014 tweet with a 140-character limit allowed, the Mojang employee confirmed the EULA language did technically forbid that.

### Panic! In The Bukkit Server

"_Then, everything changed when the Fire Nation attacked._"

The community erupted into chaos. Suddenly, a community that had mostly co-existed peacefully was at a virtual war with each other. The situation was understandable from both ends, if for different reasons.

Anyone could start their own multiplayer server. So it was possible for malicious servers to scam players (usually young children) of money. Usually this happened by failing to deliver on the purchases or closing down after a period. Frequently, Mojang was contacted for help (usually by angry parents) about game servers Mojang did not control.

At the same time, many good people built (probably unwise) business models around the permissive nature of Minecraft intellectual property. The open source software made it easy to extend Minecraft in ways Mojang did not intend.

## Act 2: The Bukkit cards are revealed

Tension was already high between the the trinity of business owners, open source developers, and Mojang. By 2014, Mojang was a multi-million dollar company (even before their multi-billion Microsoft buyout). The EULA tension placed a heavy burden on the open source developers, who received pressure from both ends.

Then, the unexpected happened on August 21st, 2014. The Bukkit project lead, Warren Loo (EvilSeph), announced the end of development on the Bukkit project:

{{< x user="EvilSeph" id="502360729803317248" >}}

> Read the [full announcement](https://web.archive.org/web/20151105173217/https://bukkit.org/threads/bukkit-its-time-to-say.305106/) from Bukkit team

### Bukkit gets "owned"

This was sad news. But the real shock came an hour later when the lead developer of Minecraft at Mojang shot back on Twitter:

{{< x user="jeb_" id="502380018216206336" >}}

Two other former Bukkit developers working at Mojang chimed in too:

{{< x user="_grum" id="502381523241144320" >}}

{{< x user="Dinnerbone" id="502389963606867968" >}}

It was now revealed that the Bukkit open source developers hired by Mojang in 2011 had given up their personal copyright and rights to their open source contributions as part of their employment contracts. The open source developer and business owner communities both learned this abruptly over a 140-character tweet.

The community was confused, upset, and angry.

> "The decision to keep the acquisition of the Bukkit codebase a secret was made between Mojang and Curse, which only recently came to light. I was completely unaware that I had spent the last two years of my life as a Bukkit Administrator, and successor to the project lead, under the illusion that the project was independently ran. Had I known back then perhaps my choice would have been different, perhaps not. It’s easy to speculate on what might have been, but unless faced head on with the choice, the decision is not always clear."
> 
> TnT, "[So long, and thanks for all the fish](https://web.archive.org/web/20150215082334/https://bukkit.org/threads/so-long-and-thanks-for-all-the-fish.305350/)"

What is known now was that for about three years, the volunteer-driven open source project was "owned" by company valued for millions of dollars that did little to support the open source project that helped build a community around the game. The only visible contribution made by Mojang to Bukkit was the explicit permission to continue their endeavor in the legal gray area.

## Act 3: DMCA take-down of Bukkit

On September 5th, 2014, a lead developer not hired by Mojang, who had contributed over 15,000 lines of code to the project, invoked a [Digital Millennium Copyright Act](https://en.wikipedia.org/wiki/Digital_Millennium_Copyright_Act) (DMCA) take-down on all of [his personal contributions](https://github.com/github/dmca/blob/master/2014/2014-09-05-CraftBukkit.md) to the project (and all derivative projects). **In a day, all the source code for a project used ~3x more than Mojang's official server software disappeared from the Internet**.

It is easy to understand why this lead developer did what he did. To find out the last few years of your life spent volunteering on a game project that was secretly owned by a multi-million dollar company is a shattering experience. It's essentially free labor. But at the same time, this was a project used by hundreds of thousands of people around the world. It was more than a project; it was also a community.

One of the lead developers of Bukkit said this of the project in their [resignation letter to the community](https://web.archive.org/web/20161213172659/https://bukkit.org/threads/bukkit-an-autobiography.310083/):

> "The Bukkit Project is so much more than CraftBukkit, getting updates out and providing API. It's about giving the community a place where they feel welcomed and can program to their hearts' content with the use of our product. The Bukkit API gave people the ability to change the behavior of Minecraft, but it would have meant nothing without the contributions from the plugin developers in the community."
> 
> [feildmaster](https://bukkit.org/members/feildmaster.82116/)

The DMCA take-down wasn't just a take-down of the software; it also was a take-down of a community. The overnight disappearance of Bukkit left a huge power vacuum full of bitterness, personal harassment, and doxing. (Don't forget this was also the era of [#GamerGate](https://en.wikipedia.org/wiki/Gamergate_controversy).)

## Who was this community?

The project I participated with, Spigot, was a fork of Bukkit created in 2012. Like Bukkit, Spigot was also hit by the DMCA take-down, although the Spigot team worked out a clever legal workaround to continue development.

A huge plugin community and third-party software around Bukkit's API grew around both Bukkit and Spigot. The unusual thing was, with few exceptions, most of the leaders of these communities were young adults in their 20s, teenagers, or even 11 year old kids. Open source wasn't a strongly understood concept in this community. **It was just what everyone did**. The messaging around licensing was [not always great](https://www.spigotmc.org/threads/the-most-important-part-of-your-project-might-not-even-be-a-line-of-code.121682/), but working in the open was the nature of how this gaming community operated.

### The spirit of open source died

For this community, the promise and glory of open source died. For years, the Bukkit developer team shared their belief in open source with the community:

> "Bukkit chose to go the open source route with our API for several reasons. Not only is open source awesome, but we knew that there were many talented individuals within the Minecraft community that could help us evolve, mature and grow our project much faster than we could have ever dreamed on our own."
> 
> EvilSeph (Warren Loo), "[Bukkit Project Changes and Improvements](https://web.archive.org/web/20150308122118/https://bukkit.org/threads/bukkit-project-changes-and-improvements.133798/)"

But with the complications of a project doomed to failure under the GPL that never should have been, combined with the hidden secret of ownership and DMCA take-down of open source code, the promise of open source both helped and failed this community.

### Who was right? Who was wrong?

On one hand, the lead developer who issued the DMCA take-down was able to vent the frustration faced by those who discovered their secret "free labor" agreement with Mojang (at a great personal cost, as he was harassed, stalked, and received death threats). On the other hand, the collective community faced the end of an era brought about extraordinary circumstances that actually voided the GPL as a valid license:

> "A license is a contract. There are many reasons why a contract would be void, and many conditions that make a contract invalid from the get-go. One such condition is being “tricked” into the agreement, which would include agreeing to work on a project under false pretenses. As stated above, an open source project being secretly purchased by a company, in hopes to have that company’s game be improved through it, is as close to a loophole for free labor as you will find. Free labor was outlawed in this country a while ago. We had a whole war about it."
> 
> /u/VideoGameAttorney, "[My Response to Vubui, Mojang, and the hundreds (yes, hundreds) of you who asked me to weigh in on this.](https://www.reddit.com/r/Minecraft/comments/2fk5nn/my_response_to_vubui_mojang_and_the_hundreds_yes/)"

The only conclusion I can muster on this saga is from that same Reddit thread: "_But at the end of the day, don’t just believe one side is “good” and the other “bad” here. These things are rarely so simple._"

## Why did I write this?

Because I keep coming back to this story, across my life. I was writing an event report about a [copyleft licensing conference](https://jwfblog.wpenginepowered.com/2020/04/copyleftconf-2020-quick-rewind/) I went to [in February 2020](https://jwfblog.wpenginepowered.com/tag/2020-foss-conferences/), when I recapped this same story to someone there in-person. It wasn't the first time I told this story at a conference though. It's such an interesting case study of copyleft licensing.

Because it is in the open source gaming world and the largest demographic of this particular gaming community is under 30 years old, many folks who have been "around the block" in open source are unaware of this story.

But as my first open source community and also something I invested nearly a whole decade of my life into (as have countless others), this experience shaped my outlook on open source and community in an unusual way. It's an experience I can't forget. Even if I only have an abrupt ending to this story, it's a story that I think deserves to be told, in respect to those who invested far more time, energy, money, and tears in this than I ever have.
