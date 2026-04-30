---
title: "Sphinx docs authors: Meet an opinionated quickstart"
date: 2018-12-03
categories: 
  - "foss"
  - "tech"
tags: 
  - "best-practices"
  - "documentation"
  - "fedora-planet"
  - "getting-started"
  - "github"
  - "quality-assurance-qa"
  - "rit-linux-users-group-ritlug"
  - "rochester-institute-of-technology"
  - "sphinx"
images: ["/blog/2018/12/sphinx-docs-opinionated-quickstart.jpg"]
---

Do you write documentation with the Sphinx [tool chain](http://www.sphinx-doc.org/en/master/)? Do you want to encourage more people to write Sphinx documentation in a distributed organization, but worry about maintaining compatible workflows? Introducing [sphinx-docs-opinionated-quickstart](https://github.com/justwheel/sphinx-docs-opinionated-quickstart), a template repository with an opinionated configuration of ReStructuredText documentation with Travis CI testing and [readthedocs.org](https://readthedocs.org/) publishing.  

<!--more-->

I created this for the [RIT Linux User's Group](https://ritlug.com/) (a.k.a. RITlug). RITlug welcomes student-led projects for members to work on together. RITlug executive board members want to better encourage students to share and join projects for collaboration with the community (in the spirit of FOSS). To do this, the executive board members will create and offer both a template website and template documentation tools to introduce students to project development process. Then, students are better able to sustain a more diverse community around their projects.

## "Start writing ReStructuredText already!"  

The philosophy with this small project is: "_Start writing ReStructuredText already!_" I use Sphinx with ReadTheDocs as a deployment option across [different organizations](https://jwfblog.wpenginepowered.com/2018/02/unicef-internship/). I want a common base to later customize for a specific project's needs.

The whole point of this project is to save time kicking off a new project's recently-established documentation effort.

## Sphinx Travis CI testing configuration included

Complex documentation tool chains need simple validation of successful builds. This avoids long periods where documentation may not build and the public docs are out of date. It also better engages core contributors to monitor and take care of their documentation.  

A Travis CI [configuration](https://github.com/justwheel/sphinx-docs-opinionated-quickstart/blob/master/.travis.yml) is included. Fork this repository and enable the repo on [travis-ci.org](https://travis-ci.org/) to start running builds.  

## Add a star on GitHub

Does this sound helpful? Check it out and [add a star](https://github.com/justwheel/sphinx-docs-opinionated-quickstart/stargazers) at [justwheel/sphinx-docs-opinionated-quickstart](https://github.com/justwheel/sphinx-docs-opinionated-quickstart). The project is licensed under the [BSD 3-Clause License](https://github.com/justwheel/sphinx-docs-opinionated-quickstart/blob/master/LICENSE.txt); feel free to fork it and form your own opinions too.  

* * *

_[Photo](https://unsplash.com/photos/q7TGPrFIlIg) by_ [_Jānis Skribāns_](https://unsplash.com/photos/q7TGPrFIlIg?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) _on_ [_Unsplash_](https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)_._
