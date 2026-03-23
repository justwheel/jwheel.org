---
title: "DevConf CZ 2020: play by play"
date: 2020-02-13
categories: 
  - "fedora"
  - "foss"
  - "tech"
  - "travel"
tags: 
  - "2020-foss-conferences"
  - "2020s"
  - "cloud-computing"
  - "community"
  - "community-management"
  - "conferences"
  - "czech-republic"
  - "devconfcz"
  - "dei"
  - "documentation"
  - "events"
  - "fedora"
  - "fedora-planet"
  - "infrastructure"
  - "metrics"
  - "open-source-communities"
  - "rochester-institute-of-technology"
coverImage: "devconf-2020.png"
---

DevConf CZ 2020 took place from Friday, January 24th to Sunday January 27th in Brno, Czech Republic:

> DevConf.CZ 2020 is the 12th annual, free, Red Hat sponsored community conference for developers, admins, DevOps engineers, testers, documentation writers and other contributors to open source technologies. The conference includes topics on Linux, Middleware, Virtualization, Storage, Cloud and mobile. At DevConf.CZ, FLOSS communities sync, share, and hack on upstream projects together in the beautiful city of Brno, Czech Republic.
> 
> [devconf.info/cz/](https://www.devconf.info/cz/)

This is my third time attending DevConf CZ. I attended on behalf of [RIT LibreCorps](https://fossrit.github.io/librecorps/) for professional development, before a week of work-related travel. DevConf CZ is also a great opportunity to meet friends and colleagues from across time zones. This year, I arrived hoping to better understand the future of Red Hat's technology, see how others are approaching complex problems in emerging technology and open source, and of course, to have yummy candy.

<!--more-->

## Sessions: Play-by-play

Event reports take many forms. My form is an expanded version of my session notes along with key takeaways. Said another way, my event report is biased towards what is interesting to me. You can also skim the headings to find what interests you.

### Diversity and inclusion meet-up

> Would you like to meet other attendees who stand under the umbrella of "Diversity and Inclusion" or would you like a introduction into what Diversity and inclusion is and why it's a good thing? this is the session for you! All are welcome!
> 
> [Imo Flood-Murphy](https://devconfcz2020a.sched.com/event/YS2w/diversity-and-inclusion-meet-up)

This was a short, informal session ran by Imo to network and get a high-level introduction to diversity and inclusion in open source. Everyone in the room introduced themselves and gave a short explanation of who they were or what projects they represent. I appreciated the opportunity to meet others and better understand how Red Hat approaches diversity and inclusion.

A suggestion for next time is to allow more unstructured time for conversations. I think fun icebreakers get folks comfortable in a short amount of time to help make connections for the rest of the weekend.

### Lessons learned from testing over 200,000 lines of Infrastructure Code

> If we are talking that infrastructure is code, then we should reuse practices from development for infrastructure, i.e.
> 
> 1\. S.O.L.I.D. for Ansible.
> 
> 2.Pair devops-ing as part of XP practices.
> 
> 3\. Infrastructure Testing Pyramid: static/unit/integration/e2e tests.
> 
> [Lev Goncharov](https://devconfcz2020a.sched.com/event/YS73/lessons-learned-from-testing-over-200000-lines-of-infrastructure-code)

Lev shared best practices on building sustainable, tested infrastructure. Infrastructure-as-Code (IaC) was important to how T-Systems scaled their infrastructure over time.

My key takeaways:

1. Smaller components:
    1. More sustainable
    2. Easier to maintain
    3. Easier to test
2. Ansible Roles encourage best use practices for Ansible
3. Spreading knowledge is essential (if nobody understands it, the code is broken)
4. Code review creates accountability
5. Use static analysis tools ([Shellcheck](https://github.com/koalaman/shellcheck), [Pylint](https://www.pylint.org/), [Ansible Lint](https://docs.ansible.com/ansible-lint/))
6. Write unit tests ([shUnit2](https://github.com/kward/shunit2), [Rspec](https://rspec.info/), [Pytest](https://docs.pytest.org/en/latest/), [Testinfra](https://testinfra.readthedocs.io/en/latest/), [Ansible Molecule](https://molecule.readthedocs.io/en/latest/))

### Content as code, technical writers as developers

> In the open-source project [Kyma](http://kyma-project.io), documentation is an integral part of code delivery. We, the project's Information Developers, believe that using the same tools and methodology as your good old code developers, we can create comprehensive and accurate documentation. During our talk, we’ll share the whys and hows of our approach, showing you that the "developer" in "Information Developer" isn't there just because it sounds cool. We'll prove that creating documentation goes beyond linguistic shenanigans and salvaging whatever information there is from a trainwreck that is the developer's notes. Testing solutions, finding our way around Kubernetes, tweaking the website, engaging with the community are just a few examples of what keeps us busy every day.
> 
> [Barbara Czyz, Tomasz Papiernik](https://devconfcz2020a.sched.com/event/YOvj/content-as-code-technical-writers-as-developers)

"Information Developers" is a cool phrase I learned. Barbara and Tomasz explained the value of technical writing and asserted documentation should live close to project code.

My key takeaways:

1. Documenting processes like release notes enables others to join with less barriers
2. **Docs-as-Code (DaC)**: Visibility of docs across development process is important
    1. Placing docs with code encourages feedback loops and avoids silos
3. Put links to docs in visible places (e.g. API messages, console messages)
4. Management aside: Emphasize/incentivize value of technical writing in your team
5. Remember bridges across skill areas is possible (technical writers can also be community-oriented people too)

### Uncharted waters: Documenting emerging technology

> We can't help but feel the lure towards the hot new thing, especially when it comes to technology. Part of that lure is the breaking of ground, venturing into the unknown, and working on solutions to new problems. But a lot of the same things that make emerging technology fun and exciting to work on are exactly why it can be difficult to document. These challenges are quite different to those associated with mature products.
> 
> This talk is for anyone working on new products and emerging technology, or just interested in learning about fast-moving documentation. It is for the developer as much as it is for the writer, since it usually falls to them to write the early docs before a writer is added to the team.
> 
> [Andrew Burden](https://devconfcz2020a.sched.com/event/YOyU/uncharted-waters-documenting-emerging-technology)

This was the talk I didn't know I **_needed_** to go to.

Lately I work with "emerging technology," which means different things to different people. Regardless of what emerging tech means to you, Andrew focused on how to write documentation in a fast-paced environment with "pre-release" technology, where things change fast and suddenly. Normally this is an excuse to _not_ write docs, but Andrew showed, _yes_! It is possible to write good docs, even when context changes fast and often.

#### Key considerations of fast-paced technical writers

An even balance of these considerations helps get into a user's mindset:

1. Scope / scale of release
2. Release schedule
3. Developer meetings / face-time
4. Exposure with `$TECHNOLOGY`
5. Deployment experience with `$TECHNOLOGY`

#### Surviving the information wall

The "information wall" is the endless wall of information and things to know about a project. If information is endless, how do technical writers survive?

- Take notes: Be like a scientist
- Take notes about your notes
- Be organized with your notes

Obviously Andrew was getting at the value of note-taking. Practicing note-taking skills is critical to keep up with the pace of change.

#### "Multi-Version Syndrome"

Sometimes you are writing features for things that will not be released in the next release. There is a risk of losing information across multiple releases (e.g. publishing the wrong thing too soon, or the right thing too late). Clarify the release schedule as you go. A good safeguard against losing information is to rigorously understand release cycle cadence and priority.

If your product isn't mature yet, anticipate change instead of avoiding it.

#### Access to technology is critical

Technical writers are often User 0. To understand the technology, you need access. There are interactive and non-interactive ways of getting access. Interactive ways are preferred because they are always reproducible.

- Interactive
    - Deploy your own
    - Get someone else to deploy it for you (but lose install context)
- Non-interactive
    - Live demos
    - Demo videos
    - [Asciicinema](https://asciinema.org/) (CLI-oriented)

#### Other takeaways

- Screenshots have high maintainability cost; avoid if possible
    - Sometimes good stop-gaps until something more maintainable
- Where to begin? Make a table-of-contents for the Minimum Viable Product
    - Never underestimate outlines (_ahem, like how I wrote this blog post…_)
- Avoid documentation scramble near release day:
    - Make lists / check-lists
    - Take more notes
    - Pre-release checklist
    - Think now, and for the future
- Audit your docs: On-boarding new people is a powerful opportunity to test out your docs

Thanks Andrew for a deep dive on this narrow but important topic.

### Community management: not less than a curry

> Every volunteer joins an Open Source community for a reason. The reasons could range from technical gains to finding his/her/their passion. This community of diverse volunteers require a leader who can not just mentor them with their interests but also a manager managing the community activities in terms of community engagement and planning. A community manager is not less than a candle of light and in this presentation, I would be highlighting my learnings and experiences about starting a community from scratch around a project and maintaining a healthy community management practices.
> 
> [Prathamesh Chavan](https://devconfcz2020a.sched.com/event/YOpX/community-management-not-less-than-a-curry)

Prathamesh designed an activity to help the audience understand community management. My key takeaway was community management is about connecting and understanding others as their authentic self.

In the activity, Prathamesh passed papers and pens to the audience. His session had three steps. Between each step, all attendees traded papers with another attendee:

1. Define a project idea (why, how, what)
2. Identify challenges to idea (i.e. questions)
3. Answer challenges

It reminded me of a similar workshop I attended before. This inspired me to work on [my own workshop idea](https://github.com/jwflory/logbook/blob/master/notes/identity/question-burst-better-questioners.adoc) for a future conference.

### Cognitive biases, blind spots, and inclusion

> Open source thrives on diversity. The last couple of years has seen huge strides in that aspect with codes of conduct and initiatives like the Contributor Covenant. While these advancements are crucial, they are not enough. In order to truly be inclusive, it’s not enough for the community members to be welcoming and unbiased, the communities’ processes and procedures really support inclusiveness by not only making marginalized members welcome, but allowing them to fully participate.
> 
> [Allon Mureinik](https://devconfcz2020a.sched.com/event/YOoH/cognitive-biases-blindspots-and-inclusion)

Allon recognizes the importance of diversity, but asking for improved diversity is one side of the coin. A friend recently shared a powerful quote with me: "If diversity is being invited to the party, inclusion is being invited _to_ dance." Allon's message was to dig deeper on including marginalized people in our project communities.

He identified ways we accidentally make our communities less inclusive because of our cognitive/unconscious biases. Everyone has blind spots! Allon suggested ways to be more conscious about inclusion in open source:

- **Knowledge barriers**
    - Procedural knowledge, not just technical
        - How do you submit code? File a bug? Make meaningful contributions? These need to be documented
    - Documentation fosters inclusivity
- **Language barriers**
    - Working proficiency in English not universal
    - Conversations have extra barriers (e.g. communicating complex ideas, understanding advanced words)
- **Time barriers**
    - Work schedules no longer 9 to 5
    - Remember other folks in different time zones
    - On giving feedback: Fast is not a metric! Be smart
        - Merging PRs while others are away, or shortly after opening it
        - Allow time for input on non-trivial changes
- **Transparency barriers**
    - If not in the open, it didn't open
    - Negative example: Contributor makes a PR, reviewer has face-to-face conversation with contributor, reviewer merges PR without public context
    - Default to open: in many ways
        - If you can't be open, at least be transparent

### Diversity in open source: show me the data!

> How diverse is your work environment? Diverse communities are more effective, they allow us to share the strengths of the individuals who make up the community. Have you ever looked around and noticed that most of our Open Source communities are predominantly male? Why do you think that is? We’ll use gender diversity as a case study and share some intriguing data points. Let us convince you why it’s so important.
> 
> Regardless of your gender, we would love for you to join us! We will also give you some tips on how you can make a difference.
> 
> [Serena Chechile Nichols, Denise Dumas](https://devconfcz2020a.sched.com/event/YOtn/diversity-in-opensource-show-me-the-data)

Serena and Denise divided the talk into two sections: metrics and action. The way they presented, they brought the audience on the same page by visiting a variety of metrics and then transitioned to an empowering discussion about changing trends we see.

Next time, I hope to see expanded messaging by defining diversity beyond only women. Diversity was frequently tied to gender participation metrics in open source. While women are underrepresented, there are additional aspects of identity that can compound discrimination. Race, socioeconomic status, nationality, sexual orientation, and more also play a part in understanding challenges collectively faced in inclusion work.

#### The data

- **Gender differences by # of contributors**:
    - GSoC 2018: 11.6% female-identifying contributors
    - OpenStack: 10.4% female-identifying contributors
    - Linux kernel: 9.9% female-identifying contributors
- **U.S. Dept. of Labor: 22.2% of technical roles filled by women**
    - 2014-2019: More women entering tech jobs at companies like Apple, Microsoft, Google, etc.
- **Years of experience by gender (<9 years)**:
    - 66.2% female
    - 52.9% non-binary/queer
    - 50.1% male
- **GitHub user and developer survey**:
    - 95% male
    - 3% female
    - 1% non-binary

#### Let's make things better

Serena and Denise asserted diversity creates change. All changes come with challenges. Diversity can increase the friction in the process, but that is okay. They emphasized the need for multiple perspectives see past our initial biases (conveniently covered by Allon in the previous talk).

This transitioned to questions, comments, and thoughts from the audience. One interesting point was using the phrase, "[we don't do that here](http://www.thagomizer.com/blog/2017/09/29/we-don-t-do-that-here.html)" to create and set norms. I gave a suggestion to look at projects you already participate in and see if there is a diversity and inclusion effort there already. If there is, see if there are ways to help and get involved. If not, consider starting one (or network with the [Open Source Diversity community](https://discourse.opensourcediversity.org/)).

To wrap up, one recurring theme of Serena and Denise's talk is to make time to step back and evaluate the bigger picture. Questioning our biases is an important skill to practice. We need the space and time to recompute!

### Candy Swap

> Do you have a unique sweet dessert or candy from your country or hometown? Do you love to try new and exciting foods from around the world? Spend an hour with fellows as we share stories and candies from the world with each other. Participants are invited to bring a unique confectionary or candy from their country or city to share with multiple other people. Before going around to try yummy things, all participants explain what item they bring and any story about its origins or where it is normally used. After sharing, everyone who brought something rotates around to try candies brought by others. After all participants have had a chance to sample, the rest of the community is invited to come and try anything remaining.
> 
> [Jona Azizaj, Justin W. Flory](https://devconfcz2020a.sched.com/event/YS6U/candy-swap)

I _am_ biased when I say this is one of my favorite parts of conferences I go to. Jona originally proposed the candy swap for DevConf CZ. After unexpectedly adding DevConf CZ to my travel list for 2020, we teamed up to share the sweet tradition from Fedora Flock to DevConf CZ! This is one of my favorite conference traditions because I get to know other attendees in a context outside of technology. And food is always an easy way to win me over.

Instead of listening to me, see what other people have to say about it:

https://twitter.com/mary\_grace/status/1221075300584448000

https://twitter.com/devconf\_cz/status/1221026710969298947

https://twitter.com/jonatoni/status/1221076375081062400

https://twitter.com/freaky\_mortal/status/1221366223381778434

### From Outreachy to cancer research

> Outreachy program is helping women and other underrepresented people to make first steps in tech career. Picking a project, making first open source contributions, working on assigned project and learning from advanced people. But what happens when this three months are over? Can Outreachy be a lifechanging experience?
> 
> I will share my story of conversion from a chemist and full time parent into a Fedora Outreachy intern and how I found my place as a junior software developer in cancer genomics research at IRB Barcelona.
> 
> [Lenka Segura](https://devconfcz2020a.sched.com/event/YOwh/from-outreachy-to-cancer-research)

This was a favorite of the weekend. "Fedora Outreachy intern Lenka Segura on how Outreachy opened the door for her career to cancer research at IRB Barcelona!"

I put effort into live-tweeting a Twitter thread. Get the full scoop there!

https://twitter.com/jflory7/status/1221372453777264640

### Connect and grow your community through meetups

> Open source communities collaborate in a multitude of ways - chatting on irc, submitting issues and contributing code on GitHub, discussing and sharing ideas on reddit and other social channels. Face to face gatherings add another dimension to that, where community members can learn and share their experiences. Local meetups provide a venue for people with similar interests to socialize and connect. However, organizing meetups is not trivial. How do we encourage and motivate the community to arrange meetups, and to keep the momentum? In my one year with the Ansible community, we have doubled the number of active meetups in Europe. These meetups are community driven, rather than Red Hat. Find out how we use metrics to analyze the situation and needs, and the steps we are taking to reach our goals of connecting with even more community members. Learn from our mistakes and challenges (100 RSVPs and only 20 turned up?), plus some tips to make your meetups more inclusive.
> 
> [Carol Chen](https://devconfcz2020a.sched.com/event/YOr2/connect-and-grow-your-community-through-meetups)

Carol explained the role of local meet-ups around the world in building communities around software projects. She emphasized that single metrics are not always useful, so it is more helpful to evaluate on multiple areas. The most useful takeaway for me was the 5 W's: why, who, what, when, where.

- **Why?** Common curiosity (noticing something new in your community)
- **Who?** Connections and networking
- **What?** Concise, compelling content
    - Consider venue travel (how to make it worth their while?)
    - Provide alternatives to git-based submissions
    - All talks don't have to be technical! Diversify to appeal to wider audiences
        - Announcements for future events, work-life talks
        - We are more than just the technology we work with
- **When?** Consistency
    - Helps with venue scheduling
    - Helps retain attendee focus and build habits

Carol also gave suggestions for common points to think about for improved inclusion. All of these need active, not passive inclusion.

- Special needs / disabilities
- Food allergies
- Beverage preference (often alcohol/non-alcoholic)
- Language
- Traffic-light communication stickers
- Photography lanyards
- Gender pronouns

## Beyond DevConf CZ

While the sessions are excellent and fulfilling (and sometimes frustrating when you miss a good talk with a full room), DevConf is also more than the sessions. It's also the people and conversations that happen in the "hallway track." It was nice to see many old friends and make new ones.

I spent a few extra days before and after DevConf CZ in Brno. In some of that time, my colleague [Mike Nolan](https://nolski.rocks/) and I rehearsed in-person for our FOSDEM talk the following weekend (to come in a future blog post). I also enjoyed coffee and waffles with Marie, Sumantro, and Misc!

<figure>

- [![](/blog/2020/02/IMG_20200124_212601881_HDR-scaled.jpg)](/blog/2020/02/IMG_20200124_212601881_HDR-scaled.jpg)
    
- [![](/blog/2020/02/IMG_20200124_212616232-rotated.jpg)](/blog/2020/02/IMG_20200124_212616232-rotated.jpg)
    
- [![](/blog/2020/02/IMG_20200129_105148632_HDR-scaled.jpg)](/blog/2020/02/IMG_20200129_105148632_HDR-scaled.jpg)
    
- [![](/blog/2020/02/IMG_20200129_124253219.jpg)](/blog/2020/02/IMG_20200129_124253219.jpg)
    

<figcaption>

A few memories of a great week in Brno

</figcaption>

</figure>

## Until next time!

I learn a lot and have a lot of fun at DevConf CZ. I'm happy to return for a third year. Hats-off to the organizers and volunteers who pulled it all off. Each year, DevConf gradually makes improvements. It's nice to see inclusion prioritized across the board.

Thanks also goes out to [RIT LibreCorps](https://fossrit.github.io/librecorps/) for sponsoring my trip. Extra thanks to Jona Azizaj!
