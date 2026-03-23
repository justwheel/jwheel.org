---
title: "IRC for the 21st century: introducing Riot"
date: 2017-08-08
categories: 
  - "foss"
  - "tech"
tags: 
  - "communication"
  - "community"
  - "fedora-planet"
  - "getting-started"
  - "irc"
  - "matrix"
  - "messaging"
  - "open-source-communities"
  - "things-you-should-know-understand"
coverImage: "riot-matrix-osdc.png"
---

[_This article was originally published on Opensource.com._](https://opensource.com/article/17/5/introducing-riot-IRC)

* * *

[Internet Relay Chat](https://en.wikipedia.org/wiki/Internet_Relay_Chat), or IRC, is one of the oldest chat protocols around and still popular in many open source communities. IRC's best strengths are as a decentralized and open communication method, making it easy for anyone to participate by running a network of their own. There's also a variety of clients and bots available for IRC. But on the reverse side, usability is a concern. Most common user interfaces for IRC clients or platforms aren't always intuitive. People from parts of the world with unstable Internet connections are challenged with remaining connected to participate in conversation. Many people have tried addressing this problem before, but none have come as far as Riot.

<!--more-->

## What is Riot?

[Riot](https://riot.im/) is a free, open source, and multi-platform client based on the [Matrix](https://matrix.org/) protocol. To understand better, think of Matrix as the protocol and Riot as the client. Matrix is a decentralized, secure, messaging protocol. It has the benefit of using HTTP / JSON APIs, is capable of sending and receiving messages with full end-to-end encryption, WebRTC VoIP / video calling, and maybe most importantly, integration capabilities. Matrix was built to integrate with IRC servers and other communication protocols, meaning you can use the Riot client as an [IRC bouncer](https://opensource.com/article/17/4/never-leave-irc-again). You can read more of the details on what separates Matrix from Riot [on their FAQ](https://matrix.org/docs/guides/faq.html#what-is-the-difference-between-matrix-and-irc).

As a result, Riot becomes most useful in its implementation as the default Matrix client. It's convenient and decentralized, as anyone is able to launch their own Matrix "homeserver" and connect it with Riot. However, Matrix by default has servers bridged with [Freenode](https://freenode.net/), [Mozilla IRC](https://wiki.mozilla.org/IRC#Connect_to_the_Mozilla_IRC_server), and more. This lets you use Riot as a persistent client that keeps you connected to IRC even when you're not there.

\[caption id="attachment\_619" align="alignright" width="788"\][![Riot desktop application on Fedora Linux using Matrix](/blog/2017/03/intro-riot-01-logged-in.png)](/blog/2017/03/intro-riot-01-logged-in.png) Riot desktop application\[/caption\]

Outside of the web application, you can also find it as a [desktop application](https://riot.im/desktop.html) for Mac, Windows, and Linux, or a mobile application for iOS and Android. In this guide, you'll learn how to get started using Riot as a full-time messaging client with the default Matrix / IRC integration servers.

## Register and get a client

First, you'll need to grab an account from Riot's website. Registration is straightforward and shouldn't take you much time. You can find the registration form [here](https://riot.im/app/). Once you're registered and have confirmed your email, you'll need to get the Riot applications on your devices of choice.

#### Desktop clients

There are desktop clients available for Windows, macOS, and Linux. If you're running Windows or macOS, you can download the right version for your desktop on the [Riot downloads](https://riot.im/desktop.html) page. If you're using Debian, Ubuntu, or a related operating system, you can add a repository to your system to install the Riot desktop client. You can read [this guide](http://data.agaric.com/how-install-riot-desktop-matrix-client-debian-based-systems) on how to add the repository and install Riot to your system.

##### Fedora

Riot is not yet officially packaged in Fedora's repositories. However, there is a [third-party Copr repository](https://copr.fedorainfracloud.org/coprs/taw/Riot/) where the desktop application is packaged. Until it makes it into Fedora's repositories, you can use this version to get started with Riot. You can find the Copr project and install instructions [here](https://copr.fedorainfracloud.org/coprs/taw/Riot/).

#### Mobile clients

Want to have Riot integrated on your phone or prefer a mobile client? You can also find official versions of Riot on [iOS](https://itunes.apple.com/us/app/vector.im/id1083446067), [Google Play Store](https://play.google.com/store/apps/details?id=im.vector.alpha), and [F-Droid](https://f-droid.org/repository/browse/?fdid=im.vector.alpha). Using any of the mobile clients will integrate fully with a desktop client, if you choose to use both. This guide will focus more on the desktop clients.

## Setting up Freenode in Riot

Riot currently supports eight IRC networks: Freenode, Moznet, Snoonet, OFTC, GIMPNet, Foonetic, Rizon, and EsperNet. Although you can use any network you like and the instructions will mostly be the same, this guide focuses on using [Freenode](https://freenode.net).

#### Joining your first channel

One of the first things you'll see after signing into Riot is the directory. In the directory, you can search through chat rooms on Matrix itself or any of the other IRC servers that are integrated. To join your first channel, you can select the IRC channel of choice in the dropdown menu and search for a channel.

For example, if we want to find `#opensource.com` on Freenode, you can select the Freenode option and search for `#opensource.com`. Once it's there, you can join and say hello to the rest of the Opensource.com community hanging out in IRC.

\[caption id="attachment\_623" align="aligncenter" width="788"\][![Searching for #opensource.com on Freenode from Matrix / Riot client](/blog/2017/03/intro-riot-05-join-opensource.com_.png)](/blog/2017/03/intro-riot-05-join-opensource.com_.png) Searching for #opensource.com on Freenode from Riot client\[/caption\]

Alternatively, if you would prefer directly joining a room, you can type the following as a command from any chat window in Riot.

```
/join #freenode_#channelname:matrix.org
```

#### Setting your IRC nick

\[caption id="attachment\_624" align="alignright" width="788"\][![Send a message to @appservice-irc:matrix.org to change your IRC nick in Matrix / Riot](/blog/2017/03/intro-riot-07-message-appservice.png)](/blog/2017/03/intro-riot-07-message-appservice.png) Send a message to `@appservice-irc:matrix.org` to change your IRC nick\[/caption\]

By default, your IRC nick, or username, will be similar to your display name in Riot. Sometimes it will have a `[m]` appended to the end. However, after you connect to a channel, you can [change your nick](https://github.com/matrix-org/matrix-appservice-irc/blob/master/HOWTO.md#changing-nicks) on the IRC side as well. You'll need to start a new conversation with the IRC integration bot between Riot and Freenode.

In the bottom left corner of your Riot client, you can start a new personal chat with any user. To message the IRC integration bot, start a new chat with `@appservice-irc:matrix.org`. This will put you and the bot together in a private chat. To change your nick, send the following command to the bot:

```
!nick irc.freenode.net <IRC nick>
```

You should receive a confirmation message, similar to: "_Nick changed from 'OldNick' to 'NewNick.'_" For more help, you can read the [official documentation](https://github.com/matrix-org/matrix-appservice-irc/blob/master/HOWTO.md#changing-nicks) on changing your nick.

#### Authenticating with NickServ

One of the other vital functions you might need to do is authenticate with NickServ. This is especially important if you want to use your registered IRC nick or are a member of invite-only channels. However, it's possible to do this too.

You'll need to start another direct chat again. This time, you can search for the user `@freenode_NickServ:matrix.org`. This will put you into a private message with NickServ on Freenode's servers. To authenticate, you can send a message just like you normally would.

```
IDENTIFY <username> <password>
```

After doing this, you should receive the normal confirmation that you are now logged in as your account. Remember to use caution when opening this chat in a public place, as your password will be displayed in plaintext whenever you open that direct message with NickServ.

## Say hello!

Once you've joined a channel, claimed your nick, and authenticated with NickServ, you will be all set to begin using Riot. In any channel bridged in IRC with Matrix, all of your messages from Riot will show up in the IRC channel. Riot can also act like an IRC bouncer that keeps you persistently connected. Whenever you open Riot, you will be able to see a log of past discussions even if you weren't connected to the Internet.

Both Matrix and Riot are open source projects. You can find [Matrix's code](https://github.com/matrix-org) and [Riot's code](https://github.com/vector-im) on GitHub. If you want to better understand how the integration bridge works, you can read [this blog post](https://matrix.org/blog/2017/03/14/an-adventure-in-irc-land/) by one of the developers.

Have any comments or stories to share about using Riot? Are you already using it for IRC? Share your comments with us down below!
