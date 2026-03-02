---
title: "Year of the Linux Desktop: Flock 2015 Summary"
date: 2015-10-26
categories: 
  - "fedora"
  - "foss"
tags: 
  - "fedora"
  - "fedora-planet"
  - "flock"
  - "linux"
---

[Flock to Fedora 2015](http://www.flocktofedora.org/) was a conference full of incredible people with incredible ideas, and it was a tough decision to decide which sessions to attend of all the good options. One that caught my eye was the "[When is the year of the Linux desktop?](http://flock2015.sched.org/event/638be2718b9c6bc1d87bc670dd67f175)" talk by Red Hat software engineering intern [Levente Kurusa](https://github.com/levex). Some of the key talking points of his session were evaluating why this statement always seems to be "next year" and why this awesome idea never seems to gain much ground. Are we doing something wrong? Can we improve somewhere? All of this, and more, Levente aimed to cover in his talk. I was fortunate enough to be in attendance of this talk!

<!--more-->

\[caption id="" align="alignright" width="500"\]![This is the year of the desktop, guys… this time… I promise…](http://cdn.meme.am/instances/500x/57403630.jpg) This is the year of the desktop, guys… this time… I promise…\[/caption\]

# The Negatives

## The desktop is broken

Without a moment's delay, the bold statement was offered by Levente: as of right now, the Linux desktop is _broken_.

56.26% of the desktop market share is Windows 7. 18.26% is Windows XP, 13.52% is Windows 8, 5.26% is OS X, 1.34% is Linux. Of the Linux distros out there, Mint, Ubuntu, Debian, OpenSUSE, and Fedora are the top five. Yet this doesn't seem that impressive considering how small of a position Linux as a whole takes in the desktop realm.

In terms of mobile-oriented operating systems, it's almost spectacularly reverse: 84.04% Android, 11.07% iOS, 2.09% Windows Phone, 2.80% is others. As many already know, Android is based off of the Linux kernel. So it's clear that we're doing something right with the mobile market. What can we take away from this and apply to the universe of the desktop?

**Answer**: We must be doing something wrong on the desktop!

## The masses

#### Choice

One reason why Linux doesn't appeal to the masses is the plethora of desktop environments; or in other words, _choice_! There are several different environments which provide different user interfaces… and they're all different. An end user can get lost in this as they're not going to care about how it runs under the hood – they just want it to be easy to use and have it be the same every time they use it. Android has about the same UI and  looks every year and every update. On the other hand, the controversial transition from [GNOME 2 to GNOME 3](http://www.datamation.com/open-source/gnome-2-vs.-gnome-3-1.html) completed changed the UI of the Linux desktop, subsequently not offering much consistency for users who avoid having to "learn something new".

In the big picture, they're all different. For developers and daily Linux users, this is good and awesome because they like choice and decision! But for the regular end user, this isn't good because they want consistency in how they use their computer. For the masses, the difference is bad.

Perhaps the answer is to never upgrade the computer, but that's bad from a security standpoint. Not to mention, it's certainly not very "cool" either. More often than that, having the latest and greatest in software is in the interest of users.

#### Configuration

The next big complaint is configuration. There's countless configuration applications, all with different settings, and then sometimes they all don't share the same settings. Again, we see the sad but true pattern of no consistency. Compare between KDE and MATE: you might configure something like printers in one desktop environment, but then you move to a different environment and they're all lost to the oblivion. You have to go through a painful workaround to reconfigure the same thing twice. This is probably why people love OS X computers because they promise to "just work", which they usually deliver on, at the expense of losing the freedom that a Linux distribution would offer.

#### Distributions

The next complaint, and possibly most controversial, is distributions themselves… we all love choice and variety, but for end users, with so many different distributions, it's another mess. Take installing Firefox. If you're running Fedora and want to install Firefox, but you found a .deb file, you're not going to have success because it's a Debian package, not an RPM package. If you're a computer newbie, you're likely not going to know (or care, for that matter) about the distribution that you're running. It'll just end in frustration and confusion for a non-technical end user. They don't want to figure out why it doesn't work or how to fix it – **they just want it to work**.

Examples of the above being `yum install` on Ubuntu, development packages in Fedora repositories, and… how do I set up my printers? These are reasons why people will switch from Linux back to Windows or OS X.

> "The efforts to standardize on a kernel and a set of core libraries were undermined by the Distro of the Day that held the position of power." - Miguel de Icaza

## Graphics

Another frustrating aspect of Linux is that the kernel can fully support a _4096-processor supercomputer_, but a laptop can have difficulties waking up from sleep.

This brings us into the next reason why the year isn't coming soon: **VGA and graphics**. We miss the "_it just works_" moments, and sometimes the issues with graphics drivers can be more frustrating and challenging than anything near enjoyable. In the kernel, it was suggested and subsequently dismissed to support graphics via VGA, but for reasons buried in the mailing lists, it's not in the interest of the kernel to support graphics. It's more of the desktop developers that do this.

But part of the issue is also with hardware manufacturers. If hardware manufacturers made their software utilities for Linux, it would allow for more powerful troubleshooting and debugging.

## Reverse Compatibility

Then we can look at reverse compatibility on the Linux desktop. Before looking at Linux, it's important to consider the number one adversary, Windows. Take  Win32k… Windows 98 apps can still run on Windows 8. That's 19 years of reverse compatibility. As much as we all love to hate on Microsoft, that's pretty incredible. Take GTK and Qt – neither are backwards compatible with older versions.

This goes hand in hand with the next point, rate of change. Windows updates its major version every two to three years, sometimes longer. There's usually no big changes in the interim period between major releases. You could be on XP and upgrade service packs and you won't notice anything significant. On the other hand, Linux distributions release far more frequently and sometimes introduce major changes, such as GNOME 2 to GNOME 3.

So these are the negatives of the Linux desktop. _**But!**_ There are positives…

# The Positives

## Gaming

Probably didn't expect to see this as a positive, did you? The gaming side of Linux is making leaps and bounds, and it's worth noting. Perhaps the most notable example is [SteamOS](http://distrowatch.com/table.php?distribution=steamos), which is completely based off of Linux. CryTek Engine, Unreal Engine 4.1, all of these major game design engines are turning to Linux and are encouraging more support for Linux platforms. This is a _major_ pull factor for users.

For gaming hardware, there are also positives. Nvidia is now compatible with bumblebee (which developers more familiar with this are praising), and there are many improvements to GPU drivers, such as performance, stability, and so much more. Some of the things that make us love Linux as a desktop.

# When is our year?

So… when is our year?! It's going to come… one day. Just not soon. There's too many issues in terms of appealing to the masses and making the Linux experience easier for end users.

Some people believe that the time has come and gone for the desktop, but the mobile market shines a light of a positive future for us. Is Android a better idea of the future than a Linux desktop environment? Only time will tell.

###### Sources

This talk was given by Levente Kurusa. Levente is a Linux enthusiast focusing mostly on kernel development. He is also a frequent speaker at various Linux events, where he talks about the various way an individual can join the kernel development community. He participated in an annual open source competition called Google Code-In, where he was a finalist for KDE and became a KDE developer in the process. He currently works for Red Hat on the Virtualization Team.

The majority of the content of this article was taken by my own notes I took during his talk – if you want a less pretty version, you can still read my [Pastebin summary](http://pastebin.com/jC91SNdh).
