---
title: "Mumble ready for testing"
date: 2015-12-03
categories: 
  - "fedora"
  - "foss"
  - "tech"
tags: 
  - "2010s"
  - "fedora-packaging"
  - "fedora-planet"
  - "linux"
  - "mumble"
  - "packaging"
---

## Mumble is back in Fedora

![Mumble, a free and open-source VoIP program](https://communityblog.fedoraproject.org/wp-content/uploads/2015/12/Mumble.png "Mumble, a free and open-source VoIP program")

The popular Voice Over IP (VoIP) program, [Mumble](http://wiki.mumble.info/wiki/Main_Page), is being repackaged again for Fedora 22 and 23. Fedora contributor [fedpop](https://bodhi.fedoraproject.org/users/fedpop) unretired the package from the Fedora Package Database and is working on getting it added to the stable repositories.

Mumble is available for testing for Fedora 22 and 23 users. Once enough positive feedback is received, it will be added back to the stable repositories for all users. Testers are welcome, especially for Fedora 22!

<!--more-->

## How to test Mumble

To test, open a command line and run the following command.

```
$ sudo dnf install mumble --enablerepo=updates-testing
```

Confirm the installation and the application will appear on your system. Give it a run and make sure everything works as expected! If it all checks out, leave feedback for the build in Bodhi so the package. This helps move it closer to being packaged for the stable repositories (links are below).

For help enabling the testing repository, see the [QA Testing wiki article](https://fedoraproject.org/wiki/QA:Updates_Testing).

## Why I love Mumble

Mumble is a package I originally installed when I first began using Fedora in Fedora 20. It is one of the few major VoIP clients that can be classified as "FOSS" (Free and Open Source) and is available on multiple platforms. It's fairly simple to get a server (Murmur) up and running, and it's a great way for communicating over voice with friends, family, or communities. I used to use it often when I was active in various Minecraft server communities, and for a short time, I used it for my own Minecraft community as well.

When it originally disappeared in Fedora 21, I was disappointed since Mumble is an important piece of software that I think is important in any modern Linux distribution. Finally, Fedora users will once again be able to seamlessly install it without having to manually compile the software.

Big hat tip to fedpop for repackaging this awesome piece of software! This also seems to be his first experience as a Fedora packager, so a big welcome goes out to him as well. I can't wait to start recommending Mumble again for Fedora users.

## Find it in Bodhi

**[Fedora 22](https://bodhi.fedoraproject.org/updates/FEDORA-2015-789c21d8a6)**

**[Fedora 23](https://bodhi.fedoraproject.org/updates/FEDORA-2015-934a0702cf)**
