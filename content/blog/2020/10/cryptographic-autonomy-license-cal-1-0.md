---
title: "Cryptographic Autonomy License (CAL-1.0): My first license review"
date: 2020-10-28
categories: 
  - "foss"
tags: 
  - "2010s"
  - "copyright"
  - "data"
  - "fedora-planet"
  - "open-source"
  - "open-source-licenses"
  - "opinion"
  - "teaching-open-source"
coverImage: "cryptographic-autonomy-license.jpg"
---

The bookmark was creeping on my browser's toolbar for months. "Cryptographic Autonomy License" CAL-1.0 on the [Open Source Initiative webpage](https://opensource.org/licenses/CAL-1.0). But today, I decided it was time to do my first amateur license review. This is a fun exercise (for me). Remember, **I am not a lawyer and this does not constitute legal advice**!

The **Cryptographic Autonomy License** is one of newest Open Source licenses on the block. The Open Source Initiative [approved](https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2020-February/004693.html) it in February 2020. This license also made ripples when it came through. But the question I had, and [could not find a clear answer to](https://jwfblog.wpenginepowered.com/2020/04/copyleftconf-2020-quick-rewind/), was _why is it so interesting_?

This blog post is my attempt to do a casual coffee-table review of the license. If you agree or disagree, I encourage you to leave a comment and share your opinion and **why**!

<!--more-->

This short article covers three sections:

1. **CAL-1.0 provisions**: What basic Free Software assumptions are present in the license, much like other copyleft licenses.
2. **What's fresh!!**: What is the hype? Ready for the key information? It is covered here.
3. **Personal takeaways**: My personal thoughts on this license and where it might be applicable.

## CAL-1.0 provisions

I learned there are basic assumptions and expectations that are true for all Open Source licenses, per the [Open Source Definition](https://opensource.org/osd-annotated). Copyleft licenses also have different degrees of rigidity depending on context and use. So, what basic ingredients of a Free Software license are present in the Cryptographic Autonomy License?

_Note_: The number in parentheses before each line is the corresponding section number in the license text.

### Basic legal provisions

- (_6.0_) **Disclaimer of warranty, limit on liability**: If someone uses the software and it causes unexpected disastrous side effects, the Licensor cannot be held responsible.
- (_2.0_) **Receiving a license**: Anyone can receive a CAL-1.0 license. To receive it, you just have to agree to its rules.
- (_7.4_) **Attorney fees**: If a case involving noncompliance with the CAL-1.0 is brought to court, loser pays legal fees for prosecution and defense.
- (_7.3_) **No sub-licensing**: You cannot add another license "on top" of the CAL-1.0.
- (_3.0_) **Patent clause**: Got patents? This license is equipped to interface with external patent licenses.

### Permissive provisions

- (_4.1_) **Access**: Source code must be made available over a network with this license.
- (_4.3_) **Attribution**: Cite your sources. Retain all licensing, authorship, and/or attribution notices.

### Copyleft provisions

- (_4.1_) **Modified Work**: Changes to the original Work make it a Modified Work. Same license rules apply to a Modified Work.
- (_5.2_) **Reinstatement**: A la GPLv3, for non-compliant derivative works, there is a 60 day grace period to come into compliance before your license is terminated.
- (_4.5_) **Combined Work Exception**: Software in the Larger Work as well as the Larger Work as a whole may be licensed under the terms of your choice.
- **Network use**: A la AGPL, it also includes a trigger for network use.

## What's fresh!!

The fresh take on this license from other licenses is all in **4.2. Maintain User Autonomy**:

> In addition to providing each Recipient the opportunity to have Access to the Source Code, You cannot use the permissions given under this License to interfere with a Recipient’s ability to fully use an independent copy of the Work generated from the Source Code You provide with the Recipient’s own User Data.
> 
> Section 4.2 Maintain User Autonomy: intro text

My non-lawyer take on this is that user data plays a much more prominent role in the terms of this license than other copyleft licenses. Just like the AGPL was a response to the changing world of network services and cloud computing, the CAL-1.0 is a response to the changing world of machine learning and data science.

The CAL-1.0 seems to define "user autonomy" in the context of actually _using_ the software, versus something more holistic like [Digital Autonomy](https://techautonomy.org/). In other words, if you are running CAL-1.0 software, you cannot interfere with requests for personal user data from your users.

This might not sound so radical, but it really is. It is a radical way to assert users' ownership of their data. If you are the end user of a distributed or cloud-based app licensed under CAL-1.0, **you are enabled (to some degree) to request copies of personal user data without interference or obfuscation.**

### CAL-1.0 and Hatbrim Technologies

To better explain this, consider this made-up example.

I am a product manager at Hatbrim Technologies. Hatbrim develops an integrated calendar application, **Holocal**, to store events, meetings, and reminders. Holocal is an integrated application that includes a front-end component, back-end component, and a machine learning algorithm. The algorithm offers tailored suggestions to reduce my meeting load based on my common meeting patterns with other events or activities I have planned.

Oraculous, a competing company to Hatbrim Technologies, creates a fork of Holocal called **OraCal**. It is almost functionally identical to Holocal except it also adds an integration to other services from Oraculous. However, OraCal also modifies the calendar optimization algorithm. It adds a periodic random event suggestion based on events and activities in your calendar.

### Meanwhile at Hatbrim…

Since I am a product manager at Hatbrim, I turn to my trusty team of developers and ask them to explore the OraCal fork of Holocal. I am curious to know how their calendar optimization method works, since Oraculous must also release OraCal under the Cryptographic Autonomy License (CAL-1.0). My team of developers review the OraCal code, try making changes to Holocal, but we are unable to replicate this feature of OraCal in our environment.

Eventually, one developer runs OraCal internally, but optimized for our data. Still no luck to reproduce the nifty calendar event suggestion feature! Fortunately, the CAL-1.0 offers a protection here. So, the developer sends an email to Oraculous to request her personal user data from OraCal provided to her. Because the CAL-1.0 has provisions to prevent foul play or modifying the data, the developer receives a copy of her data and realizes another Oraculous tool was scrubbing and appending data for calendar predictions before it returned to OraCal.

In this hypothetical scenario, our developer is ultimately able to understand how the Modified Work is changed and how Oraculous adapted the original Work. Under another copyleft license like any GPL variant or the Mozilla Public License, a licensee has no obligation to share any user data with an end user. For any reason. Unless they happen to be nice or because another legal authority or body holds them accountable to share user data.

## CAL-1.0 personal takeaways

Did I mention I am not a lawyer and this does not constitute legal or financial advice? In case I did not, **I am not a lawyer and this does not constitute legal or financial advice**.

This advice and interpretation of the license is raw and unfiltered. But you only read something for the first time but once. So, with all other contemporary issues in the Free Software world going on, I thought it would be a fun exercise to draft this blog post as I read through the Cryptographic Autonomy License for the first time.

Ultimately, my takeaways after reading and reflecting on the license a few times is this:

1. **Lack of transparency in motivation**: [Holo](https://holo.host/), the company behind the license, emphasizes all the good qualities of this license while sneakily dodging the fact that it is a mildly anti-competitive license for their business case.
2. **Precedent-setting**: This is the first approved Open Source license that [explicitly does anything significant about data](https://medium.com/holochain/why-cal-is-important-to-the-end-user-aec58b2ff730). It will be interesting to see if this inspires other licenses that make definitions on data.
3. **Potentially powerful if picked up**: If used more widely or in more popular projects, it has potential to disrupt the status quo of how Open Source thinks about user data and the autonomy of the end user.
4. **No defining moment**: To my knowledge, CAL-1.0 lacks a significant defining moment since its approval. It is unclear what real-world noncompliance litigation looks like. It lacks the battle-testing of other copyleft licenses.

I imagine I am not the only one who feels mutually excited and hesitant about the Cryptographic Autonomy License. I am not sure if it makes sense to apply to any of my work or to recommend as a default license to others yet. And licensing is only but one of many pathways in the Free Software legal and policy world. But nonetheless, it is an interesting Free Software development that is still maturing since February 2020.

* * *

_Photo by [Markus Spiske](https://unsplash.com/@markusspiske?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/access?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText). Modified by Justin W. Flory._
