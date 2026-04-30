---
title: "How to set up a ListenBrainz development environment"
date: 2017-10-04
categories: 
  - "education"
  - "metabrainz"
  - "foss"
  - "tech"
tags: 
  - "containers"
  - "data"
  - "docker"
  - "fedora-planet"
  - "getting-started"
  - "independent-study"
  - "listenbrainz"
  - "metabrainz"
  - "music"
  - "musicbrainz"
  - "open-source"
  - "rit-2171"
  - "rochester-institute-of-technology"
images: ["/img/listenbrainz-rit-independent-study.png"]
---

_This post is part of a series of posts where I contribute to the ListenBrainz project for my independent study at the Rochester Institute of Technology in the fall 2017 semester. For more posts, find them in [this tag](https://jwfblog.wpenginepowered.com/tag/rit-2171/)._

* * *

One of the first rites of passage when working on a new project is creating your development environment. It always seems simple, but sometimes there are bumps along the way. The first activity I did to begin contributing to ListenBrainz was create my development environment. I wasn't successful with the documentation in the README, so I had to play around and work with the project before I was even running it.

The first part of this post details how to set up your own development environment. Then, the second half talks about the solution I came up with and my first contribution back to the project.

<!--more-->

## Install dependencies: Docker

This tutorial assumes you are using a Linux distribution. If you're using a different operating system, install the necessary dependencies or packages with your preferred method.

ListenBrainz ships in Docker containers, which helps create your development environment and later deploy the application. Therefore, to work on the project, you need to install Docker and use containers for building the project. Containers save you from installing all of this on your own workstation! Since I'm using Fedora, I run this command.

```
sudo dnf install docker docker-compose
```

## Register a MusicBrainz application

Next, you need to register your application and get a OAuth token from MusicBrainz. Using the OAuth token lets you sign into your development environment with your MusicBrainz account. Then, you can import your plays from somewhere else.

To register, visit the [MusicBrainz applications page](https://musicbrainz.org/account/applications). There, look for the option to [register your application](https://musicbrainz.org/account/applications/register). Fill out the form with these three options.

- **Name**: (any name you want and will recognize, I used `listenbrainz-server-devel`)
- **Type**: `Web Application`
- **Callback URL**: `http://localhost/login/musicbrainz/post`

After entering this information, you'll have a OAuth client ID and OAuth client secret. You'll use these for configuring ListenBrainz.

#### Update config.py

With your new client ID and secret, update the ListenBrainz configuration file. If this is your first time configuring ListenBrainz, copy the sample to a live configuration.

```
cp listenbrainz/config.py.sample listenbrainz/config.py
```

Next, open the file with your favorite text editor and look for this section.

```
# MusicBrainz OAuth
MUSICBRAINZ_CLIENT_ID = "CLIENT_ID"
MUSICBRAINZ_CLIENT_SECRET = "CLIENT_SECRET"
```

Update the strings with your client ID and secret. After doing this, your ListenBrainz development environment is able to authenticate and log in from your MusicBrainz login.

## Initialize ListenBrainz databases

Your development environment needs some databases present to work. Before proceeding, run these three commands to initialize the databases.

```
docker-compose -f docker/docker-compose.yml -p listenbrainz run --rm web python3 manage.py init_db --create-db
docker-compose -f docker/docker-compose.yml -p listenbrainz run --rm web python3 manage.py init_msb_db --create-db
docker-compose -f docker/docker-compose.yml -p listenbrainz run --rm web python3 manage.py init_influx
```

Your development environment is now ready. Now, let's actually see ListenBrainz load locally!

## Run the magic script

Once you have done this, run the `develop.sh` script in the root of the repository. Using `docker-compose`, the script creates multiple Docker containers for the different services and parts of the ListenBrainz server. Running this script will start Redis, PostgreSQL, InfluxDB, and web server containers, to name a few. But this also makes it easy to stop them all later.

```
./develop.sh
```

You will see the containers build and eventually run. Leave the script running to see your development environment. Later, you can shut it down by pressing `CTRL^C`. Once everything is running, visit your new site from your browser!

[http://localhost/](http://localhost/)

Now, you are all set to begin making changes and testing them in your development environment!

## Making my first pull request

As mentioned earlier, my first attempt at a development environment was unsuccessful. My system kept denying permission to the processes in the containers. After looking at system audit logs and running a temporary `setenforce 0`, I tried the script one more time. Everything suddenly worked! So the issue was mostly with SELinux.

With my goal to get my environment set up, I figured out a few issues with the configuration offered by the project developers. I eventually made [PR #257](https://github.com/metabrainz/listenbrainz-server/pull/257) against `listenbrainz-server` with my improvements.

#### Labeling SELinux volume mounts

To diagnose the issue, I started with a quick search and found a [StackOverflow question](https://stackoverflow.com/questions/24288616/permission-denied-on-accessing-host-directory-in-docker) with my same problem. There, the question was about Docker containers and denied permissions in the container. The answers explained it was an SELinux error and the context for the containers was not set. However, temporarily changing context for a directory didn't seem too effective and doesn't persist across reboots.

Continuing the search, I found an issue filed against `docker-compose` about the `:z` and `:Z` flags for volume mounts. These flags set SELinux context for containers, with the best explanation I found coming from [this StackOverflow answer](https://stackoverflow.com/a/35222815/2497452).

> Two suffixes :z or :Z can be added to the volume mount. These suffixes tell Docker to relabel file objects on the shared volumes. The 'z' option tells Docker that the volume content will be shared between containers. Docker will label the content with a shared content label. Shared volumes labels allow all containers to read/write content. The 'Z' option tells Docker to label the content with a private unshared label.

Therefore, I added the `:z` flag to all the volume mounts in the `docker-compose.yml` file. I submitted a fix upstream for this in [listenbrainz-server#257](https://github.com/metabrainz/listenbrainz-server/pull/257)!

#### Correct the startup port

In the README, it says the server will start on port 8000, but the `docker-compose.yml` file actually started the server on port 80. I included a fix for this in [my pull request](https://github.com/metabrainz/listenbrainz-server/pull/257) as well.

## git push!

This post makes a debugging experience that actually took hours look like it happened in minutes. But after getting over this hurdle, it was awesome to finally see ListenBrainz running locally on my workstation. It was an even better feeling when I could take my improvements and send them back in a pull request to ListenBrainz. Hopefully this will make it easier for others to create their own development environments and start hacking!
