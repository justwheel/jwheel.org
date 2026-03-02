---
title: "Hatchit puts open source power in developers' hands"
date: 2016-11-03
categories: 
  - "education"
  - "foss"
  - "tech"
tags: 
  - "communication"
  - "community"
  - "fedora-planet"
  - "gaming"
  - "hfoss"
  - "rochester-institute-of-technology"
---

[_This post was originally published on OpenSource.com._](https://opensource.com/life/16/10/hatchit)

* * *

More and more students are learning about the world of open source through video games. Games like [FreeCiv](http://www.freeciv.org/) let players build empires based on the history of human civilization while games like [Minetest](http://www.minetest.net/) emulates Minecraft in an open source block-building sandbox. Students are encouraged to dig deeper into games like this, and projects like [SpigotMC](https://www.spigotmc.org) empower kids to write plugins to extend their favorite games. However, the tools in open source to build the actual games do not share the same prominence. [Rochester Institute of Technology](https://www.rit.edu/) student [Matt Guerrette](https://github.com/MattGuerrette) hopes to help change that with his open source gaming engine, [Hatchit](https://github.com/thirddegree/Hatchit).

<!--more-->

## Introducing Hatchit

Hatchit was a project started between [Matt Guerrette](https://github.com/MattGuerrette) and fellow student [Arsen Tufankjian](https://github.com/Honeybunch) together in February 2016. After working with game engines for other classes, they both found challenges over how popular game engines are designed for developers. They noted that these game engines were more design-oriented. It lacked some technical details they were looking for when working on their own personal or academic projects. Together, they had the idea to build their own open source gaming engine with a goal of exposing more of the technical sides of the process to developers. "We want to give you more access to the programming side of the game engine," Matt explains.

Hatchit is written in C/C++ and licensed in a mix between GPL and LGPL. Originally, the project was started to take advantage of the [DirectX](https://en.wikipedia.org/wiki/DirectX) APIs for development. However, Guerrette and Tufankjian ran into an unexpected event while they were getting started. Nvidia released the [Vulkan](https://developer.nvidia.com/Vulkan) APIs in competition to the DirectX APIs. Originally, they had attempted to support both APIs simultaneously, but later opted to focus on Vulkan.

#### Inspiration for Hatchit

Guerrette remembers a specific type of task he wanted to accomplish with Hatchit. In the game editor, he wanted to be able to construct a render pass instead of having the engine handle it internally. An earlier project had motivated the need for this feature. By being able to create the render passes in real time, a developer would be able to create something like a custom shader that bends vertices into straight, geometric shapes in real-time. His earlier project, Mineshaft Mayhem, demonstrates this concept with how the mineshaft seems to be warping and turning, but the tunnels are actually straight in the editor.

\[embed\]https://www.youtube.com/watch?v=tzLMCVoDDGs\[/embed\]

You can find more videos of Guerrette's work on his [YouTube channel](https://www.youtube.com/channel/UC5HDOa8-y1loj3SUm4Zxzyw).

## What's happening now

Since starting the project, Tufankjian graduated and is now working at Amazon Game Design. Over the summer, the community started to show interest in the project. They've received a pull request from one member outside of the core developer team and have several issues filed against the [different repositories](https://github.com/thirddegree) for the engine.

Matt has a few milestones set ahead for the project this year. One of the biggest tasks he is working on is getting the Vulkan renderer multi-threaded design implemented and working. This vastly speeds up the render time when working on projects and is also proving one of the greatest challenges so far. In addition to the multi-threaded design, he hopes to have game objects and components serialized with JSON. This would make it easier for the editor application to modify game data and manipulate configurations with [Qt](https://en.wikipedia.org/wiki/Qt_\(software\)).

## Looking at FOSS and Hatchit

Guerrette is not unfamiliar with open source, but this is his largest undertaking yet with an open source project. While working on the project, using an open source development model has made it easier to receive feedback, work with community contributors outside of the RIT community, and also handle some technical aspects well.

#### Benefits of working in the open

Working on the project on GitHub has proved to benefit the project in a variety of ways. One of the most clear ways this helped is having people file issues and raise concerns over parts of the code. In one case, someone filed an issue against an older library that made a mathematical error in its calculations. "Having the world's eyes on your project to catch errors is a good thing," Matt said. Guerrette found the freedom to use other open source libraries and dependencies for the engine especially useful. All the licenses were compatible and presented no issue to work with.

Some technical challenges were also made easier with open source tooling. One of the greatest challenges for the Hatchit team was writing the build system to use build system generator software and maintain compatibility with both Windows and Linux. Locally linking dependencies in the project was inconvenient and made the project unnecessarily huge. With git, they used submodules to link dependencies in the repository and build them from source when compiling Hatchit. "Being able to link dependency repositories has been really useful, especially for developing on Windows," Matt found. Additionally, some of the continuous integration features on GitHub and other services made it easy to quickly test new changes for compatibility.

#### Challenges of open source

Along the way, some challenges came by developing in the open that the team worked to resolve. With the convenience of using git submodules also came a difficulty of tracking upstream changes. On occasion, a dependency might break in the project. The team then has to check if the project has updated or changed upstream or if a fix needs to be made locally in their project.

Additionally, community outreach is a challenge Guerrette is hoping to focus on as the new project lead. He shares development updates on his [YouTube channel](https://www.youtube.com/channel/UC5HDOa8-y1loj3SUm4Zxzyw) and occasionally will stream his development on [livecoding.tv](https://www.livecoding.tv/). One thing is working on to make it easier for new contributors to get involved is recommending them to try building the engine from the source code. This gives potential developers experience with compiling the engine and walks them through a variety of documentation available with the project.

## Get involved

The Hatchit team is working further on the game engine and are looking for community participation. To get involved, Guerrette recommends checking out the l[Hatchit Gitter chat](https://gitter.im/thirddegree/Hatchit) and to review the [README file](https://github.com/thirddegree/Hatchit/blob/master/README.md) on the main repository. Any contributions are welcome, either in the form of pull requests or filing issues.
