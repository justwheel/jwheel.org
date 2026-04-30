---
title: "GSoC 2016: That's a wrap!"
date: 2016-08-21
categories: 
  - "fedora"
tags: 
  - "ansible"
  - "devops"
  - "documentation"
  - "fedora-infrastructure"
  - "fedora"
  - "fedora-magazine"
  - "fedora-planet"
  - "gsoc"
  - "open-source"
  - "summer-activities"
images: ["/img/Google-Summer-of-Code-announcement.png"]
---

Tomorrow, August 22, 2016, marks the end of the [Google Summer of Code](https://summerofcode.withgoogle.com/) 2016 program. This year, I participated as a student for the Fedora Project working on my proposal, "[_Ansible and the Community (or automation improving innovation)_](https://summerofcode.withgoogle.com/archive/2016/projects/4844704050970624/)". You can read my [original project proposal](https://fedoraproject.org/wiki/GSOC_2016/Student_Application_jflory7) on the Fedora wiki. Over the summer, I spent time learning more about [Ansible](https://www.ansible.com/), applying the knowledge to real-world applications, and then taking that experience and writing my final deliverable. The last deliverable items, closing plans, and thoughts on the journey are detailed as follows.

<!--more-->

## Deliverable items

The last deliverable items from my project are two (2) git patches, one (1) git repository, and seven (7) blog posts (including this one).

- Git patches ([ansible.git](https://jflory7.fedorapeople.org/pub/gsoc/2016/patches/0001-Add-role-and-playbooks-for-installing-and-upgrading-.patch) and [infra-docs.git](https://jflory7.fedorapeople.org/pub/gsoc/2016/patches/0001-Add-WordPress-SOP-based-on-corresponding-additions-t.patch))
- [Git repository](https://pagure.io/jflory7-ansible)
- [Blog posts](/tags/gsoc/)

## Closing plans

At the end of the summer, I was using a private cloud instance in Fedora's infrastructure for testing my playbooks and other resources. One of the challenges towards the end of my project was moving my changes from my local development instance into a more permanent part of Fedora's infrastructure. For these reasons, I had some issues with running them in a context and workflow specific to Fedora's infrastructure and set-up (since I am not a sponsored member of the Fedora system administration group).

My current two patches were submitted to my mentor, Patrick. Together, we worked through some small problems with running my playbook in the [context of Fedora's infrastructure](https://infrastructure.fedoraproject.org/cgit/ansible.git/). There may still be some small remaining hoops to jump through for running it in production, but any remaining changes to be made should be minor. The majority of the work and preparation for moving to production is complete. This is also something I plan to follow up on past the end of the GSoC 2016 program as a member of the Fedora [Infrastructure Apprentice](https://fedoraproject.org/wiki/Infrastructure_Apprentice) program.

My patches should be merged into the [ansible.git](https://infrastructure.fedoraproject.org/cgit/ansible.git/) and [infra-docs.git](https://infrastructure.fedoraproject.org/cgit/infra-docs.git/) repositories soon.

## Reflection on GSoC 2016

As the program comes to a close, there's a lot of valuable lessons I've learned and opportunities I'm thankful to have received. I want to share some of my own personal observations and thoughts in the hopes that future students or mentors might find it useful for later years.

#### Planning your timeline

In my case, I spent a large amount of time [planning my timeline](https://fedoraproject.org/wiki/GSOC_2016/Student_Application_jflory7) for the project before the summer. Once the summer began, my original timeline was too broad for having smaller milestones to work towards. My timeline on the student application was more broad and general, and while it covered the big points, it was difficult to work towards those at first. Creating smaller milestones and goals for the bigger tasks makes them easier to work through on a day-by-day basis and helps add a sense of accomplishment to the work you are doing. It also helps shape direction for your work in the short-term and not just the long-term.

For an incoming Google Summer of Code student for Fedora (or any project), I would recommend creating the general, "big picture" timeline for your project before the summer. Then, if you are accepted and beginning your proposal, spend a full day creating small milestones for the bigger items. Try to map out accomplishments every week and break down how you want to reach those milestones throughout the week. I started using [TaskWarrior](https://taskwarrior.org/) with an [Inthe.AM Taskserver](https://inthe.am/about) to help me manage weekly tasks going into my project. But it's important to find a tool that works for you. You should reach out to your mentor about ideas for tools. If possible, your mentor should also have a way to view your agenda and weekly tasks. This will help make sure your goals are aligned to the right kind of work you are doing for an on-time completion.

I think this kind of short-term planning or task management is essential for hitting the big milestones and being timely with your progress.

#### Regular communication

Consistent and frequent communication is also essential for your success in Google Summer of Code. This can be different depending on the context of how you are contributing to the project. For a normal student, this might just be communicating about your proposal with your mentor regularly. If you're already an active contributor and working in other areas of the project, this might be spending extra time on communicating your progress on the GSoC project (but more on that specifically in the next section).

Regardless of the type of contributor you are, one thing is common and universal – **be noisy**! Ultimately, project mentors and GSoC program administrators want to be sure that you are spending the time on your project and making progress towards accomplishing your goals. If you are not communicating, you will run the highest risk of failing. How to communicate can vary from project to project, but for Fedora, here's my personal recommendations.

###### Blog posts

Even for someone like me who spends a lot of time writing already, this can be a difficult thing to do. But no matter how hard it is to do it, this is the cornerstone for communicating your progress and leaving a trail for future students to learn from you as well. Even if you've had a difficult week or haven't had much progress, take the time to sit down and write a post. If you're stuck, share your challenges and share what you're stuck on. Focus on any success or breakthroughs you've made, but also reflect on issues or frustrations you have had.

Taking the time to reflect on triumphs and failures is important not only for Google Summer of Code, but even looking past that into the real world. Not everything will go your way and there will be times where you will be face challenges that you don't know how to resolve. Don't burn yourself out trying to solve those kinds of problems alone! Communicate about them, ask for help from your mentors and peers, and make it an open process.

###### IRC check-ins

Whether in a public channel, a meeting, or a private one-on-one chat with your mentor, make sure you are both active and present in IRC. Make sure you are talking and communicating with your mentor on a regular basis (at a _minimum_, weekly). Taking the time to talk with your mentor about your challenges or progress is helpful for them so they know what you're up to or where you are in the project. It also provides a chance for them to offer advice and oversight into your direction and potentially steer you away from making a mistake or going into the wrong direction. It is demotivating when you've spent a lot of time on something and then later discovered it either wasn't necessary or had a simpler solution than you realized.

Make sure you are communicating often with your mentor over IRC to make your progress transparent and to also offer the chance for you to avoid any pitfalls or traps that can be avoided.

###### Hang out in the development channels

As a Fedora Google Summer of Code student, there are a few channels that you should be present in on a regular basis (a daily presence is best).

- `#fedora-admin`
- `#fedora-apps`
- `#fedora-summer-coding`
- Any specific channel for your project, e.g. `#fedora-hubs`

A lot of development action happens in this channels, or people who can help you with problems are available here. This also provides you the opportunity to gain insight into what the communication in an active open source project looks like. You should at least be present and reading the activity in these channels during the summer. Participation is definitely encouraged as well.

#### Balancing project with open source contributions

I think my single, most difficult challenge with Google Summer of Code was balancing my proposal-specific contributions with the rest of contributions and work in the Fedora Project. I believe I was a minority of Google Summer of Code students who applied for the program as an active member of the project [almost a full year](/blog/2015/10/my-journey-into-fedora/) before the program began. Additionally, my areas of contribution in Fedora before GSoC were mostly unrelated to my project proposal. My project proposal mostly aligned with my [intended degree](http://nsa.rit.edu/) and education I am pursuing. A lot of the technology I would be working with was new to me and I had minimal knowledge about it before beginning the summer. As a result, this presented a unique set of challenges and problems I would face throughout my project.

The consequences of this were that I had to spend a lot more time researching and becoming familiar with the technology before advancing with creating the deliverable items. A great resource for me to learn about Ansible was [_Ansible for DevOps_ by Jeff Geerling](https://www.ansiblefordevops.com/). But I spent more time on learning and "trying out the tech" than I had anticipated.

This extra time spent on research and experimentation were in tandem to my ongoing contributions in other areas of the project like [Community Operations](https://fedoraproject.org/wiki/CommOps), [Marketing](https://fedoraproject.org/wiki/Marketing), [Ambassadors](https://fedoraproject.org/wiki/Ambassadors), the [Diversity Team](https://fedoraproject.org/wiki/Diversity), and as of recently, the [Games SIG](https://fedoraproject.org/wiki/SIGs/Games). Balancing my time between these different areas, including GSoC, was the biggest challenge to me over the summer (along with a separate, part-time job on weekends). A separation of time to different areas of Fedora became essential for making progress on my project. What worked well for me was setting short-term goals (by the hour or day) that I wanted to hit and carry out. Until those goals were reached, I wouldn't focus on anything other than those tasks.

## Special thanks

I'm both thankful and grateful to those who have offered their mentorship, time, and guidance for me to be a member of the GSoC Class of 2016. Special thanks go to [Patrick Uiterwijk](https://fedoraproject.org/wiki/User:Puiterwijk), my mentor for the program. I've learned a lot from Patrick through these past few months and enjoyed our conversations. Even though we were both running around the entire week, I'm glad I had the chance to meet him at [Flock 2016](/blog/2016/08/fedora-flock-2016/) (and hope to see him soon at [FOSDEM](https://fosdem.org/2017/) or [DevConf](http://devconf.cz/))! Another thanks goes to one of my former supporting mentors and program administrator [Remy DeCausemaker](https://fedoraproject.org/wiki/User:Decause).

I'm looking forward to another year and beyond of Fedora contributions, and can't wait to see what's next!
