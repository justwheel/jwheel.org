---
title: "WordPress Cron, CloudFlare, and SSL"
date: 2015-12-16
categories:
  - "tech"
tags:
  - "bugfix"
  - "cloudflare"
  - "encryption"
  - "fedora-planet"
  - "ssl"
  - "wordpress"
---

_Edit_: I haven't tried this in a while, but this is one of my most popular blog posts. If you try this and it works, please consider leaving a comment and let me know if anything can be improved. Thanks!

* * *

Thanks to the power of [LetsEncrypt](https://letsencrypt.org/), I recently moved most of my sites over to using HTTPS, or in other words, SSL. I also use [CloudFlare](https://www.cloudflare.com/) for managing most of my sites as well. What I wasn't fully aware of was that CloudFlare also limits scripts to increase performance (among other things). This broke WordPress cron, without my knowledge! How does one fix this issue?

![WordPress cron, CloudFlare, and SSL are not always friends](/blog/2015/12/cloudflare-banner.png "CloudFlare is a service that aims to make websites faster and more secure.")

<!--more-->

## WordPress cron scheduling breaks

Shortly after I transitioned from HTTP to HTTPS, I began noticing that many of my posts began missing their originally scheduled time. This was frustrating, as I often schedule my posts for hours when I am away or asleep, to best reach international audiences. I would wake up the following day to see that my posts failed to go out.

Using the [wp-cli utility](http://wp-cli.org/), I was able to find that my WordPress site's cron functionality was effectively broken. Using `wp-cli cron test` resulted in the following output:

```
Error: WP-Cron spawn failed with error: Cannot communicate securely with peer: no common encryption algorithm(s).
```

Aha! So now I knew what the issue was. Unfortunately, finding hits on Google with similarly worded searches were unsuccessful. I remembered that this was a problem that was recently encountered on the [Fedora Magazine](https://fedoramagazine.org/), so I asked puiterwijk, member of the Fedora Infrastructure team, about what his experience was when he fixed the same issue for the Magazine. However, his answer was completely different than what I thought the problem might be.

## Fixing WordPress cron

The way to resolve this issue is simple. You need to map your blog's domain or sub-domain on your machine to the loopback address in order for your site to communicate securely with CloudFlare without the script being blocked. To do this, open your favorite text editing utility and edit `/etc/hosts` on your machine. The file should look something like this.

```
127.0.0.1 localhost
127.0.0.1 blog.example.com
```

Once you make this change, it's time to test. You can test whether all is functioning by either using the wp-cli test or using `curl` to verify the file is not being blocked.

```
$ curl -i https://jwfblog.wpenginepowered.com/wp-cron.php
HTTP/1.1 200 OK
Server: nginx/1.6.3
Date: Tue, 08 Dec 2015 01:12:47 GMT
Content-Type: text/html
Transfer-Encoding: chunked
Connection: keep-alive
X-Powered-By: PHP/5.4.16
```

Alternatively, if you chose to use the wp-cli utility, you should try running the cron test command. Your output should be similar.

```
$ wp cron test
Success: WP-Cron spawning is working as expected.
```

Congratulations! Your WordPress cron scheduling is back to normal.

###### Credit

All credit for the findings behind this article are thanks to [puiterwijk](http://fedoraproject.org/wiki/User:Puiterwijk) from the Fedora Infrastructure team! It would have taken me a longer time to figure this out on my own. If you're in a Fedora IRC channel, you should give Patrick a cookie (`puiterwijk++`). This guy does so much for Fedora and his dedication is astounding!
