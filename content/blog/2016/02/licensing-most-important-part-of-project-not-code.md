---
title: "The most important part of your project might not even be a line of code"
date: 2016-02-10
categories: 
  - "foss"
  - "tech"
tags: 
  - "copyright"
  - "fedora-planet"
  - "gplv3"
  - "hfoss"
  - "open-source-licenses"
  - "things-you-should-know-understand"
---

![Open-source licensing: how does it affect your work?](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Puzzly_sharing_%28from_licensing_tutorial%29.svg/327px-Puzzly_sharing_%28from_licensing_tutorial%29.svg.png "Open-source licensing: how does it affect your work?")

Today's entry to the blog is sourced from a thread that I posted on the [SpigotMC Forums](https://www.spigotmc.org/threads/the-most-important-part-of-your-project-might-not-even-be-a-line-of-code.121682/). If you wish to join in the discussion about this, feel free to chime in on the thread or leave a comment on my blog. In this post, I covered licensing, licenses, and why your open-source software project should have a license. You can read my original post in this blog entry.

<!--more-->

* * *

I'd like to share some personal and real-word advice to many of you contributing open-source resources to Spigot, but also to other open-source software projects you may work on even outside of just Minecraft or Spigot.

## Licensing

What is licensing? Why does it matter? Why should you care? There are many reasons that licensing is an important part of a project you are working on. You are taking the time to write code and share it with the world in an open way, such as publishing it on GitHub, Bitbucket, or any number of other code-hosting services. Anyone might stumble across your code and find it useful.

Licensing is the way that you can control exactly how someone who finds your code can use it and in what ways.

## Okay, why does it _really_ matter?

Maybe you've been writing code for a really long time and you've never bothered with licenses and don't feel the need to. I'd like to present two hypothetical situations that I see pop up all the time, one in Spigot and one in the greater open-source community.

#### Your Plugin

You have spent a lot of time writing an awesome resource and you pushed all of your code on GitHub! Woohoo, project complete! You package it up as a JAR and submit out to the open. Skip ahead a few months, and maybe you no longer have the time to contribute to your project. Or maybe someone has an awesome idea for a totally different plugin that uses similar functionality to what you have written.

