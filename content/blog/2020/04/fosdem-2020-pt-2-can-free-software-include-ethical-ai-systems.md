---
title: "FOSDEM 2020, pt. 2: Can Free Software include ethical AI systems?"
date: 2020-04-21
categories: 
  - "foss"
  - "tech"
  - "travel"
tags: 
  - "2020-foss-conferences"
  - "2020s"
  - "artificial-intelligence"
  - "conferences"
  - "ethics"
  - "europe"
  - "events"
  - "fosdem"
  - "librecorps"
  - "open-source"
  - "travel"
coverImage: "fosdem-2020.png"
---

_This post is a follow-up to [FOSDEM 2020, pt. 1: Play by play](https://blog.justinwflory.com/2020/03/fosdem-2020-pt-1-play-by-play/). This post summarizes the talk given by me and my colleague, [Mike Nolan](https://nolski.rocks/), at FOSDEM 2020._

* * *

FOSDEM 2020 took place from Saturday, 1 February, 2020 to Sunday, 2 February, 2020 in Brussels, Belgium (shortly after [Sustain OSS 2020](https://blog.justinwflory.com/2020/02/sustain-oss-2020-quick-rewind/) and [CHAOSScon EU 2020](https://blog.justinwflory.com/2020/02/chaosscon-eu-2020-play-by-play/)). On Saturday, together with my colleague and friend Mike Nolan, we presented on a topic he and I have co-conspired on for the last six months. What are the intersections of Free Software and artificial intelligence (AI)?

> What is a rights-based approach for designing minimally safe and transparent guidelines for AI systems? In this talk, we explore what a Free AI system might look like. Then, taking research and guidelines from organizations such as Google and the UN Office for the Coordination of Humanitarian Affairs, we propose practical policies and tools to ensure those building an AI system respect user freedom. Lastly, we propose the outlines of a new kind of framework where all derivative works also respect those freedoms.
> 
> [Freedom and AI: Can Free Software include ethical AI systems? Exploring the intersection of Free software and AI](https://fosdem.org/2020/schedule/event/ethical_ai/)

*Video recording from FOSDEM 2020*

This post is an abridged summary of the key ideas and thoughts Mike and I presented at our FOSDEM 2020 session.

<!--more-->

## Let's frame this first.

The idea behind this talk was a seed planted at MozFest 2018. I remember sitting with Mike in a hotel lobby while he was clocking some remote hours for work. We had some honest conversation about the experiences we've had across the public, private, and humanitarian aid sectors. At the time, Mike worked at the International Rescue Committee, and I had just finished a six-month internship with the UNICEF Office of Innovation working on open source community management.

The best way I can think of to describe humanitarian work is that it comes with the highest of highs and lowest of lows. Finding success usually means either a direct or indirect impact on some of the most vulnerable populations on our planet. Making mistakes or seeing planned efforts spin out in the wrong direction mean the resources your organization do not have the full impact they could, or sometimes worse, they fix one problem and create another.

At MozFest 2018, the seeds of thought for the intersections of Free Software as it relates to humanitarian aid and artificial intelligence were planted. Fast-forward a year to October 2019. Mike and I caught up after a while and after we had both had new experiences out in the industry. We began tending to the seed planted the year before. Our venting sessions and simultaneous cheers turned from our video chats back to the wider Free Software ecosystem.

The FOSDEM 2020 call for papers would open in a few more weeks from when we first began talking about these ideas in 2019. FOSDEM 2020 is a great collection of many different minds and people in the Free Software world, so it felt like the perfect audience for us to deliver our thoughts to an audience for the first time.

We applied, and later found out our application to the main track was accepted, landing us in the Community and Ethics track on Saturday.

This blog post is a partial recap of what we covered in that FOSDEM 2020 session linked above. The FOSDEM 2020 talk covered three main ideas. This blog post summarizes only the definitions of our AI Freedoms.

## Looking to yesterday for today

Before we define AI freedoms, we need to define the origin of Free Software. While the precise origin is debatable, Mike and I posit that the [Free Software movement began with a definition of rights](https://blog.justinwflory.com/2020/04/how-did-free-software-build-a-social-movement/). These freedoms were first established by the GNU Project on 27 Sept. 1983.

So, in the spirit of the movement that precedes us today, Mike and I started asking questions. As we go into a new decade, what would Freedoms of AI look like? We know we aren't presenting _The Truth_ or _The Answer_. But we are presenting our experiences and reflections.

## What freedoms do we want to protect?

So, Free Software has the Four Freedoms. Combining our shared history in the Free Software movement with our personal experiences working in both commercial and humanitarian contexts, this is our vision of Three possible Freedoms of AI:

### 1\. Audit automated decision-making systems

We are entitled to know and understand how decisions that affect us are made. So, you should have to freedom to audit, or understand, how those automated decisions are made.

For a moment, picture yourself in a classroom. Your teacher gives you a bad grade on an essay. You are probably curious to know why you received the grade that you did, especially if it was something important to you. You would likely go to the teacher and ask for help understanding why you received the grade you did, if there were no comments or notes.

So, why wouldn't you want to understand how a decision is made that affects you?

This does tie closely to one of the Four Freedoms of Software: the freedom to "study the source". This AI freedom restates that Software freedom as, "the freedom to understand how a system that is impacting you works". But this does go beyond the Software freedom to study the source because it is more than just source code.

### 2\. Deliver accountability and responsibility

We already know AI systems are capable of harm. We deserve the guarantee of liability when these systems do create harm. Not if, when. So, you should also have the freedom to deliver and expect accountability and responsibility from the designers of automated decision-making systems that impact you.

Think about it for a minute. When machines make decisions for us, who is accountable for those decisions? Is it the machines? Is it the creators who programmed them? Or is it the end-user?

It should be the creators and organizations that create these systems, as they directly profit from their output. Those who create these systems typically do so to profit themselves.

**But we as those affected deserve to be put over their profit.**

#### Myanmar and Facebook

What would a real world example of this look like? Have you ever thought about how social media could be connected to genocidal campaigns? This is what the United Nations is [asking of Facebook](https://www.reuters.com/article/us-myanmar-rohingya-un/myanmar-generals-had-genocidal-intent-against-rohingya-must-face-justice-u-n-idUSKCN1LC0KN) in the role of the news feed in inciting genocide. But why would the U.N. ask these questions of Facebook?

The problem identified with Facebook is the news feed. The news feed optimizes for "engaging content". To understand this, we have to define what "engaging content" means. Studies have shown that optimizing for "engagement" increases recommendations for extremist and alarmist content. Researchers knew the potential of "engaging content" to be misused, years before the Rohingya genocide began in Myanmar.

Then, the warnings in research became real. Religious and military leaders created "fake news" to divide the citizens of Myanmar. This "fake news" campaign is suspected to be a major contributing factor of the ethnic cleaning of the Rohingya people in Myanmar.

Obviously Facebook didn't take genocide into account in their feature planning when building the news feed. Yet it was still a contributing factor. And because of the research and warnings delivered to Facebook before the genocide, they did know about the potential for misuse.

So, who is responsible? Facebook? Myanmar religious and military leaders? Nobody? Even today, nobody will take responsibility. But what we do know is that profit was placed over people.

Thus, we must demand for a freedom that delivers accountability and responsibility in a world increasingly defined and shaped by automated decision-making. We are already in a "catch-up" mode to the changing world in this regard.

### 3\. Appeal a decision

No decision-making system is ever perfect. We are _always_ missing some data. So, lastly, you should also have the freedom to appeal a decision that impacts you.

In your life, have you ever told a story to help someone empathize with your situation? Have you ever had to explain a misconstrued fact about your background or history? You are probably familiar with the phrase, "walk in someone else's shoes". Our ability to empathize and understand is what connects us as humans. It helps avert disaster more often than you think.

There are always hidden stories not captured by a set of data points. Thus, we should also have the opportunity to break through automated systems that influence an organization. We deserve the opportunity to appeal to the people behind the systems in order to use our humanity.

#### Resume/CV filtering

If you have ever applied for a job, you might be familiar with the importance of keywords and certain requirements on your resume or C.V. Automated tools already exist to review these documents and filter out candidates.

But what is the point of interviews? Where you talk with a real person? Interviews are a chance to tell our own hidden stories and explain the gap between what is on our CV and what is not. It gives us a chance to build empathy between us and who we want to be our employer.

#### Practical examples

It is not hard to look for examples of appealing systems in our society. Two examples are appellate courts and credit denials in the U.S.

Appellate courts are legal systems where we appeal decisions we think were unfair or incorrect. Sometimes this is because of an unfair trial. It could also be because of a biased judge. Either way, a system is in place to appeal a legal decision.

A similar system exists in the U.S. if you are denied a credit offer or loan. You can appeal to an impartial third-party if you believe a credit offer or loan was denied to you on unfair criteria. again, there is a system in place to appeal a decision that could have significant personal impact to you.

How else could we describe the freedom to appeal? We must not erase the opportunity for human connection and empathy when these decisions are made. Even by automated systems. To do so is to deny our humanity.

## Where do we go from here?

The stakes have never been higher. These systems are being built not next year, not next month, not tomorrow, but **now**. These problems are not going to go away. They are only going to continue and grow. But we know we can imagine and have a better world, because we have to. The alternative is simply unacceptable.

The history of the Free Software movement [left us clues](https://blog.justinwflory.com/2020/04/how-did-free-software-build-a-social-movement/) about how to build a social movement to address problematic patterns in our digital society. So, let's take the cues and demand for our Freedoms to be respected, just like those who came before us nearly 40 years ago.

If there is anything to take away from this post, or the original talk, it is this: me, you, and everyone has some power to make change. So, let's build a future that we own, together, for everyone.

* * *

_For more details and ideas on how we as individuals can protect these Freedoms and how to get others to respect these Freedoms, [watch the full talk](https://fosdem.org/2020/schedule/event/ethical_ai/)!_
