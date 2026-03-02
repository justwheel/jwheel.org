---
title: "Keep your open source project organized with GitHub project boards"
date: 2018-06-05
categories: 
  - "foss"
  - "tech"
  - "unicef"
tags: 
  - "business-process-management"
  - "communication"
  - "community"
  - "community-management"
  - "fedora-planet"
  - "github"
  - "kanban"
  - "unicef"
  - "unicef-internship-2018"
---

[_This article was originally published on Opensource.com._](https://opensource.com/article/18/4/keep-your-project-organized-git-repo)

* * *

Managing an open source project is challenging work. The challenge grows as a project grows. Eventually, a project may need to meet different requirements and span across multiple repositories. These problems aren't technical, but are important to solve to scale a technical project. [Business process management](https://en.wikipedia.org/wiki/Business_process_management) methodologies such as agile and [kanban](https://en.wikipedia.org/wiki/Kanban_\(development\)) bring a method to the madness. Developers and managers can make realistic decisions for estimating deadlines and team bandwidth with organized development focus.

At the [UNICEF Office of Innovation](http://unicefstories.org/about/), we use GitHub projects boards to organize development on the MagicBox project. [MagicBox](http://unicefstories.org/magicbox/) is a full-stack application to serve and visualize data for decision-making in humanitarian crises and emergencies. The project spans multiple GitHub repositories and works with multiple developers. With GitHub project boards, we organized our work across multiple repositories to better understand development focus and team bandwidth.

Here's three tips from the UNICEF Office of Innovation on how to organize your open source GitHub projects with the built-in project boards on GitHub.

<!--more-->

## Bring development discussion to issues and pull requests

Transparency is a critical part of an open source community. When mapping out new features or milestones for a project, the community needs to see and understand a decision or why a specific direction was chosen. Filing new GitHub issues for features and milestones is an easy way for someone to follow the project direction. GitHub issues and pull requests are the cards (or building blocks) of project boards. To be successful with GitHub project boards, you need to use issues and pull requests.

\[caption id="attachment\_979" align="alignright" width="978"\][![GitHub issues for the front-end application of MagicBox, magicbox-maps](https://blog.justinwflory.com/wp-content/uploads/2018/03/Screenshot-2018-3-13-Fix-similar-code-issue-in-react-app-src-components-WebglLayer-jsx-·-Issue-62-·-unicef-magicbox-maps.png)](https://blog.justinwflory.com/wp-content/uploads/2018/03/Screenshot-2018-3-13-Fix-similar-code-issue-in-react-app-src-components-WebglLayer-jsx-·-Issue-62-·-unicef-magicbox-maps.png) GitHub issues for the front-end application of MagicBox, magicbox-maps\[/caption\]

The UNICEF MagicBox team uses GitHub issues to track on-going development milestones and other tasks to revisit in the future. The team files new GitHub issues for development goals, feature requests, or bugs. These goals or features may come from external stakeholders or from the community. We use the issues as a place for discussion on those tasks too. This makes it easy to cross-reference in the future and visualize upcoming work on one of our projects.

Once you begin using GitHub issues and pull requests as a way of discussing and using your project, organizing with project boards becomes easier.

## Set up kanban-style project boards

GitHub issues and pull requests are the first step. After you begin using them, it may become harder to visualize what work is in progress and what work is yet to begin. [GitHub's project boards](https://help.github.com/articles/about-project-boards/) give you a platform to visualize and organize cards into different columns.

There are two types of project boards available:

- **Repository**: Boards for use in a single repository
- **Organization**: Boards for use in a GitHub organization across multiple repositories (but private to organization members)

The choice you make depends on the structure and size of your projects. For the UNICEF MagicBox team, we use boards for development and documentation at the organization level, and then repository-specific boards for focused work (like our [community management board](https://github.com/unicef/magicbox/projects/3?fullscreen=true)).

#### Creating your first board

Project boards are found on your GitHub organization page or on a specific repository. You will see the _Projects_ tab in the same row as _Issues_ and _Pull requests_. From the page, you'll see a green button to create a new project.

There, you can set a name and description for the project. You can also choose from templates to set up basic columns and sorting for your board. As of writing, the only options are for [kanban-style boards](https://en.wikipedia.org/wiki/Kanban_\(development\)).

\[caption id="attachment\_981" align="aligncenter" width="659"\][![Create a new GitHub project board for your open source project](https://blog.justinwflory.com/wp-content/uploads/2018/03/Screenshot-2018-3-13-unicef-magicbox-maps.png)](https://blog.justinwflory.com/wp-content/uploads/2018/03/Screenshot-2018-3-13-unicef-magicbox-maps.png) Create a new project board\[/caption\]

After creating the project board, you can make adjustments to the project board as needed. You can create new columns, [set up automation](https://help.github.com/articles/about-automation-for-project-boards/), and add pre-existing GitHub issues and pull requests to the project board.

Now, you may notice new options for the metadata in each GitHub issue and pull request. Inside of an issue or PR, you can add it to a project board. If you use automation, it will automatically enter a column you configured.

## Build them into your workflow

After you set up a project board and populate them with issues and pull requests, you need to integrate them into your workflow. Project boards are effective only when actively used. With the UNICEF MagicBox team, we use the project boards as a way to track our progress as a team, update external stakeholders on development, and estimate team bandwidth for reaching our milestones.

If you are an open source project and community, consider using the project boards for development-focused meetings. Additionally, it helps to remind yourself and other core contributors to spend five minutes each day updating progress as needed. If you're at a company using GitHub to do open source work, consider using project boards as a way to update other team members and encourage participation inside of GitHub issues and pull requests.

Once you begin using the project board, yours may look like this!

\[caption id="attachment\_980" align="aligncenter" width="788"\][![Development progress board for all UNICEF MagicBox repositories in organization-wide GitHub project boards](https://blog.justinwflory.com/wp-content/uploads/2018/03/Screenshot-2018-3-13-Build-software-better-together-1024x502.png)](https://blog.justinwflory.com/wp-content/uploads/2018/03/Screenshot-2018-3-13-Build-software-better-together.png) Development progress board for all UNICEF MagicBox repositories in an organization-wide GitHub project board\[/caption\]

## Open alternatives

GitHub project boards require your project to be on GitHub to take advantage of this functionality. However, there are other open source alternatives available. You can use tools to replicate the same workflow explained above. [GitLab Issue Boards](https://about.gitlab.com/features/issueboard/) and [Taiga](https://taiga.io/) are good alternatives that offer similar functionality.

## Go forth and organize!

Now, you can bring a method to the madness for organizing your open source project. These three tips for using GitHub project boards encourage transparency in your open source project and make it easier to track progress and milestones in the open.

Do you use GitHub project boards for your open source project? Have any tips for success that aren't mentioned in the article? Leave a comment below to share how you make sense of your open source projects.
