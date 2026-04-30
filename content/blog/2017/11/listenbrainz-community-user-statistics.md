---
title: "ListenBrainz community gardening and user statistics"
date: 2017-11-13
categories: 
  - "education"
  - "metabrainz"
  - "foss"
  - "tech"
tags: 
  - "containers"
  - "fedora-planet"
  - "google"
  - "google-bigquery"
  - "independent-study"
  - "listenbrainz"
  - "metabrainz"
  - "metrics"
  - "musicbrainz"
  - "open-source"
  - "open-source-communities"
  - "rit-2171"
  - "rochester-institute-of-technology"
  - "selinux"
images: ["/img/listenbrainz-rit-independent-study.png"]
---

_This post is part of a series of posts where I contribute to the ListenBrainz project for my independent study at the Rochester Institute of Technology in the fall 2017 semester. For more posts, find them in [this tag](https://jwfblog.wpenginepowered.com/tag/rit-2171/)._

* * *

My progress with ListenBrainz slowed, but I am resuming the pace of contributing and advancing on my independent study timeline. This past week, I finished out assigned tasks to discuss contributor-related documentation, like a Code of Conduct, contributor guidelines, and a pull request template. I began research on user statistics and found some already created. I wrote one of my own, but need to learn more about Google BigQuery to advance further.

<!--more-->

## Paving the contributor pathway

![Making it easier for people to contribute user statistics to ListenBrainz](/blog/2017/11/Screenshot-from-2017-11-13-02-05-12.png "Making it easier for people to contribute to ListenBrainz with helpful contibuting guidelines")

Earlier, I identified weaknesses for the ListenBrainz contributor pathway and found ways we could improve the pathway. This started with the development environment documentation. Now, I helped draft first revisions of our [contributor guidelines](https://github.com/metabrainz/listenbrainz-server/pull/287), [Code of Conduct reference](https://github.com/metabrainz/listenbrainz-server/pull/286), and [pull request templates](https://github.com/metabrainz/listenbrainz-server/pull/288). Together, these three documents have two goals.

1. **Make it easier** to contribute to ListenBrainz
2. Have a better experience and **have fun** contributing!

Adding these documents addresses these goals. Additionally, the [GitHub community profile](https://github.com/metabrainz/listenbrainz-server/community) also highlights these deliverables as ways to meet these goals. After getting feedback and seeing what others think, we make more revisions later (with some trial runs).

## Back to SELinux context flags

Recently, I set my desktop back up and installed Docker for the first time on this machine; however, the development environment still failed to start. When I ran the script, it would eventually error out because of a permission denial. The web server image for ListenBrainz was failing.

After debugging, I noticed that I missed the SELinux volume tags for the ListenBrainz web server images in my original pull request, [#257](https://github.com/metabrainz/listenbrainz-server/pull/257). When I created the pull request, I might have had cached data that let my laptop run the development environment without a problem. In either case, it was an easy fix and I knew what the issue was when it happened. Therefore, I submitted a new fix in [#290](https://github.com/metabrainz/listenbrainz-server/pull/290).

## Writing new user statistics

The most interesting part of my independent study is working with the music data to build and generate interesting statistics. I finally began exploring the [existing statistics](https://github.com/metabrainz/listenbrainz-server/tree/master/listenbrainz/stats) in ListenBrainz. The statistic queries use BigQuery standard SQL. BigQuery helps rapidly scan and scale data queries to help with performance (I have a lot to learn about BigQuery).

#### Two types of statistics

Additionally, ListenBrainz generates **two types** of statistics:

1. Site-wide statistics
2. User statistics

Site-wide statistics are metrics non-specific to a single user. There is only [one site-wide query](https://github.com/metabrainz/listenbrainz-server/blob/master/listenbrainz/stats/sitewide.py) now. It counts how many artists were ever submitted to this ListenBrainz instance and returns an integer. There's room for expansion in site-wide statistics.

On the other hand, user statistics are metrics specific to a single user. There's a [fair number already](https://github.com/metabrainz/listenbrainz-server/blob/master/listenbrainz/stats/user.py), like the top artists and songs in a time period and the number of artists you've listened to. These are a little more complete and offer more expansion for doing cool front-end work with something like [D3.js](https://d3js.org/).

#### Writing user statistics

Of course, I had to try writing my own. One helpful query I thought of was getting a count of the songs you listened to over a time period (e.g. "you listened to 500 songs this week!"). I haven't tested it yet, but I have this in a local branch and hope to test it with real data soon.

```
def get_play_count(musicbrainz_id, time_interval=None): 
 
 filter_clause = "" 
 if time_interval: 
     filter_clause = "AND listened_at >=
     TIMESTAMP_SUB(CURRENT_TIME(), 
     INTERVAL {})".format(time_interval) 
 
 query = """SELECT COUNT(release_msid) as listen_count 
            FROM {dataset_id}.{table_id} 
            WHERE user_name = @musicbrainz_id 
            {time_filter_clause} 
            LIMIT {limit} 
         """.format( 
                 dataset_id=config.BIGQUERY_DATASET_ID, 
                 table_id=config.BIGQUERY_TABLE_ID, 
                 time_filter_clause=filter_clause, 
                 limit=config.STATS_ENTITY_LIMIT, 
            ) 
 
 parameters = [ 
     { 
         'type': 'STRING', 
         'name': 'musicbrainz_id', 
         'value': musicbrainz_id 
     } 
 ] 
 
 return stats.run_query(query, parameters)
```

## Researching Google BigQuery

My next steps for the independent study are researching [Google BigQuery](https://cloud.google.com/bigquery/docs/). After going through the existing statistics and understanding how ListenBrainz generates them, an understanding of Google BigQuery is essential to writing effective queries. When I become more comfortable with the tooling and how it works, I want to map out a plan of statistics to generate and measure.

Until then, the hacking continues! As always, keep the FOSS flag high…