A new person finds your code on GitHub and discovers that it has the perfect method or algorithm for his own project. Or maybe they want to continue your project with new, fresh energy! But you have no license for your code. By default, this means [default copyright laws](http://choosealicense.com/no-license/) will apply to your code. **This is an extremely limiting type of copyright enforcement and almost defeats the entire purpose of even open-sourcing your code.** A law-abiding programmer might just give up on the project and look elsewhere, or maybe a not-so-law-abiding programmer will secretly copy and paste your code without attributing your work back to you. This helps neither you or the friendly programmer looking at continuing or forking your work.

In many cases, the SpigotMC Staff receive reports about people "copying" other peoples' code. **Having a licensed project makes reviewing these reports 10x easier**. People without licenses or with ambiguous sources makes it extremely difficult to review and make decisions about whether projects are copies.

By licensing your code, you are protecting your own work and writing the rules to how people can use your code. If you are open-sourcing your code, usually the point is to have collaboration with others and give back to the community by allowing others to tinker, modify, or play with what you have created. Make it easier for others to contribute, help, or build new awesome things by choosing a license!

#### Your Project

For any open-source software project on the Internet, having a license is very, very important. For example, let's say you write an important library or utility that can be used to make a developer's life easier for making a user interface more friendly. Your program is well-designed and has usefulness outside of what even you intended to write it for.

Perhaps a large company stumbles across your code and also thinks it's very useful for their own project. Maybe their project is proprietary or closed-source. Having a license in a situation like this suddenly becomes very important. Some licenses would permit this company to take the plugin or library, modify it to their own needs, and include it in their own product, while only leaving a small mention to you in the "Legal" section of their app. Maybe you're okay with that! Maybe you're not.

If you're not, there are licenses that let you define how the code is used in a case like this. With some licenses, if the company decides to modify and use your code, they will have to open-source their changes that made as well. If they don't modify anything, they just have to link back to your original source code. In some more extreme licenses, anything that touches your code also by extension has to be open source.

For a Minecraft example of this, let's say you have a "Super Craft Bros." plugin open-sourced on your GitHub. Hypixel stumbles across your code and decides they want to use it for their own servers. Let's say your code is licensed under the [Mozilla Public License 2.0](https://www.mozilla.org/en-US/MPL/2.0/). For this license, if they take your code and make no changes, they only have to give credit back to you. If they take your code and change it, they also have to open-source all of the changes they make to your code.

Now, the changes made by the bigger company can benefit many others instead of just the one company!

## What licenses are there?

If you Google "open source licenses", you may be overwhelmed. There are maybe close to the hundreds of different licenses for you to choose from. How can you pick one to settle on?! Fortunately, there are websites that do a great job of summarizing licenses to exactly what others can or cannot do with your code. A very popular site is [tldrlegal.com](https://tldrlegal.com/), which provides bullet-point summaries of different licenses.

###### [tldrlegal.com](https://tldrlegal.com/)

Exploring that site is a great reference for picking a license. However, in this thread, I'm going to do a very quick summary of four of the most popular open-source licenses that exist. However, it is important to preface this with a statement: I am not a lawyer and this does not constitute legal advice. It is important for you to look more into a license that feels right for how you want to share your code and determine what others can do with it.

#### MIT License

![Open-sourcing licensing: the MIT License is the most relaxed](https://upload.wikimedia.org/wikipedia/commons/c/c3/License_icon-mit.svg "The MIT License may be the most relaxed open-source license available today")

The MIT License is almost universally regarded as one of the least strict licenses in open source. You can read more about it [here](https://tldrlegal.com/license/mit-license).

You can:

- Use the work commercially (think of the big company example said earlier)
- Modify the original code
- Distribute the original code or distribute your modifications
- Sublicense the code (in other words, use it with code that has a different license)
- Use the code for private use

You cannot:

- Hold the original author liable for damages
    - So this can't happen: "Oh noes! I accidentally exploded my entire server with your code! You must pay me monies to fix this nao!!!"

You must:

- Include a copyright notice in all copies or other uses of the work
- Include an original copy of the license with the original or modified code
    - You will always be credited for your work!

#### Apache License 2.0

![Open-source licensing: the Apache License 2.0 offers more than MIT License](http://www.apache.org/img/asf_logo.png "Slightly stricter than the MIT License, the Apache License 2.0 offers more protection to the author")

The Apache License 2.0 is only slightly more restrictive than the MIT License, but it defines a few more rules than the MIT License. This can be useful if you want to make sure your work is given proper credit back to you and you care a little more about how it's used. You can read more [here](https://tldrlegal.com/license/apache-license-2.0-%28apache-2.0%29).

You can and cannot do the same things mentioned above for the MIT License. So we will just highlight the changes!

You can:

- Same as MIT License
- **Use patent claims** (might be advanced for most of you, but can be useful for bigger projects)
- **Place a warranty** (lets you have a warranty on your code, if desired)

You cannot:

- Same as MIT License

You must:

- Same as MIT License
- **Openly state changes you make from the original project**
- **Include the NOTICE** (if the project has a NOTICE file, you have to keep it in copies / modified works)

#### Mozilla Public License 2.0

![Open-source licensing: Introducing the Mozilla Public License 2.0](https://opensource.com/sites/default/files/styles/image-full-size/public/images/law/OSCD_MPL_520x292_FINAL.png?itok=ELAkrGpF "Introducing the Mozilla Public License 2.0")

The next step up from the Apache License 2.0 is the Mozilla Public License 2.0. This license has the same basic rights as the Apache License 2.0, but it goes a little more in-depth about how the code can be re-used. This is my personal favorite license! You can read more [here](https://tldrlegal.com/license/mozilla-public-license-2.0-%28mpl-2%29).

Most of the things for what you can and cannot do are the same as the Apache License (and thereby, the MIT License). So again, we'll just highlight the changes.

You can:

- Same as Apache License 2.0

You cannot:

- Same as Apache License 2.0

You must:

- Same as Apache License 2.0
- **Disclose the source** (any changes made using MPL'd code must also be made open under the MPL!)
- **Include the original** (either the source code or instructions to get the original code must be provided)

#### GNU Public License v3

![Open-source licensing: the GNU Public License v3](https://upload.wikimedia.org/wikipedia/commons/9/93/GPLv3_Logo.svg "Open-source licensing: the GNU Public License v3")

The GNU Public License v3, also known as the GPLv3, is one of the most well-known and strict licenses in open-source. It has very specific rules for how the code can be used and shared, and leaves a lot of control over to the author. In a sense, it's "after" the MPL 2.0, but it also has some key differences. You can read more about it [here](https://tldrlegal.com/license/gnu-general-public-license-v3-%28gpl-3%29).

Again, we will highlight the changes from the Mozilla Public License 2.0.

You can:

- Same as Mozilla Public License 2.0 (**except sublicensing**)

You cannot:

- Same as Mozilla Public License 2.0
- **Sublicense the code** (this is a big concept worth understanding if you use the GPLv3)

You must:

- Same as Mozilla Public License 2.0
- **Include original copyright** (must be retained in all copies or modified works)
- **Include install instructions** (you must document how to install the software)

## Go forth and conquer!

Congratulations! You now know a little bit more about licensing, open-source licenses, and how to use them. Hopefully this will help emphasize why and how licenses are important in open-source software. In many ways, the license you choose to use can even be more important than any lines of code you write. That might sound absurd, but when it comes to deciding how your code can be reused, modified, or distributed, it's something that can be vitally important to your project.

Those of you without a license, please consider choosing one, or talk to other teammates of your projects about what license you all want to use. If you code in the open, make sure you are protecting yourself and paying attention to how you want other people to use your code.
