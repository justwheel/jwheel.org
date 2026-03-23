---
title: "HFOSS: Smoke test an XO laptop"
date: 2016-02-22
categories: 
  - "education"
  - "foss"
tags: 
  - "fedora-planet"
  - "hfoss"
  - "olpc-xo"
  - "quality-assurance-qa"
  - "rochester-institute-of-technology"
  - "sugar-on-a-stick"
---

![XO laptop used by the One Laptop Per Child (OLPC) program](https://upload.wikimedia.org/wikipedia/commons/4/42/XO-Beta1-mikemcgregor-2.jpg "The XO laptop deployed by the One Laptop Per Child (OLPC) program")

For the next homework assignment in my [Humanitarian Free and Open Source Software Development](https://hfoss-ritjoe.rhcloud.com/) (HFOSS) course, we were tasked with running a [smoke test](http://wiki.laptop.org/go/Smoke_test/11.2.x/1_hour_smoke_test) of the [XO laptops](https://en.wikipedia.org/wiki/OLPC_XO) we are assigned for class. Some of the laptops are notoriously more broken than others. Seeing as how some of these date to around ten years ago, it's easy to understand how they have been become more defunct over the years.

Part of my assignment was to run some basic tests and practices on my XO laptop to make sure it would be capable for most core functionalities. This article will serve as my step-by-step smoke test report on my XO laptop, which I have affectionately named [Hedron](https://youtu.be/InwMS4J7f-8).

<!--more-->

## Beginning the smoke test: Start up

The first part of the one hour smoke test guide is to make sure the laptop starts up as expected and functions correctly while starting up. This part of the smoke test took the shortest amount of time.

- Does the XO start up? **Yes**
- Do the power LED and backlight work? **Yes**
- Does the activity ring show after booting? **Yes**
- Does it automatically connect to a known WiFi network? **Yes**

In short, the bare minimum requirement (i.e. "does it work?") was met.

## Running activities in the smoke test

For the most part, every activity I ran had the expected behavior that the smoke test walk-through gave. Since there were more things working than there was not, I have a short list of the things that weren't working below.

- **eToys Activity**: Not installed
- **Read Activity**:
    - Cannot scroll through PDFs (scroll bar non-responsive)
    - Cannot close and open a new document
    - _Terminal Activity_ doesn't parse anywhere near readable
- **TurtleArt Activity**: Not installed
- **Wikipedia Activity**: Cannot search for articles

## Transfer files to USB

Transferring files between the XO and a USB drive worked well. However, I didn't actually do this from the SoaS interface, but I switched over to the GNOME2 environment to accomplish this. Perhaps this was cheating, but it was the most effective way to easily move media between flash media and the XO.

My use case was trying to put a `yum-utils` RPM file on the machine. Oddly enough, the XO doesn't come with `yum-utils` prepackaged, which makes it difficult to navigate when it comes to updating the XOs to new repository locations.

## Smoke Test Collaboration

On Friday, a group of us met in the Simone Center lobby to work on testing some of the group activities on the XOs. We hit three different activities, and the process we used is documented below.

To begin, we all connected to the same WiFi network (`rit`) since the WPA2 Enterprise network on RIT's campus didn't play nicely with some of the XOs. There were four of us, so we split into pairs to try the activities since they didn't work well with more than one other person.

The four of us that met were:

- [Stephen](https://spg1502igme582.wordpress.com/)
- [Wilfried](http://blog.wilfriede.me/)
- [Bobby](https://rdp1070.wordpress.com/)

#### Chat

We were able to successfully open a chat room and talk with each other on our local connection. There were a few inconsistencies like messages being delivered late and other minor mishaps, but overall, the functionality behaved as expected.

#### Distance

Wilfried and Stephen were able to successfully get the Distance activity to work between their XOs. However, Bobby and I were unable to get them to initiate with each other in the time that we were working on this. We weren't sure if this was a network hiccup or an actual deficiency on the XO.

#### Write

We were able to use the Write activity to write in the same notepad as another user. Despite being slow and lackadaisical, it did actually work as expected.

## Suspension

The final test I ran on the XO was shutting the laptop and seeing if it would resume from its former point when I reopened the XO. It was able to do this as expected.

* * *

In short, I think I lucked out and received one of the most functional devices in the class. After comparing the class inventory to mine, it seems like Hedron the XO is in pretty good shape.
