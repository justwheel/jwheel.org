---
title: "HFOSS: Community Architecture Team Project Report"
date: 2016-03-14
categories: 
  - "education"
  - "fedora"
  - "foss"
tags: 
  - "fedora-badges"
  - "fedora"
  - "fedora-planet"
  - "hfoss"
  - "python"
  - "rochester-institute-of-technology"
  - "tahrir"
---

For the [Humanitarian Free and Open Source Software Development](https://hfoss-ritjoe.rhcloud.com/) (HFOSS) course at the [Rochester Institute of Technology](https://www.rit.edu/), we were tasked with the [Community Architecture (CommArch) project](https://hfoss-ritjoe.rhcloud.com/static/hw/commarch.txt). For this project, we were tasked with analyzing an open source project's community and the general details surrounding the project. This blog post serves as the analysis our team prepared for the project.

<!--more-->

## A. Describe software project, its purpose and goals.

[Tahrir](https://github.com/fedora-infra/tahrir) is a project that allows its users to create their own [Open Badges](http://openbadges.org/) – graphical icons that show that a user has attended a particular event, completed a specific challenge, or any number of other accomplishments.

## B. Give brief history of the project. When was the Initial Commit? The latest commit?

The [Mozilla OpenBadges](http://openbadges.org/) project’s wiki page was created in November of 2010, mentioning a few other projects that used a [badge system](https://marksurman.commons.ca/2010/08/12/badges-identity-and-you/) and encouraging people to contribute to that project. Once Mozilla’s OpenBadges project was established, Fedora Infrastructure team member and Red Hat employee [Ralph Bean](https://github.com/ralphbean) created the first commit for the Tahrir project in April of 2012. Since then, twenty-two contributors have worked on the project, with commits as recently as March 2nd, 2016.

## C. Who approves patches? How many people?

There did not seem to be an established, formal process for who has the privileges or authority to approve patches, but based on the most recent pull requests, the following users have been actively responsible in the past year for approving patches.

- Chaoyi Zha ([cydrobolt](https://github.com/cydrobolt))
- Ralph Bean ([ralphbean](https://github.com/ralphbean))
- Patrick Uiterwijk ([puiterwijk](https://github.com/puiterwijk))
- Trishna Guha ([trishnaguha](https://github.com/trishnaguha))
- Remy DeCausemaker ([decause](https://github.com/decause/))
- Pierre-Yves Chibon ([pypingou](https://github.com/pypingou/))

## D. Who has commit access, or has had patches accepted? How many total?

Based on total contributions, Ralph Bean and former contributor David Gay ([oddshocks](https://github.com/oddshocks)) made more contributions to the project than any other users. However, the list of users listed above (being able to approve patches) also seem to have commit access as well. From the outside, it is difficult to determine user permissions, but the contextual evidence provided from issues and pull requests seems to support this conclusion.

In total, the project has had twenty-two contributors.

## E. Who has the highest amounts of "Unique Knowledge?"

Based on the diversity of commits and git\_by\_a\_bus results (at the bottom of this post), [Ralph Bean](https://github.com/ralphbean) appears to have the highest amounts of unique knowledge for Tahrir.

## F. What is your project's "Calloway Coefficient of Fail?"

_Your source is configured by editing flat text config files._ +20

**Score**: 20 points of fail

## G. Has there been any turnover in the Core Team?

##### Has the same top 20% of contributors stayed the same over time? If not, how has it changed?

In the first two years of the project, David Gay ([oddshocks](https://github.com/oddshocks)) had a greater number of lines of code contributed to the project, and had some huge activity spikes in July of 2013. Since then, Bean and Uiterwijk have taken up a lot more of the work, and Gay hasn’t contributed since October of 2014.

Overall, Bean has been the greatest (and most consistent) contributor to the project.

## H. Does the project have a [BDFL](https://en.wikipedia.org/wiki/Benevolent_dictator_for_life), or Lead Developer?

Bean would be the closest thing to that. He guides the development of the project. After the project stabilized and all the core functionality was implemented, any further contributions seem to be minor bug fixes for the overall QOL of the project.

As a team, we could not necessarily speak to Bean’s role as a BDFL during the development process, especially without any chat logs from relevant IRC channels or email lists.

At the project’s current state, he seems to be keeping the project going along in a healthy direction and fixing the minor bugs that come up as they’re reported or patched.

## I. Are the front- and back-end developers the same people? What is the proportion of each?

Tahrir is created under the GitHub organization of the [Fedora Infrastructure](https://github.com/fedora-infra/) team. As a result, even though there is a core group of developers working on Tahrir, it wouldn't be an invalid assumption to say someone else in Fedora Infrastructure could take the code, change it for something that arose in production, and deploy it back into production.

As a result of the "DevOps" sort of relationship between the Fedora Infrastructure team and most of the projects on their GitHub, it is difficult to draw a firm conclusion about which developers work on the front end and which developers work on the back end. The unique circumstances of being an "open source project inside of an open source project" skews the answer to this question.

## J. What have been some of the major bugs, problems, and/or issues that have arisen during development? Who is responsible for quality control and bug repair?

To categorize the issues reported against during Tahrir's lifetime, we categorized the issues into three categories: _Concerning_ (15 or more comments on issues), _Eyebrow raising_ (10 - 14 comments on issues), and _Intriguing_ (5- 9 comments on issues). These three categories are intended to be representative of the issues that caused the most conversation and interest by many developers or other members of the community.

#### Concerning

- [#152: Tried to get undefined file at undefined and got an HTTP undefined](https://github.com/fedora-infra/tahrir/issues/152) (18 comments)
- [#168: Link to 3d-printer spec files](https://github.com/fedora-infra/tahrir/issues/168) (22 comments; you can 3D print badges… whoa!)

#### Eyebrow Raising

- [#117: Match\_all not working on tags view just yet.](https://github.com/fedora-infra/tahrir/issues/117) (12 comments)
- [#141: Emit a fedmsg when a new leader is crowned!](https://github.com/fedora-infra/tahrir/issues/141) (11 comments)
- [#244 : Stuck on a white page after OpenID login](https://github.com/fedora-infra/tahrir/issues/244) (11 comments)

#### Intriguing

- [#21: Admin view not properly escaped](https://github.com/fedora-infra/tahrir/issues/21) (8 comments)
- [#69: Render badge descriptions from .rst to html](https://github.com/fedora-infra/tahrir/issues/69) (6 comments)
- [#70: Fix error code images](https://github.com/fedora-infra/tahrir/issues/70) (5 comments)
- [#101: Fallback avatar looks bad on user view (too small).](https://github.com/fedora-infra/tahrir/issues/101) (5 comments)
- [#108: Export badges is broken in staging](https://github.com/fedora-infra/tahrir/issues/108) (9 comments)
- [#112: Implement opt-out mechanism](https://github.com/fedora-infra/tahrir/issues/112) (7 comments)
- [#176: Ask badges relate to username, but that's not working](https://github.com/fedora-infra/tahrir/issues/176) (5 comments)
- [#319: Libravatar badge not being awarded](https://github.com/fedora-infra/tahrir/issues/319) (5 comments)
- [#339: Represented Fedora at event not awarded](https://github.com/fedora-infra/tahrir/issues/339) (5 comments)

#### Quality Control

Looking through the [145 closed pull requests](https://github.com/fedora-infra/tahrir/pulls?q=is%3Apr+is%3Aclosed), it's clear to see that once again, Bean is leading the quality control and testing on Tahrir pull requests. There are a [few pull requests](https://github.com/fedora-infra/tahrir/pull/327) where Uiterwijk and [Chibon](https://github.com/pypingou) either submit code and the other one reviews and approves it. In these edge cases, it seems to be the contributions of more experienced members of the Infrastructure submitting code and getting another experienced member to check the submitted code.

For new contributors or contributions from non-consistent contributors, Bean seems the be the defacto "King of PRs" for Tahrir.

## K. How is the project's participation trending and why?

Based on [activity graphs](https://github.com/fedora-infra/tahrir/graphs/contributors) of the lifetime of the project, the most participation and development of Tahrir occurred in the summer months of 2012 and 2013. This can likely be attributed that the heaviest development work was happening in these time periods while Tahrir was being built and shaped into what it is.

Once a stable point was reached and most issues were resolved, development greatly slowed, likely because the developers moved  on to new projects, while a subset of the original core developers remained active as maintainers after the stable point was reached.

## L. In your opinion, does the project pass "The Raptor Test?" Why or why not?

##### Would the project survive if the BDFL, or most active contributor were eaten by a Velociraptor?

For the purposes of this question, we will assume Bean is the lead contributor at the current point in the project's life cycle.

If he were eaten by a velociraptor, the project would still be able to survive even in his absence. Since the core development work has already been accomplished and the main development work now is resolving issues and maintaining the existing codebase (as compared to writing new features), it's safe to assume there are others in the Fedora Infrastructure team who would be able to keep up this project and make sure its longevity is guaranteed (although I am sure that the Infrastructure team would suffer a great loss without the wisdom and mad wizardry that Bean provides).

The fact that Tahrir is "nested" inside of another open source project (Fedora) likely attributes to the likelihood that Tahrir would survive the sudden absence of its most active developer.

## M. In your opinion, would the project survive if the core team, or most active 20% of contributors, were hit by a bus? Why or why not?

This question is more difficult to answer than the previous question because of the relationship the top 20% of the contributors have to Tahrir, Fedora, and other open source projects. The top 20% of contributors mostly consist of the core Fedora Infrastructure team members, who are also responsible for working on other projects within Fedora, maintaining the servers and services that power the infrastructure, and working on apps such as Tahrir.

In the event that the top 20% of Tahrir's contributors were all hit by a bus, it's difficult to know if Tahrir would be able to sustain. Because of the work the core developer circle does throughout the [Fedora Project](https://fedoraproject.org/wiki/Overview), it would be very difficult for others to pick up the cumulative amount of work that is shared among the Infrastructure team now. The documentation and stability of the code would be useful attributes for the prospect of someone new picking up maintaining the code, but in a broader view, the amount of work that would need to be picked up across the board creates new issues within itself.

For these reasons, if the top 20% of contributors to Tahrir were to disappear, it's difficult to forecast the future of Tahrir (and other projects managed by the Fedora Infrastructure team).

## N. Does the project have an official "on-boarding" process in place?

##### Can include new contributor guides, quick starts, communication leads who focus specifically on newbies, etc…

While there is no on-boarding process in place specific to Tahrir, there is a [process for the Fedora Infrastructure team](https://fedoraproject.org/wiki/Infrastructure/GettingStarted), which would in turn lend itself to Tahrir. Some of the advice given includes [how to be a successful contributor](https://fedoraproject.org/wiki/How_to_be_a_successful_contributor) and introducing yourself on their [mailing list](https://lists.fedoraproject.org/admin/lists/infrastructure.lists.fedoraproject.org/).

## O. Does the project have documentation available? Is it extensive? Does it include code examples?

The project does have documentation in the [README file](https://github.com/fedora-infra/tahrir/blob/develop/README.rst) for installing, running, and developing on Tahrir, but they are not an extensive set of "documents" or wiki pages that explain the entire process. The guide does seem to assume the person reading the documentation is capable enough to run a few commands in a command line or install Python dependencies with tools like `pip`.

For anyone who knows anything about Python, this documentation will be plenty, but if you are a new developer looking at getting started for the first time, you may have a learning curve with figuring out what all the commands you are instructed to do actually do on yourself.

There do not seem to be code examples for Tahrir (if there are, their presence is not clearly stated).

## P. If you were going to contribute to this project, but ran into trouble or hit blockers, who would you contact, and how?

If we wanted to contribute to Tahrir, it seems like the best points of contact are either the [`#fedora-apps`](https://webchat.freenode.net/?channels=fedora-apps) channel on [Freenode](https://freenode.net/) or the [Infrastructure mailing list](https://lists.fedoraproject.org/archives/list/infrastructure@lists.fedoraproject.org/). IRC appears to be the preferential way of getting help.

## Q. Based on these answers, how would you describe the decision making structure / process of this group?

##### Is it hierarchical, consensus building, ruled by a small group, barely contained chaos, or ruled by a single or pair of individuals?

In the current state of the group, decision making seems to favor the lazy consensus sort of voting; that is, if there are no objections or negative feedback on a feature addition or a bug fix, it is assumed there is not an issue and development presses forward. However, there seems to be an informal, undocumented precedent that every contributor must get their code signed off by at least one other member of the Fedora Infrastructure team (even if the contributor is an experienced, active member of the Infrastructure team).

In short, the development and community architecture of Tahrir seems to be greatly left to Bean and the rest of the Fedora Infrastructure team. In the event of new ideas or "topics worth discussion", usually there is activity either in IRC or on the mailing list before heavy development goes forward.

## R. Is this the kind of structure you would enjoy working in? Why, or why not?

The system that the Fedora Infrastructure team appears to follow seems to be documented and regimented, so getting involved isn't difficult and the community appears supportive of new developers. For me, I believe the community architecture surrounding the Tahrir project is a friendly and welcoming environment for any level of contributor of open source to get involved with and hack on a cool project.

## Community Architecture: [Git by a Bus](https://github.com/tomheon/git_by_a_bus) Summary Results

Note: values smaller than 10 have been truncated in the interest of space.

Note: the scale of the bars is relative only within, not across, tables.

#### Top 100 Projects by highest estimated unique knowledge

| Projects | Total estimated unique knowledge |
| --- | --- |
| [tahrir](projects/tahrir.html) (3217) |  |

#### Top 100 Projects by highest estimated shared knowledge (devs still present)

| Projects | Total estimated shared knowledge (devs still present) |
| --- | --- |
| [tahrir](projects/tahrir.html) (414) |  |

#### Top 100 Projects by highest estimated risk

| Projects | Total estimated risk |
| --- | --- |
| [tahrir](projects/tahrir.html) (290) |  |

#### Top 100 Devs by highest estimated unique knowledge

| Devs | Total estimated unique knowledge |
| --- | --- |
| [David Gay](devs/801ed96179d189c0b9e13aa4e7d16ac0.html) (1233) |  |
| [Ralph Bean](devs/7b13ae0e56d868362bb10383cbb2ac14.html) (1163) |  |
| [Pierre-Yves Chibon](devs/bc3f99a8563168f1a78d1f7c88184e39.html) (260) |  |
| [Ricky Elrod](devs/a9b149be06964ed6876c559b753112ca.html) (171) |  |
| [David Gay and Ralph Bean](devs/69febc7c4efd343f78a38a6c1d0aea7e.html) (159) |  |
| [David Gay and Ricky Elrod](devs/81661e7e28bc3e84d4f3b8b6d5ff0430.html) (59) |  |
| [Ralph Bean and Ricky Elrod](devs/e32b641738dd12f79c335854c5d13498.html) (48) |  |
| [Ralph Bean and Ross Delinger](devs/3a4dd3cd06c97e5550f4121edc0db059.html) (18) |  |
| [David Gay and Ralph Bean and Ricky Elrod](devs/d7b9abadb07ce76a5e06b622905ecb9d.html) (16) |  |
| [Patrick Uiterwijk](devs/5e3a065db38507fca1f4d5892e667999.html) (13) |  |
| [Ross Delinger](devs/1864d619787d3894225528ae1bb14814.html) (11) |  |

#### Top 100 Devs by highest estimated shared knowledge (devs still present)

| Devs | Total estimated shared knowledge (devs still present) |
| --- | --- |
| [David Gay and Ralph Bean](devs/69febc7c4efd343f78a38a6c1d0aea7e.html) (185) |  |
| [David Gay and Ricky Elrod](devs/81661e7e28bc3e84d4f3b8b6d5ff0430.html) (77) |  |
| [Ralph Bean and Ricky Elrod](devs/e32b641738dd12f79c335854c5d13498.html) (66) |  |
| [Ralph Bean and Ross Delinger](devs/3a4dd3cd06c97e5550f4121edc0db059.html) (28) |  |
| [David Gay and Ross Delinger](devs/3dae24e44c5b1fa55228d1918b57bdac.html) (12) |  |
| [Pierre-Yves Chibon and Ralph Bean](devs/93b128844d0d40d16a5605cb17c37fd6.html) (11) |  |

#### Top 100 Devs by highest estimated risk

| Devs | Total estimated risk |
| --- | --- |
| [David Gay](devs/801ed96179d189c0b9e13aa4e7d16ac0.html) (123) |  |
| [Ralph Bean](devs/7b13ae0e56d868362bb10383cbb2ac14.html) (116) |  |
| [Pierre-Yves Chibon](devs/bc3f99a8563168f1a78d1f7c88184e39.html) (26) |  |
| [Ricky Elrod](devs/a9b149be06964ed6876c559b753112ca.html) (17) |  |

#### Top 100 Files by highest estimated unique knowledge

| Files | Total estimated unique knowledge |
| --- | --- |
| [tahrir:tahrir/views.py](files/tahrir__tahrir__views.py.html) (1914) |  |
| [tahrir:docs/conf.py](files/tahrir__docs__conf.py.html) (504) |  |
| [tahrir:tahrir/utils.py](files/tahrir__tahrir__utils.py.html) (220) |  |
| [tahrir:tahrir/\_\_init\_\_.py](files/tahrir__tahrir____init__.py.html) (217) |  |
| [tahrir:setup.py](files/tahrir__setup.py.html) (70) |  |
| [tahrir:tahrir/app.py](files/tahrir__tahrir__app.py.html) (68) |  |
| [tahrir:tahrir/events.py](files/tahrir__tahrir__events.py.html) (58) |  |
| [tahrir:tahrir/foafutils.py](files/tahrir__tahrir__foafutils.py.html) (42) |  |
| [tahrir:tahrir/custom\_openid.py](files/tahrir__tahrir__custom_openid.py.html) (38) |  |
| [tahrir:tahrir/widgets.py](files/tahrir__tahrir__widgets.py.html) (36) |  |
| [tahrir:fedmsg.d/fedmsg-config.py](files/tahrir__fedmsg.d__fedmsg-config.py.html) (30) |  |
| [tahrir:tahrir/notifications.py](files/tahrir__tahrir__notifications.py.html) (20) |  |

#### Top 100 Files by highest estimated shared knowledge (devs still present)

| Files | Total estimated shared knowledge (devs still present) |
| --- | --- |
| [tahrir:tahrir/views.py](files/tahrir__tahrir__views.py.html) (349) |  |
| [tahrir:tahrir/\_\_init\_\_.py](files/tahrir__tahrir____init__.py.html) (26) |  |
| [tahrir:setup.py](files/tahrir__setup.py.html) (13) |  |
| [tahrir:tahrir/utils.py](files/tahrir__tahrir__utils.py.html) (12) |  |

#### Top 100 Files by highest estimated risk

| Files | Total estimated risk |
| --- | --- |
| [tahrir:tahrir/views.py](files/tahrir__tahrir__views.py.html) (165) |  |
| [tahrir:docs/conf.py](files/tahrir__docs__conf.py.html) (50) |  |
| [tahrir:tahrir/utils.py](files/tahrir__tahrir__utils.py.html) (21) |  |
| [tahrir:tahrir/\_\_init\_\_.py](files/tahrir__tahrir____init__.py.html) (20) |  |

## Community Architecture: [Git by a Lion](https://github.com/liam-middlebrook/git_by_a_lion) Pie Chart Results

[![Tahrir Community Architecture: Author Total Knowledge](/blog/2016/03/author_tot_knowledge.png)](/blog/2016/03/author_tot_knowledge.png)[![Tahrir Community Architecture: Author Total Risk](/blog/2016/03/author_tot_risk.png)](/blog/2016/03/author_tot_risk.png)[![Tahrir Community Architecture: File Total Knowledge](/blog/2016/03/file_tot_knowledge.png)](/blog/2016/03/file_tot_knowledge.png)[![Tahrir Community Architecture: File Total Risk](/blog/2016/03/file_tot_risk.png)](/blog/2016/03/file_tot_risk.png)
