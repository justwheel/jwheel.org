---
title: "How five Queen songs went mainstream in totally different ways"
date: 2018-10-16
categories: 
  - "education"
  - "metabrainz"
  - "music"
  - "foss"
tags: 
  - "data"
  - "data-analysis"
  - "data-science"
  - "education"
  - "fedora-planet"
  - "music"
  - "musicbrainz"
  - "rochester-institute-of-technology"
  - "rochester-ny-usa"
coverImage: "five-queen-songs-mainstream.jpg"
---

[_Originally published on the MusicBrainz blog._](http://blog.musicbrainz.org/2018/10/16/five-queen-songs-mainstream/)

[](http://blog.musicbrainz.org/2018/10/16/five-queen-songs-mainstream/)

* * *

Making graphs is easy. Making intuitive, easy-to-understand graphs? It's harder than most people think. At the [Rochester Institute of Technology](https://www.rit.edu/), the ISTE-260 (Designing the User Experience) course teaches the language of design to IT students. For an introductory exercise in the class, students are tasked to visualize any set of data they desire. Students [David Kim](https://www.linkedin.com/in/davidkim18/), [Jathan Anandham](https://www.linkedin.com/in/jathan-a/), [Justin W. Flory](https://www.linkedin.com/in/justinwflory/), and [Scott Tinker](https://www.linkedin.com/in/scott-tinker-216962129/) used the MusicBrainz database to look at how five different Queen songs went mainstream in different ways.  

<!--more-->

## Five factors of Queen

Our mini data science experiment decided to look at five unique data points available to us via [MusicBrainz Works](https://musicbrainz.org/doc/Work):

- Number of recorded covers
- Number of artists who covered a song
- Release year
- Year of last recorded cover
- Time elapsed between release year and year of last recorded cover

Originally, we looked at songs from different artists, but decided to look at five recordings from the same artist. With Queen being a notoriously famous band, there were several data points to work with in terms of how often a song was covered.

![How five Queen songs went mainstream in totally different ways](/blog/2018/10/Queen-data-visualization.png "**_Studying five Queen songs_**: Another One Bites the Dust, Bohemian Rhapsody, Don't Stop Me Now, Fat Bottomed Girls, We Will Rock You")

## Making sense of the data

A few explanations are necessary for some of the data, especially the difference in number of covers and number of artists. _Don't Stop Me Now_, _Fat Bottomed Girls_, and _We Will Rock You_ had the same number of recorded covers as number of artists who have covered the song. Why were _Another One Bites the Dust_ and _Bohemian Rhapsody_ different?

As it turns out, _Another One Bites the Dust_ had more covers than the number of artists who have covered the song. This happens because some artists have covered the song twice (e.g. once on a studio release and another on a live recording release). On the other hand, Bohemian Rhapsody had more artists covering it than number of covers because some recordings featured multiple artists on the same cover (e.g. the 1992 live performance with Elton John and Axl Rose).

The data opens many interesting questions. Why have some songs persisted longer than others (in terms of recent covers)? Have these songs impacted culture and society in different ways? How have they permeated culture? Is there geographical bias in the data?

This exercise was an exploratory assignment, but we had fun visualizing it and ended up learning an interesting pattern in music data.

## Check out the presentation and paper

If you're interested for the full details, the [slides](https://docs.google.com/presentation/d/1sMgwgo5dxi2n0j1elnlfZgk3OU5QnwsZfcrNwQYmmCQ/edit?usp=sharing) and a [short paper](https://docs.google.com/document/d/1sLXBK2uUCpBazBUe_EiRdHOGlKUcBMwP7CG1XX9-Aiw/edit?usp=sharing) about the presentation are available online. They provide deeper context for the research and the visualization details based on different design concepts.  

You can see what else [David Kim](https://www.linkedin.com/in/davidkim18/), [Jathan Anandham](https://www.linkedin.com/in/jathan-a/), [Justin W. Flory](https://www.linkedin.com/in/justinwflory/), and [Scott Tinker](https://www.linkedin.com/in/scott-tinker-216962129/) are up to on LinkedIn. Thanks for tuning in to this adventure into music data analysis, powered by MusicBrainz!  

* * *

_Photo by [Matthias Wagner](https://unsplash.com/photos/QrqeusbpFMM?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/search/photos/microphone?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)._
