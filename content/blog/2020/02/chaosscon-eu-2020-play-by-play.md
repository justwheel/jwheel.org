---
title: "CHAOSScon EU 2020: play by play"
date: 2020-02-25
categories: 
  - "foss"
  - "tech"
  - "travel"
tags: 
  - "2020-foss-conferences"
  - "2020s"
  - "chaosscon"
  - "conferences"
  - "culture"
  - "dei"
  - "ethics"
  - "europe"
  - "events"
  - "fedora-planet"
  - "fossmagic"
  - "github"
  - "librecorps"
  - "metrics"
  - "open-source"
  - "open-source-communities"
  - "rochester-institute-of-technology"
  - "travel"
images: ["/blog/2020/02/chaosscon-eu-2020.png"]
---

CHAOSScon EU 2020 took place on Friday, 31 January, 2020 in Brussels, Belgium (the day after [Sustain OSS 2020](/blog/2020/02/sustain-oss-2020-quick-rewind/)):

> Learn about open source project health metrics and tools used by open source projects, communities, and engineering teams to track and analyze their community work. This conference will provide a venue for discussing open source project health, CHAOSS updates, use cases, and hands-on workshops for developers, community managers, project managers, and anyone interested in measuring open source project health. We will also share insights from the CHAOSS working groups on Diversity and Inclusion, Evolution, Risk, Value, and Common Metrics.
> 
> [chaoss.community/chaosscon-2020-eu/](https://web.archive.org/web/20200219170041/https://chaoss.community/chaosscon-2020-eu/)

This is my second time attending CHAOSScon. I attended on behalf of [RIT LibreCorps](https://fossrit.github.io/librecorps/) to represent our engagement with the [UNICEF Office of Innovation](https://www.unicef.org/innovation/) and the [Innovation Fund](https://unicefinnovationfund.org/). For CHAOSScon EU 2020, I arrived hoping to learn more about effective metric collection strategies for open source communities and also get a deeper understanding of the technology behind [GrimoireLab](https://chaoss.github.io/grimoirelab/).

<!--more-->

## Sessions: Play-by-play

Event reports take many forms. My form is an expanded version of my session notes along with key takeaways. Said another way, my event report is biased towards what is interesting to me. You can also skim the headings to find what interests you.

Also, I live-tweeted several sessions of CHAOSScon EU 2020, so some sections include tweet excerpts with pictures.

### Ethics: What You Know & What You Don't Know

> Metrics give us a lot of insight into what's going on with our projects -- but only if we have enough context. The catch is that personal biases and pre-conceptions are extremely hard to filter for so no one person can see everything. Those gaps means that even the most well-meaning of us could end up doing more harm than good. In this talk, I'll share a few examples of the ways human brains make assumptions, some of our typical blind spots and how incomplete data can cause harm when deployed without any checks. For folks who collect, analyze and ultimately make mission critical decisions with metrics, the challenge is to constantly maintain a bit of healthy skepticism of what the numbers seem to be telling us.
> 
> [Deb Nicholson](https://chaoss.community/chaosscon-2020-eu/#user-content-deb-nicholson)

Deb's session was a great opener to a day focused on metrics and automated reporting. Her talk underscored unconscious bias and the ways poorly-designed metrics fail us. We should take an active approach to questioning our perspectives and take suggestions with grace.

During Q&A, my colleague [Mike](https://nolski.rocks/) asked for advice on pushing back on management when they ask for bad metrics. Deb suggested a clever strategy to respond in these situations:

1. Provide the metric asked for
2. Provide a metric that contradicts what was asked for
3. Provide the metric they should have asked for

### Heat, Light, and Love: Telling Twitter's Open Source Program Office's Story

> Making it simple to trust, ship, and grow open source at Twitter demanded visibility into contribution trends that were not readily available. Twitter's open source program office and the Augur project collaborated with CHAOSS using student interns from Google's Summer of Code, Twitter's intern program and the University of Missouri. First, this talk describes Twitter's engaging interface design and its fit to the needs of Open Source stakeholders within Twitter, but also outside the open source program office. Second, we describe how an open API and data collection tool, Augur, evolved in close collaboration with Twitter.
> 
> [Sean Goggins](https://chaoss.community/chaosscon-2020-eu/#user-content-sean-goggins) & [Remy DeCausemaker](https://chaoss.community/chaosscon-2020-eu/#user-content-remy-decausemaker)

This one inspired me. It represented a dream of mine for many open source communities. Sean and Remy presented on three years of building an [automated metrics visualization site](https://twitter.github.io/year-in-review) with [GrimoireLab](https://chaoss.github.io/grimoirelab/) and [Augur](https://github.com/chaoss/augur). The visualization was powerful to communicate the value of open source engagement, participation, and investment to internal and external stakeholders.

The work was based on a philosophy familiar to me from working with Remy years ago in the Fedora Project community:

![From CHAOSScon EU 2020: Twitter's open source philosophy: heat, light, and love](/blog/2020/02/Screenshot_2020-02-21-Twitter-Open-Source.png "Twitter's open source philosophy: heat, light, and love")

If we are speaking in metaphors, one way to extend Remy's "light" metaphor is tying in a theatrical concept: **stage lights and backstage lights**.

Stage lights are the metrics and insights to present out to the world. They are front and center! These insights validate your mission to an external audience.

Backstage lights are for an internal audience. These metrics and insights illuminate the inside of an organization and build understanding of who and what is there. These are useful to validate work and efforts to funders, or perhaps your CFO.

This talk served as inspiration for something I hope to explore later in 2020.

### Measuring Culture

> They say you can’t be certain of anything unless it can be measured – so what about culture? We know it exists and can be passed on to others, so there must be a way to measure it. Using Apache Kibble we attempt to look for cultural indicators at the Apache Software Foundation, set a cultural benchmark then match real Apache projects against it. In theory we would expect a perfect match but as the results show, culture isn’t that simple.
> 
> [Sharan Foga](https://chaoss.community/chaosscon-2020-eu/#user-content-sharan-foga)

{{< x user="jflory7" id="1223203171834744833" >}}

> Sharan introduced five factors to measure culture: **bus factor, contributor experience, contributor retention, sentiment analysis, and key phrase extraction**.

Sharan defined culture as what we believe _and_ what we do. So, she introduced five indicators for open source communities to measure culture. These came from learnings at the [Apache Software Foundation](https://apache.org/foundation/)'s [Kibble project](https://kibble.apache.org/):

- **Pony ("bus") factor**:
    - "Committership"
    - Authorship
    - Meta factor (# of organizations involved)
- **Contributor experience / contributor retention**:
    - People who (re)joined
    - People who quit (why?)
    - People retained
    - Active contributors
    - Cross the above over time (e.g. # of months/years involved)
- **Mood, or sentiment analysis**: Look for these moods…
    - Trust
    - Surprise
    - Neutrality
    - Sadness
    - Positivity
    - Anger
    - Negativity
    - Joy
    - Anticipation
    - Disgust
    - Fear
- **Key phrase analysis**: Understand community jargon (e.g. if "+1" is used to indicate agreement)

I had two key takeaways. First, **nothing matches completely**, so don't over-rely on one factor or metric. Second, **identify _your_ baseline indicators and iterate** on those. For the above indicators, maybe these are specific to Apache projects. Maybe they apply to your projects too… or maybe they don't!

### Meet Cauldron! Your SaaS Software Development Analytics solution

> Cauldron is a brand-new free **open source SaaS** able to analyze software development community and processes. It relies on [CHAOSS GrimoireLab](https://chaoss.github.io/grimoirelab) to collect and process data from different tools used in software development such as git, GitLab, GitHub and/or social platforms like Meetup, and [**Open Distro for ElasticSearch**](https://opendistro.github.io/for-elasticsearch/) to store and to display the project data. The talk shows how Cauldron can be easily put into action to analyze the software projects that matter to the attendees, and to get some CHAOSS metrics about them.
> 
> [Jose Manrique Lopez de la Fuente](https://chaoss.community/chaosscon-2020-eu/#user-content-jose-manrique-lopez-de-la-fuente)

{{< x user="jflory7" id="1223229295813976064" >}}

I had no written notes other than "wow!"

_Finally_, Bitergia built a hosted GrimoireLab service, called [**Cauldron**](https://cauldron.io/). Cauldron takes the pain out of hosting your own GrimoireLab infrastructure. It is in early alpha and does not support all the data sources available in GrimoireLab yet, but it is promising.

In the [FOSS@MAGIC community](https://fossrit.github.io/about/), we want GrimoireLab to understand our open source community at the [Rochester Institute of Technology](https://www.rit.edu/), home of the [first academic minor](https://www.rit.edu/study/free-and-open-source-software-and-free-culture-minor) in free/open source. But as I go deeper, I realize GrimoireLab is very complex. Since my contract with RIT ends in a month, I want to leave something sustainable for my successors. Cauldron seems like a valid option.

I have some homework to do!

### Language barriers for open source contributors

> While open source development is common across the world, projects from countries outside North America and Europe, such as China, have difficulties attracting international contributors. One major reason for this is language differences. The presentation provides an overview of the diversity of non-native English speakers in different open source ecosystems. Furthermore, we will provide results about whether or not those contributors face a language barrier when contributing to open source projects. The presentation concludes with a discussion on how we can create metrics to assess the spoken language diversity in open source communities and how to include those people in the community more easily.
> 
> [Isabella Vieira Ferreira](https://chaoss.community/chaosscon-2020-eu/#user-content-isabella-vieira-ferreira)

{{< x user="jflory7" id="1223236768222392320" >}}

{{< x user="jflory7" id="1223238519432384513" >}}

{{< x user="emmy_ft" id="1223240475395678208" >}}

Isabella's talk was insightful and challenged my unconscious bias. An interesting insight from two case studies was translators did not transition over time to software development contributions.

I believe a bias exists in open source projects with active localization communities. I have seen project leaders invest in localization efforts as one way to bring new people into a community. While it does bring new people in, there is a subtle implication that "bringing new people in" means bringing software contributions. That's not always the case. Instead, the value of translation work needs to be quantified beyond just software contributions.

This is especially true for supporting grassroots advocacy communities. Localization may not build your developer community, but it can support stronger local communities in regions where English is not the first language.

### Metrics are more than the sum of their parts

> We are in a state of Community building that maps success to metrics like lines of code and GitHub stars. I would like us to explore where these metrics fall short on capturing the most significant value of a community, and how we can use other metrics to show the much larger impact Community organizations like Developer Relations (DevRel) can have on a business. This improved process begins with mapping value to business need, pairing it with a community need, and back to the business opportunities. There will be practical advice on how to pitch and position Community, whether you’re a Community Manager, Developer Advocate, or other Developer Relations professional.
> 
> [Matt Broberg](https://chaoss.community/chaosscon-2020-eu/#user-content-matt-broberg)

{{< x user="jflory7" id="1223242916988096512" >}}

{{< x user="jflory7" id="1223243457533181953" >}}

Matt's CHAOSScon EU 2020 session pitched strategy on communicating the value of developer relations to our organizations. He covered a lot of material and left me many thoughts to reflect on. I look forward to seeing the video recording of this talk to reflect further on integrating his ideas into my day-to-day. The themes of Matt's talk struck a chord with me for challenging advocacy work ahead for me in 2020.

### Emerging Tech Open-Source Scoring System (ETOSS)

> This is a framework used by the UNICEF Innovation Fund, to evaluate and track the strategic position and growth potential of the early stage startups in its portfolio. The focus is on startups building open source frontier tech: Blockchain, Data Science, Artificial Intelligence and Extended Reality. It classifies the startups into four quadrants, based on two dimensions: the software developed (technology), and the financial sustainability of the project (business sustainability).
> 
> [Cecilia Chapiro](https://chaoss.community/chaosscon-2020-eu/#user-content-cecilia-chapiro) & [Justin Wheeler](https://chaoss.community/chaosscon-2020-eu/#user-content-justin-w-flory)

{{< x user="yoyehudi" id="1223246459602194433" >}}

{{< x user="yoyehudi" id="1223246907163758599" >}}

{{< x user="farbodsaraf" id="1223247589317009409" >}}

{{< x user="emmy_ft" id="1223249000058540032" >}}

Hey, it's me!

My colleague **[Cecilia Chapiro](https://twitter.com/ceciliachapiro)** proposed a session for CHAOSScon EU 2020 on how the [UNICEF Innovation Fund](https://unicefinnovationfund.org/) evaluates the health and success of funded open source projects. However, due to travel complications, she was unable to attend. I presented her slides and work on her behalf at CHAOSScon EU 2020.

Many people were excited, if not also surprised, to hear that UNICEF funds humanitarian open source. In Cecilia's evaluation framework, there are two key areas: **business sustainability indicators** and **technology indicators**. There were good questions about how UNICEF measures on business sustainability. I hope to further explore GrimoireLab/Cauldron to better automate how we measure sustainability with industry-standard tools from the open source ecosystem.

I also gave a shout-out to [RIT LibreCorps](https://fossrit.github.io/librecorps/) and the [resources we maintain](https://opensource.com/article/19/12/humanitarian-startups-open-source) to help UNICEF and the Innovation Fund cohorts build and support sustainable open source projects.

{{< youtube t2Lyv6G_fvU >}}

### Open and Reproducible Research with Community-driven Research Software Metrics

> What do artificial neural networks, images of the black hole, and SETI@home all have in common? They all trace their roots to research software. In this session, we hope to explore metrics and best practices for evaluating open research software. Research software engineers are evaluated largely based on the numbers of publications and citations. However, metrics based on the number of publications encourage re-creating ‘new’ things or re-implementations instead of reuse, and there are huge variations in existing practices to cite software, meaning software isn't always cited or citations aren’t always captured. Better metrics that reflect the health of research software is crucial to avoid gamification, incentivizing research software engineers to follow best software development practices by recognizing and rewarding their effort appropriately, and ultimately advancing open science and improving the reproducibility of research.
> 
> [Yo Yehudi](https://chaoss.community/chaosscon-2020-eu/#user-content-yo-yehudi)

{{< x user="jflory7" id="1223266016186322944" >}}

Yo teamed up with [Emmy Tsang](https://twitter.com/emmy_ft) and [Mateusz Kuzak](https://twitter.com/matkuzak) to deliver this session. I appreciated the audience participation in the second half, which was a creative idea for a session later in the day. It helped revive the conference energy!

Yo and the team captured [excellent notes from their time across Brussels](https://discourse.sustainoss.org/t/blog-post-that-mentions-sustain-summit-academic-session/286), so look there for a deeper dive if this is interesting to you.

### Diversity & Inclusion Badging Program

> Within IT, open source software exhibits some of the worst D&I. The open source survey run by GitHub states that only 3% of contributors to open source software are female (GitHub, 2017). While open source has made strides in some aspects of D&I, such as event inclusivity (Irwin, 2017) and community engagement to support organizational diversity (Alexander, 2019), work remains. The proposed is aimed at contributing to this positive growth through the development of a D&I badging system. In open source, badges are available for community leaders to publicly display, providing a way for projects to signal their attention to such things as community health and software security. We can draw from this badging work to improve D&I in open source. In this talk, I will discuss complexities associated with D&I metrics and propose a D&I badging system that provides open source communities the ability to make diversity and inclusion within open source projects more transparent.
> 
> [Matt Germonprez](https://chaoss.community/chaosscon-2020-eu/#user-content-matt-germonprez)

{{< x user="jflory7" id="1223280367039324161" >}}

First, I must pay my full respect and gratitude to Matt for digging into this topic. It is hard. It is tricky. Nobody I know of is working on this. So, my feedback comes from a place of love because this is an important topic to me too, and I appreciate Matt's work! **Thank you Matt and the [CHAOSS D&I Working Group](https://chaoss.community/diversity-and-inclusion/)**.

#### _Critique_: Is a badging system how to do this?

Matt presented a strategy to incentivize organizations and projects to follow best practices for diversity and inclusion (D&I) through a badging system. Organizations embed a badge on their project website or README when following best practices. This provides an easy way for new contributors to understand if a project community is inclusive and values equality before contributing. Since best practices are defined not by a single organization, there is a way to measure if an organization is living up to their commitment to D&I.

However, a badging system seems like a difficult way to practically measure an organization's commitment to D&I. There is a risk for **manipulating trust of the system** at the expense of open source novices. Novices have the least context and direct experience to see through an unauthentic commitment. Also, **ongoing compliance seems difficult to enforce over time** with a badging system. Maybe initially an organization or project is "checked off" for D&I best practices. But if project leadership or management changes, community culture can also shift. How do you account for change?

Instead of badges, perhaps a **central, inter-organizational certification body** makes more sense to achieve this goal. A certification body acts as a central authority for validating accountability. They also have an authority to assign (or revoke) public recognition of organizations and projects with authentic, ongoing commitments to diversity and inclusion.

There is potential here, but I don't think gamifying D&I best practices with a badging system is the way. We need a long-term, _**human**_\-centered process in evaluating D&I. We need to build in human-centered evaluation as a "feature" to truly hold projects accountable to their commitments.

#### _Addendum_: Events and inclusivity

There are a few things I'm genuinely proud to have contributed to open source. Most of them aren't code. **International candy swaps** at conferences are one of those things.

{{< x user="mary_grace" id="1221075300584448000" >}}

> DevConf CZ 2020 candy swap, mentioned in a [previous blog post](/blog/2020/02/devconf-cz-2020-play-by-play/)

Candy swaps are fun, informal events hosted during a conference. Attendees bring local candies, sweets, or snacks from their hometowns to the conference. For an hour or so, folks gather together to swap candies. Before sampling the sweets, everyone introduces themselves, where they are from, and anything special about what they brought with them. When everyone introduces themselves and their candies, the floor is open to sample from the collected assortment.

This is a fun and engaging way to get to know other attendees beyond the conference's context. Conferences collect people around a specific context: be it technology, metrics, design, engineering, or something else. But beyond that specific context, we are also people! We have families, we have friends, and we eat food. We have things we miss about home when we travel hundreds or even thousands of miles from home. Events like candy swaps help us connect to other people not just as conference attendees, but as people. You learn something new about each other, and if you're bold, you try something new too.

While it is not a metric in itself, it would be cool to see things like this included as practical examples of how to evaluate "family friendliness" or inclusivity at events.

### True Confessions: The Seven Deadly Sins of Open Source Communities

> This talk would take a humorous approach to explaining what really no one should do when managing and measuring open source community best practices, with the primary goal of instilling positive open source development practices to the audience. Such ""don'ts"" include not documenting anything, establishing no clear paths to success, and not bothering to communicate.
> 
> [Brian Proffitt](https://chaoss.community/chaosscon-2020-eu/#user-content-brian-proffitt)

{{< x user="jflory7" id="1223299402229583872" >}}

Brian explained what to avoid in building healthy open source communities. While I was already familiar with most of them, the most interesting "sin" for me was the last one: "_**not seeing ourselves in others**_."

Brian offered mitigation strategies and metrics for the first six sins, but he acknowledged "not seeing yourself in others" is hard to mitigate and measure. However, I think things like candy swaps (explained above) are one possible way to do this. They connect us to others in an authentically human way, beyond the specific context of a conference we traveled for.

This is more challenging when interaction is virtual. Virtual systems often take away communication cues that make us human! I'm still thinking on how to mitigate "not seeing ourselves in others" if interaction is mostly virtual. (For what it is worth, I don't think running open source project meetings in V.R. is the answer either.)

## Beyond CHAOSScon EU 2020

An event report wouldn't be complete without mentioning the hallway track. It was great to see familiar faces and also meet new folks at CHAOSScon EU 2020.

I had a great lunch conversation with [Erik Albers](https://fsfe.org/about/albers/albers) from Free Software Foundation Europe. It was cool to meet a facilitator of the _[Public Money? Public Code!](https://publiccode.eu/)_ campaign. Hopefully there are future opportunities to collaborate with [RIT LibreCorps](https://fossrit.github.io/librecorps/) and [AI freedoms](https://fosdem.org/2020/schedule/event/ethical_ai/).

As always, face time with [Mike Nolan](https://nolski.rocks/) and an OG mentor of mine, [Remy DeCausemaker](https://twitter.com/Remy_D), is appreciated and fulfilling. I wish I could get more of it around the year.

## Thanks folx!

To wrap up this CHAOSScon EU 2020 report, a few thank-yous are in order:

- **[Cecilia Chapiro](https://twitter.com/ceciliachapiro)**: Thanks for putting your work forward to the wider open source community!
- **[Stephen Jacobs](https://www.rit.edu/computing/directory/sxjics-stephen-jacobs)**: For always being supportive for yet another trip abroad and helping me push my career forward in a number of ways (and footing the bill!)
- **[Mike Nolan](https://nolski.rocks/)**: My co-conspirator, partner in FOSS, and comrade in arms

I hope to continue conversations started here later into 2020 and keep talking with folks doing great things for the ecosystem. Until next time!
