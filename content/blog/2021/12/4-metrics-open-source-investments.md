---
title: "4 metrics to measure sustainable open source investments."
date: 2021-12-31
categories: 
  - "foss"
  - "tech"
  - "unicef"
tags: 
  - "2020s"
  - "chaoss-project"
  - "data"
  - "data-analysis"
  - "dei"
  - "fedora-planet"
  - "hfoss"
  - "metrics"
  - "open-source"
  - "reflections"
  - "sustainability"
  - "working-together"
coverImage: "sustainable-investments.jpg"
---

How do we understand value when we talk about sustainability? What does investing in open source mean? The meaning is different for many people because of an implicit understanding of what open source means.

This post is a reflection on the past year in my work with the [UNICEF Venture Fund](https://www.unicefinnovationfund.org/). We integrated new open source tools to capture metrics and data about open source repositories connected to UNICEF portfolio companies and created a shortlist of key metrics that map to business sustainability metrics. Now, we are better positioned to look back on past, current, and upcoming portfolio companies and mentor support programs.

As we move into 2022, this post covers my current thinking on these points:

1. Defining investments.
2. How do these investments impact sustainability?
3. CHAOSS metrics as an open source tool for an investment lens on sustainability.
4. What next?

<!--more-->

## Defining investments.

When we talk about investing in open source, what do we mean? What are the known inputs? What are the expected outputs? "Investments" and "investing" are broad terms. Investments typically mean sizeable financial injections of support and growth, but can also include non-financial investments too. Investments can also take the form of both time and energy (i.e. electricity and digital infrastructure).

The UNICEF Venture Fund provides equity-free funding for start-up companies building open source solutions of interest to UNICEF. All the start-up companies are registered companies in [UNICEF program countries](https://www.unicef.org/where-we-work). As part of the Venture Fund's location in the [Office of Innovation](https://www.unicef.org/innovation/), it is also a vehicle for UNICEF to explore frontier technology areas through the investments. When a start-up company is receiving investment from UNICEF, the company receives both funding and tailored mentorship about business and open technology.

A question I want to know is, **what is the impact of the received funding plus guided mentorship**? How does this approach enable the companies to be successful after graduating? What discoveries or knowledge could be shared with others to assist the development of their own open programs?

To summarize, **an investment can be financial or non-financial**. Financial investments include direct funding, grants, venture capital, fellowships, or any other exchange of capital. Non-financial investments include time spent in coaching sessions, personalized content for companies, and shared digital infrastructure. Neither list is exhaustive.

## How do these investments impact sustainability?

![Logo for Bitergia's Cauldron hosted analytics platform. A key part of metrics for UNICEF Venture Fund investments.](https://cauldron.io/static/img/cauldron-logo-white.png "Bitergia Cauldron.io (https://cauldron.io)")

Data makes introspection easier. Bitergia's [Cauldron.io](https://cauldron.io/) was a champion tool for kickstarting an open source metrics strategy for the UNICEF Venture Fund. Its introduction as a tool opened up a wider span of data to look at. There are new opportunities to ask questions and explore growth, scale, and sustainability.

In order to come to a conclusion on sustainability impact, we need streamlined data to test a thesis. The Venture Fund team improved internal processes to how metrics are collected from portfolio companies. The team is unifying behind fewer tools and methods to ensure we see the same data and have the same view of the data points we measure. This also provides a fresh opportunity to review how we measure open source impact across portfolio companies. Many have dashboards on Cauldron.io, but data needs a storyteller for it to make meaning. So, the next step is to ask questions with this new data and frame a thesis to measure and test the sustainability of Venture Fund investments into open source.

Many have traveled before me on the same trail of thought. I started first with the [Community Health Analytics Open Source Software (CHAOSS) project](https://chaoss.community/) and its metrics releases. This served as the initial point of brainstorming to frame questions and different scenarios of risk, evolution, DEI, and value.

## CHAOSS metrics as an open source tool for an investment lens on sustainability.

I reviewed the [latest release](https://chaoss.community/wp-content/uploads/2021/10/English-Release-2021-10-21.pdf) of CHAOSS metrics and narrowed down four metrics I want to measure in the next year. I also shared thoughts on why collect this data and how to do it. This blog post is no more than me wondering out loud, to help me frame an analytical approach for this metrics strategy.

The four metrics are detailed below:

1. Contribution Attribution
2. Contributors
3. Collaboration Platform Activity
4. Labor Investment

![A hand holds a pen and is writing on a sheet of notebook paper. They appear to be making a list.](/blog/2021/12/glenn-carstens-peters-RLw-UC03Gwc-unsplash.jpg "Take note of your dependencies and contributors.  
_Photo by Glenn Carstens-Peters (https://unsplash.com/@glenncarstenspeters?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on Unsplash (https://unsplash.com/s/photos/lists?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)_.")

### [Contribution Attribution](https://chaoss.community/metric-contribution-attribution/)

> Question: Who has contributed to an open source project and what attribution information about people and organizations is assigned for contributions?
> 
> [chaoss.community/metric-contribution-attribution/](https://chaoss.community/metric-contribution-attribution/)

This metric is insightful because it is targeted deeply into team and project culture. This metric is a good representation of how much the project leans into an open source model of building their project. This work ethos and intention to forge on an open source path is difficult to understand at times. If a team takes care to attribute their software dependencies and other contributors to their code (if any), this is a good sign that the team accepts collaboration as a value and encourages working with others.

I would measure this across two [types of contributions](https://chaoss.community/metric-types-of-contributions/): attributions for software dependencies including those with permissive licenses, and for any other direct contributors to the code and how they are recognized for their participation. This could be filtered in a red-yellow-green light approach:

1. **Red**: No attributions are made, or all attributions are inadequate.
2. **Yellow**: One of two attributions are made, or one attribution type is inadequately attributed.
3. **Green**: All dependencies and used works are correctly attributed.

![View looking down at a small farmer's market, where a woman sits behind several different cases of vegetables. A man hands payment to the woman for unseen goods. This is connected how knowing your customers can also be like knowing your community.](/blog/2021/12/alex-hudson-m3I92SgM3Mk-unsplash.jpg "Spend more time getting to know who participates and why.  
_Photo by Alex Hudson (https://unsplash.com/@aliffhassan91?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on Unsplash (https://unsplash.com/s/photos/bazaar?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)_.")

### [Contributors](https://chaoss.community/metric-contributors/)

> Question: Who are the contributors to a project?
> 
> [chaoss.community/metric-contributors/](https://chaoss.community/metric-contributors/)

This metric explores a more human dimension of the people and participants to an open source project. The metric defines contributors and contributions broadly, as "anyone who contributes to the project in any way." Understanding the people participating in a community, their motivations, goals, and why they choose to be in that community is important to understand sustainability. Otherwise, you may lose out on good opportunities to attract contributions from people who are already engaged, and new engagements may be difficult because of a mismatch of expectations.

This metric is more a means than it is an end; that is, it provides opportunities to ask more questions than provide detailed answers. Nevertheless, it does provide some guidance towards understanding contributors in a project, and it can lead to some concrete actions based on gathered insights. For example, this metric will enable deeper looks in areas of diversity, equity, and inclusion.

Since I work with start-up companies with small, lean development teams, I look to understand the motivations of the developers working on their projects and where the motivations may align with another open source solution. This enables the two communities to leverage their combined brainstorming for meeting complimentary goals around development and innovation.

To collect this data, I would have the team define what [areas of contribution](https://chaoss.community/metric-types-of-contributions/) they seek for their open source solutions and then map those desired contributions to a specific project area or different team members. This enables a form of consistent accountability for checking expectations with reality and understanding team capacity. Each area could be a key-value pair, where the value is the project area, team lead, or delegated team member for the type of contribution solicited.

![The dashboard of an older plane is shown, with several different meters, switches, and control knobs. In many ways, the places where we collaborate on our projects can also be as complicated, and we can miss out on some useful features if we are not looking in the right place.](/blog/2021/12/kai-dahms-5paXZX8lWk-unsplash.jpg "There are many ways to collaborate, but the question is, are you counting the right ways?  
_Photo by Kai Dahms (https://unsplash.com/@dilucidus?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on Unsplash (https://unsplash.com/s/photos/measure?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)_.")

### [Collaboration Platform Activity](https://chaoss.community/metric-collaboration-platform-activity/)

> Question: What is the count of activities across digital collaboration platforms (e.g., GitHub, GitLab, Slack, email) used by a project?
> 
> [chaoss.community/metric-collaboration-platform-activity/](https://chaoss.community/metric-collaboration-platform-activity/)

Collaboration platform activity is one effective proxy metric for community engagement if measured accurately. The metric does not define collaboration as much as it provides a data structure to measure it. It abstracts collaboration into key data points like timestamp, sender, whether the platform has threaded or non-threaded discussions, data collection date, and platform message identifier. To a degree, collaboration can be abstracted out in this way: a person takes any given action at a given time in a given way, and this action is measured as project-related activity on the collaboration platform.

There are a few possible approaches to collecting this data from UNICEF Venture Fund companies. Each approach does not cancel out another, but each approach could be combined with the others:

1. **Measure common git activity like commits, issues, pull/merge requests**. We already measure this data, but use it only in connection to validating Venture Fund workplans for each team with UNICEF portfolio manager(s).
2. **Count communications like comments, reviews, public messages, and other outreach**. Communications strategies and tools are typically inferred from common git activity. Measuring for engagement and stratifying those metrics into a smaller group could allow for deeper insights to the evolution of early-stage open source communities.
3. **Make community hubs first-class citizens in the data curation process to infer about informal engagement**. Both open source projects and UNICEF Venture Fund portfolio companies use a variety of tools to communicate, especially in view of COVID-19 and its seismic impact on how we work. Platforms like Discord, Telegram, Mattermost, Slack, Rocket.chat, Matrix, and others are focal points where projects collaborate, ask questions, and support others. Bringing this data stream into the mix offers deeper insights into how teams engage and build community around their work, and also guidance on when to push for contribution opportunities at the right time.

The satisfaction of these three options in their totality is not enough. To leverage the fullest impact, these metrics must tie into each other, and need to be connected back to a narrative. Why is this data being collected and what actions are influenced by the knowledge of this data? The data collection enables the evaluation of sustainability and understanding the birth, growth, and evolution of an open source technology product. Influenced actions can include moving more human resources (i.e. contractors or staff) to support a project, adopting a new open source best practice, and/or engaging new customers, talent, or other leads based on participation in the community.

Measuring collaboration platform activity is not black and white. Many new questions would likely come forward as part of measuring this activity. Yet this is the point—it lays the foundation for the next layer to the data collection, analysis, and reporting process around sustainability.

![A man is facing forward with his back to the camera. He wears a heavy coat and a construction hard hat. The background is blurred and unclear. In this way, we can think of labor investment from a human-centered approach first.](/blog/2021/12/jon-tyson-kR4K8nJ9JRc-unsplash.jpg "What is the impact of an investment on fair and equitable labor?  
_Photo by Jon Tyson (https://unsplash.com/@jontyson?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on Unsplash (https://unsplash.com/s/photos/worker?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)_.")

### [Labor Investment](https://chaoss.community/metric-labor-investment/)

> Question: What was the cost of an organization for its employees to create the counted contributions (e.g., commits, issues, and pull requests)?
> 
> [chaoss.community/metric-labor-investment/](https://chaoss.community/metric-labor-investment/)

This metric is perhaps the most ambitious of the group. How do you measure labor investment into an open source project? Or literally, the number of person-hours that go into software design, development, co-creation, and community management? It feels like a gargantuan effort, but there may be better ways to measure this in connection to other data the UNICEF Venture Fund is already connected about the businesses.

Measuring labor investment impacts two narratives: the rate of development on the open source work, and the impact of UNICEF investment into a company backing an open source work.

Firstly, understanding the rate of development on an open source work is easier to infer by understanding who is allocated on a project and how much of their time they dedicate to it. If a team of three contributors spares a few hours a week, it will mean something different compared to a team of five engineers spread across different disciplines working full-time. Mapping the labor investment for open source projects supported by UNICEF would enable better planning by understanding the typical labor investment in open source workplan tasks as piloted by other Venture Fund portfolio companies.

Secondly, this gives us a new way of talking about the impact of UNICEF Venture Fund investments as an investment not only in software products but also in labor. It gives us insight into the investment of labor in software engineering talent among portfolio companies. How does this measurement change over time of the investment? Do projects receive more or less investment of labor during the 12 month period we work with them? This could also be used as a proxy metric for the impact of our unique mentorship and coaching opportunities.

## What next?

Knowing is half the journey. Even if the knowledge is not yet firmly rooted. The analysis and introspection are from me as an individual working among the UNICEF Venture Fund and do not represent the views and beliefs of UNICEF or the UN in any capacity. My intent is that by sharing this analysis in the open, it allows for a space where conversation can spark where it could not before. It also invites others to share ideas, feedback, and constructive criticism of an emerging metrics strategy for investments made into the open source ecosystem.

Next, more layers can be added and internal and external validation can help to keep this moving forward. An implementation plan would be the next step to follow this post. The implementation plan considers the process of how start-up companies move through the Venture Fund from start to finish. Who interacts with the companies and when? At what point is a company ready to begin building in a new metric or count in their monthly metrics? Do they understand the implications and assessments of these metrics? At what points in the process is data already being collected? Could these new data requests be added to existing requests? And so on.

I hope to formalize some of this new reporting and metrics strategy in upcoming cohorts in 2022, as part of a renewed effort into communicating how our open source investments tie into sustainable impact towards the U.N. Sustainable Development Goals.

This post will serve as a milestone marker on the metrics strategy discussion in the coming one to two months. See you in 2022.

* * *

_Featured photo by [Edward Howell](https://unsplash.com/@edwardhowellphotography?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/sustainable?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText). Modified by Justin W. Flory. CC BY-SA 4.0_.
