---
title: "How to push Fedora Badges"
date: 2016-07-08
categories: 
  - "fedora"
tags: 
  - "ansible"
  - "fedora-badges"
  - "fedora-infrastructure"
  - "fedora"
  - "fedora-planet"
images: ["/blog/2016/07/push-fedora-badges.png"]
---

Ever wondered what goes on behind the magic of [Fedora Badges](https://badges.fedoraproject.org/)? How does a badge go from being a design to an earn-able entity? This short but handy guide breaks down the entire process for you. This post is adapted from a [series of notes](https://meetbot.fedoraproject.org/fedora-meeting-3/2016-06-03/commops.2016-06-03-20.56.log.html#l-34) I took while watching Ralph Bean demo the procedure at [PyCon](https://fedoraproject.org/wiki/PyCon_2016). This guide is a supplement, not a replacement, for the official [Badges SOP](https://infrastructure.fedoraproject.org/infra/docs/badges.rst).

<!--more-->

## Badges Prerequisites

Before beginning to consider whether you are going to push a badge, you must first meet the following prerequisites.

1. Clone the [`badges` repository](https://git.fedorahosted.org/cgit/badges.git), where all badges live.
2. Be a sponsored member of the `sysadmin-badges` FAS group

## Taking care of art assets

Before publishing the badge, you will need to make sure all the art assets are in the right place for the ticket. This usually consists of a PNG and SVG, but can also include an STL file for 3D printing a badge design.

The following steps are a handy checklist of things you need to do for gathering all the art assets together.

1. Go to the ticket for the badge and pull both art asset types (PNG and SVG) into the `badges` repository. If there is a YAML rule file, pull that down as well.
2. Place both art assets (and YAML file, if applicable) into their appropriate folder. Make sure both files share the same name. It is preferred to name the files the name of the badge for easy indexing later on.
3. Double-check to make sure the image assets you pulled down are "good" - sometimes the images can be corrupted and this can cause problems later. Check if you can view both files.
4. Change directories into `bin/` and run the `export.sh` script. This will create an STL file for the badge and move it in the right place for you. Check the `README` file in `bin/` for more info about running the script.
5.  Add the files in git and commit. If you have push privileges, go ahead and push. If not, create a patch file and add it to the original badge ticket.

At this point, all the art assets will now be prepared and ready for deployment.

## Pushing out badges

Once you have committed the badge to the FedoraHosted repository, it doesn't mean the badge is "out there" yet. To do this, you will need to use an Ansible playbook for that purpose.

These steps will take you to the Batcave and have you push the badge out to the Badges front-end, [Tahrir](https://github.com/fedora-infra/tahrir).

1. Log into the `batcave` machine and find the [`push-badges.yml`](https://infrastructure.fedoraproject.org/cgit/ansible.git/tree/playbooks/manual/push-badges.yml) playbook. Execute it.
    1. Note that you will need to have proper privileges to execute and run the playbook. Sysadmins with privileges (`sysadmin-badges` FAS group) will be able to run the playbook to pull the changes from FedoraHosted to `batcave` - the changes then get synced to the `badges-web` server.
    2. If you are only a member of `sysadmin-badges` but not other groups, you can use the `rbac-playbook` tool to execute this specific playbook. For more information on [role-based-access-control playbooks](https://lists.fedoraproject.org/archives/list/infrastructure@lists.fedoraproject.org/thread/ZT73GIDEKL5WUQJWN4DD35KXGODLKW3S/), read the original announcement.
2. Wait for the playbook to finish. Once complete, check if the PNG file is publicly viewable on the Badges website.
    1. `https://badges.fedoraproject.org/pngs/{{ badge_name }}.png`

Now, the hard work is done. From this point, you will have to use the front-end of Tahrir to finish adding the badge.

## Adding badges from Tahrir

Once the art assets are on `badges-web`, you will be ready to make the badge. **But be warned**! Creating a badge is easy, but editing it is not! Make sure the information you are entering is right on the first go. Otherwise, fixing it will involve fixing the data with SQL statements.

1. Log into the admin interface on badges.fedoraproject.org.
2. Go to the "Add badge" section.
3. Enter in all the information as provided in the badge ticket. Make sure to include the right name, description, and location of the image file. Once you have double-checked and verified the information is correct, hit "_Create badge_".
    1. Tags are an important part of this process too. Compare to other similar badges when adding a new one, otherwise it may not be categorized correctly in the badges index.
    2. Some information is consistent across all badges, like the _Badge Criteria_ field. For this field, you should always put the link back to the original Badges Team ticket where the badge was proposed, designed, and discussed.
4. If the badge does not have an automatic rule for being awarded, you will need to grant authorizations for issuing the badge. You can do this at the bottom of the admin interface. Use the badge name and the @fedoraproject.org email for the person gaining privileges.

After pushing the badge out, do some last checks to make sure the badge pushed correctly. Make sure the page is viewable and double-check that it's categorized correctly in the [badge index](https://badges.fedoraproject.org/explore/badges). If everything looks right, you should be finished.

Congratulations, you just pushed your very own Fedora Badge!

* * *

_Image courtesy [Anna Dziubinska](https://unsplash.com/@annadziubinska) – originally posted to [Unsplash](https://unsplash.com/) as [Untitled](https://unsplash.com/photos/mVhd5QVlDWw)._
