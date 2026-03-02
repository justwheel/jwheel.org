---
title: "Write more accessible Markdown images with this one simple trick"
date: 2019-06-18
categories: 
  - "foss"
  - "perspective"
tags: 
  - "access"
  - "accessibility"
  - "becoming-the-better-ally"
  - "best-practices"
  - "communication"
  - "dei"
  - "fedora-planet"
  - "things-you-should-know-understand"
  - "writing"
coverImage: "markdown-accessible-text-one-simple-trick.jpg"
---

Sometimes the people we exclude are the ones we did not realize were there. [Screen readers](https://en.wikipedia.org/wiki/Screen_reader) are an essential tool for blind and visually-impaired people to use software and browse the Internet. In open source projects and communities, Markdown is a [lightweight markup language](https://en.wikipedia.org/wiki/Markdown) used to format text. It is also used in many other places. Often you need to embed an image into whatever you are writing (a picture, a diagram, or some useful visual aid to get your point across). One of the lesser-known and used features of Markdown are **alt tags for images**.

<!--more-->

## Use alt tags for Markdown images

Often an embedded picture in Markdown looks something like this:

```
![Screenshot_2019-06-14.jpg](https://example.com/Screenshot_2019-06-14.jpg)
```

When you render the Markdown, you see your picture. However, you don't see the `Screenshot_2019-06-14.jpg` string. You might wonder what its purpose is or why bother changing it at all. But imagine for a moment if instead of seeing your picture when you rendered your Markdown, you only saw `Screenshot_2019-06-14.jpg` where your picture should be. Screen reader users often encounter this problem.

So instead, describe your Markdown image so a person that uses a screen reader can also follow the conversation:

```
![A flowchart describing how user data flows from a publisher, to a proxy, and to a group of subscribers](https://example.com/Screenshot_2019-06-14.jpg "A flowchart describing how user data flows from a publisher, to a proxy, and to a group of subscribers")
```

It takes an extra few seconds of your time, but it is one small way you can help make a better Internet for everyone.

P.S. – The text wrapped in quotation marks between the parentheses adds the [`title` HTML attribute](https://www.w3schools.com/tags/att_global_title.asp) to your image, so the text appears as a tooltip when you mouse over the image. The more you know!

* * *

_Photo by [Roman Kraft](https://unsplash.com/@romankraft) on [Unsplash](https://unsplash.com/search/photos/newspaper)_
