---
title: "Introducing InfluxDB: Time-series database stack"
date: 2017-08-15
categories: 
  - "foss"
  - "tech"
tags: 
  - "databases"
  - "fedora-planet"
  - "getting-started"
  - "influxdata"
  - "influxdb"
  - "infrastructure"
  - "metrics"
  - "research-and-learning"
  - "things-you-should-know-understand"
  - "time-series-data"
coverImage: "osdc_520x292_opendata_0613mm.png"
---

[_Article originally published on Opensource.com._](https://opensource.com/article/17/8/influxdb-time-series-database-stack)

* * *

The needs and demands of infrastructure environments changes every year. With time, systems become more complex and involved. But when infrastructure grows and becomes more complex, it's meaningless if we don't understand it and what's happening in our environment. This is why monitoring tools and software are often used in these environments, so operators and administrators see problems and fix them in real-time. But what if we want to predict problems before they happen? Collecting metrics and data about our environment give us a window into how our infrastructure is performing and lets us make predictions based on data. When we know and understand what's happening, we can prevent problems before they happen.

But how do we collect and store this data? For example, if we want to collect data on the CPU usage of 100 machines every ten seconds, we're generating a lot of data. On top of that, what if each machine is running fifteen containers? What if you want to generate data about each of those individual containers too? What about by the process? This is where time-series data becomes helpful. Time-series databases store time-series data. But what does that mean? We'll explain all of this and more and introduce you to InfluxDB, an open source time-series database. By the end of this article, you will understand…

- What time-series data / databases are
- Quick introduction to InfluxDB and the TICK stack
- How to install InfluxDB and other tools

<!--more-->

## Introducing time-series concepts

![Example of table, or how a RDBMS like MySQL stores data](/blog/2017/07/rbdms-table-example.gif "Example of table, or how a RDBMS like MySQL stores data. Image from [DevShed](http://www.devshed.com/c/a/php/using-the-active-record-pattern-with-php-and-mysql/).")

If you're familiar with relational database management software (RDBMS), like MySQL, [tables, columns, and primary keys](http://www.informit.com/articles/article.aspx?p=377067&seqNum=3) are familiar terms. Everything is like a spreadsheet, with columns and rows. Some data might be unique, other parts might be the same as other rows. RBDMS's like MySQL are widely used and are great for **reliable transactions** that follow [ACID](https://en.wikipedia.org/wiki/ACID) (Atomicity, Consistency, Isolation, Durability) compliance.

With relational database software, you're usually working with data that is something you could model in a table. You might update certain data by overwriting and replacing it. But what if you're collecting on data on something that generates a lot of data and you want to watch change over time? Take a self-driving car. The car is constantly collecting information about its environment. It takes this data and it analyzes changes over time to behave correctly. The amount of data might be tens of gigabytes an hour. While you could use a relational database to collect this data, they're not built for this. When it comes to scaling and usability of the data you're collecting, an RBDMS isn't the best tool for the job.

#### Why time-series is a good fit

And this is where time-series data makes sense. Let's say you're collecting data about a city traffic, temperature from farming equipment, or the production rate of an assembly line. Instead of going into a table with rows and columns, imagine pushing multiple rows of data that are uniquely sorted by a timestamp. This visual might help make more sense of this.

![Imagine rows and rows of data, uniquely sorted by timestamps](/blog/2017/07/picture-the-cloud.gif "Imagine rows and rows of data, uniquely sorted by timestamps. Image from [Timescale](https://blog.timescale.com/what-the-heck-is-time-series-data-and-why-do-i-need-a-time-series-database-dcf3b1b18563).")

Having the data in this format makes it easier to track and watch change over time. When data accumulates, you can see how something behaved in the past, how it's behaving now, and how it might behave in the future. Your options to make smarter data decisions expands!

Curious how the data is stored and formatted? It depends on the time-series database (TSDB) you use. InfluxDB stores the data in the [Line Protocol](https://docs.influxdata.com/influxdb/v1.3/write_protocols/line_protocol_tutorial/) format. [Queries](https://docs.influxdata.com/influxdb/v1.3/tools/api/#query) return the data in JSON.

![How InfluxDB stores time-series data in JSON](/blog/2017/07/influxdb-data-format.jpg "How InfluxDB stores time-series data in [Line Protocol](https://docs.influxdata.com/influxdb/v1.3/write_protocols/line_protocol_tutorial/). Image from [Roberto Gaudenzi](https://www.slideshare.net/RobertoGaudenzi1/introduction-to-influx-db).")

If you're still confused or trying to understand time-series data or why you would want to use it over another solution, you can read an excellent, in-depth explanation from [Timescale's blog](https://blog.timescale.com/what-the-heck-is-time-series-data-and-why-do-i-need-a-time-series-database-dcf3b1b18563) or [InfluxData's blog](https://www.influxdata.com/modern-time-series-platform/).

## InfluxDB: A time-series database

[InfluxDB](https://www.influxdata.com/time-series-platform/influxdb/) is an open source time-series database software developed by [InfluxData](https://www.influxdata.com/). It's written in Go (a compiled language), which means you can start using it without installing any dependencies. It supports multiple data ingestion protocols, such as [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/) (also from InfluxData), [Graphite](https://graphiteapp.org/), [collectd](https://collectd.org/), and [OpenTSDB](http://opentsdb.net/). This leaves you with flexible options for how you want to collect data and where you're pulling it from. It's also one of the [fastest-growing](https://db-engines.com/en/ranking/time+series+dbms) time-series database software available. You can find the source code for InfluxDB on [GitHub](https://github.com/influxdata/influxdb).

This article will focus on three tools in InfluxData's TICK stack for how you can build a time-series database and begin collecting and processing data.

#### TICK stack

InfluxData creates a platform based on four open source projects that work and play well with each other for time-series data. When used together, you can collect, store, process, and view the data easily. The four pieces of the platform are known as the [TICK stack](https://www.influxdata.com/time-series-platform/). This stands for…

- **_T_elegraf**: Plugin-driven server agent for collecting / reporting metrics
- **_I_nfluxDB**: Scalable data store for metrics, events, and real-time analytics
- **_C_hronograf**: Monitoring / visualization UI for TICK stack (not covered in this article)
- **_K_apacitor**: Framework for processing, monitoring, and alerting on time-series data

These tools work and integrate well with the other pieces by design. However, it's also easy to substitute one piece out for another tool of your choice. For this article, we'll explore three parts of the TICK stack: InfluxDB, Telegraf, and Kapacitor.

![Diagram of how the different components of the InfluxDB TICK stack connect with each other](/blog/2017/07/tick-stack-diagram.png "Diagram of how the different components of the TICK stack connect with each other. From [influxdata.com](https://www.influxdata.com/time-series-platform/).")

#### [InfluxDB](https://docs.influxdata.com/influxdb/)

As mentioned before, InfluxDB is the time-series database (TSDB) of the TICK stack. Data collected from your environment is stored into InfluxDB. There are a few things that stand out about InfluxDB from other time-series databases.

###### Emphasis on performance

InfluxDB is designed with performance as one of the top priorities. This allows you to use data quickly and easily, even under heavy loads. To do this, InfluxDB focuses on quickly ingesting the data and using compression to keep it manageable. To query and write data, it uses an HTTP(S) API.

The performance notes are noteworthy standing up the amount of data InfluxDB is capable of handling. It can handle up to a million points of data per second, at a precise level even to the nanosecond.

###### SQL-like queries

If you're familiar with SQL-like syntax, querying data from InfluxDB will feel familiar. It uses its own SQL-like syntax, [InfluxQL](https://docs.influxdata.com/influxdb/v1.3/query_language), for queries. As an example, imagine you're collecting data on used disk space on a machine. If you wanted to see that data, you could write a query that might look like this.

```
SELECT mean(diskspace_used) as mean_disk_used
FROM disk_stats
WHERE time() >= 3m
GROUP BY time(10d)
```

If you're familiar with SQL syntax, this won't feel too different. The above statement will pull the mean values of used disk space from a three-month period and group them by every ten days.

###### Downsampling / data retention

When working with large amounts of data, storing it becomes a concern. Over time, it can accumulate to huge sizes. With InfluxDB, you can **downsample** into less precise, but smaller metrics that you can store for longer periods of time. **Data retention policies** for your data enable you to do this.

For example, pretend you have sensors collecting data on the amount of RAM in a number of machines. You might collect metrics on the amount of memory in use by multiple users, the system, cached memory, and more. While it might make sense to hang on to that data for thirty days to watch what's happening, after thirty days, you might not need it that precise. Instead, you might only want the ratio of total memory to memory in use. Using data retention policies, you can tell InfluxDB to hang on to the precise data for all the different usages for thirty days. After thirty days, you can average data to be less precise, and you can hold on to that data for six months, forever, or however long you like. This compromise meets in the middle between keeping historical data and reducing disk usage.

#### [Telegraf](https://docs.influxdata.com/telegraf/)

If InfluxDB is where all of your data is going, you need a way to collect and gather the data first. Telegraf is a metric collection daemon that gathers various metrics from system components, IoT sensors, and more. It's [open source](https://github.com/influxdata/telegraf) and written completely in Go. Like InfluxDB, Telegraf is also written by the InfluxData team and is built to work with InfluxDB. It also includes support for different databases, such as MySQL / MariaDB, MongoDB, Redis, and more. You can read more about it on [InfluxData's website](https://www.influxdata.com/time-series-platform/telegraf/).

Telegraf is modular and heavily based on plugins. This means that Telegraf is either lean and minimal or as full and complex as you need it. Out of the box, it supports over a hundred plugins for various input sources. This includes Apache, Ceph, Docker, IPTables, Kubernetes, NGINX, and Varnish, just to name a few. You can see all the plugins, including processing and output plugins in their [README](https://github.com/influxdata/telegraf#input-plugins).

Even if you're not using InfluxDB as a data store, you may find Telegraf useful as a way to collect this data and information about your systems or sensors.

#### [Kapacitor](https://docs.influxdata.com/kapacitor/)

Now we have a way to collect and store our data. But what about doing things with it? Kapacitor is the piece of the stack that lets you process and work with the data in a few different ways. It supports both stream and batch data. Stream data means you can actively work and shape the data in real-time, even before it makes it to your data store. Batch data means you retroactively perform actions on samples, or batches, of the data.

One of the biggest pluses for Kapacitor is that it enables you to have real-time alerts for events happening in your environment. CPU usage overloading or temperatures too high? You can set up several different alert systems, including but not limited to email, triggering a command, Slack, HipChat, OpsGenie, and many more. You can see the full list in the [documentation](https://docs.influxdata.com/kapacitor/v1.3/nodes/alert_node/).

Like the previous tools, Kapacitor is also [open source](https://github.com/influxdata/kapacitor) and you can read more about the project in their [README](https://github.com/influxdata/kapacitor/blob/master/README.md).

## Installing the TICK stack

Packages are available for nearly every distribution. You can install these packages from the command line. Use the instructions for your distribution.

#### Fedora

```
sudo dnf install https://dl.influxdata.com/influxdb/releases/influxdb-1.3.1.x86_64.rpm \
https://dl.influxdata.com/telegraf/releases/telegraf-1.3.4-1.x86_64.rpm \
https://dl.influxdata.com/kapacitor/releases/kapacitor-1.3.1.x86_64.rpm
```

#### CentOS 7 / RHEL 7

```
sudo yum install https://dl.influxdata.com/influxdb/releases/influxdb-1.3.1.x86_64.rpm \
https://dl.influxdata.com/telegraf/releases/telegraf-1.3.4-1.x86_64.rpm \
https://dl.influxdata.com/kapacitor/releases/kapacitor-1.3.1.x86_64.rpm
```

#### Ubuntu / Debian

```
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.3.1_amd64.deb \
https://dl.influxdata.com/telegraf/releases/telegraf_1.3.4-1_amd64.deb \
https://dl.influxdata.com/kapacitor/releases/kapacitor_1.3.1_amd64.deb
sudo dpkg -i influxdb_1.3.1_amd64.deb telegraf_1.3.4-1_amd64.deb kapacitor_1.3.1_amd64.deb
```

#### Other distributions

For help with other distributions, see the [Downloads](https://portal.influxdata.com/downloads) page.

## See the data, be the data

Now that you have the tools installed, you can experiment with some of these tools. There's plenty of upstream documentation on all three projects. You can the docs here:

- [InfluxDB documentation](https://docs.influxdata.com/influxdb/)
- [Telegraf documentation](https://docs.influxdata.com/telegraf/)
- [Kapacitor documentation](https://docs.influxdata.com/kapacitor/)

Additionally, for more help, you can visit the [InfluxData community forums](https://community.influxdata.com/). Happy hacking!
