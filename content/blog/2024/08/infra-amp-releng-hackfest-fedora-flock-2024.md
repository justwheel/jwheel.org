---
title: "Infra & Releng Hackfest @ Fedora Flock 2024"
date: 2024-08-22
categories:
  - "fedora"
  - "red-hat"
tags:
  - "2020s"
  - "ai-assisted"
  - "conferences"
  - "events"
  - "fedora-commops"
  - "fedora-infrastructure"
  - "fedora"
  - "fedora-planet"
  - "flock"
  - "open-source-communities"
images: ["/blog/2024/08/community-operations-initiative.jpg"]
---

This blog post summarizes the discussions and action items from the Infrastructure and Release Engineering workshop held at Flock 2024 in Rochester, New York, USA.

This post is also an experiment in using AI generated summaries to provide useful, at-a-glance summaries of key Fedora topics. Parts of this content may display inaccurate info, including about people, so double-check with the source material.

Source material: [discussion.fedoraproject.org/t/report-from-infra-and-releng-hackfest-at-flock2024/128743](https://discussion.fedoraproject.org/t/report-from-infra-and-releng-hackfest-at-flock2024/128743)

<!--more-->

## **Key Topics**

- **Standards for OpenShift app deployments:** There's a need for consistency in deploying applications to OpenShift. The group discussed creating best practices documentation and addressing deployment methods across various applications.

- **Infra SIG packages:** The workshop reviewed the "infra-sig" package group and identified a need to:
    - Find owners for orphaned packages.

    - Onboard new maintainers using Packit.

    - Remove inactive members from the group.

- **Release engineering packages:** The group agreed to add a list of release engineering packages to the infra-sig for better management.

- **Proxy network:** Discussion about potentially migrating the proxy network from httpd to nginx or gunicorn remained inconclusive. Further discussion is needed.

- **AWS management with Ansible:** The feasibility of managing AWS infrastructure with Ansible is uncertain due to limitations with the main Amazon account.

- **Onboarding improvements:** The group discussed ways to improve the onboarding process for new contributors, including documentation updates, marketing efforts, and "Hello" days after each release.

- **OpenShift apps deployment info:** A tutorial on deploying applications to OpenShift was presented and will be incorporated into the documentation.

- **Future considerations:** The group discussed upcoming challenges like GitLab Forge migration, Bugzilla migration, and a new Matrix server.

- **Retiring wiki pages:** The group needs to decide where to migrate user-facing documentation from the wiki. Additionally, someone needs to review and archive/migrate/delete existing wiki pages in the "[Category:Infrastructure](https://fedoraproject.org/wiki/Category:Infrastructure)" section.

- **Datagrepper access for CommOps:** A solution was proposed to provide CommOps with access to community metrics data by setting up a separate database in AWS RDS and populating it with recent Datagrepper dumps.

- **ARA in infrastructure:** While AWX deployment offers similar reporting features, setting up ARA remains an option if someone has the time and interest.

- **AWX deployment:** Roadblocks related to the public/private Ansible repository structure were identified. A proof of concept using AWX will be pursued to determine if repository restructuring is necessary.

- **Zabbix integration:** The group discussed moving forward with Zabbix to replace Nagios. Action items include setting up a bot channel for alerts, adjusting alerts based on comparison with Nagios, and considering an upgrade to the next LTS version.

## **Action Items**

- Create comments in each application playbook explaining its deployment method.

- Move all apps using deploymentconfig to deployment with OpenShift 4.16.

- Look into deploying Advanced Cluster Security (ACS) for improved visibility into container images.

- Create a "best practices" guide for deploying applications in OpenShift clusters.

- Find individuals interested in helping with orphaned packages and onboarding new maintainers for the infra-sig package group.

- Create a list of release engineering packages for inclusion in the infra-sig.

- Continue discussions on migrating the proxy network and managing AWS infrastructure with Ansible.

- Update onboarding documentation, implement marketing strategies for attracting contributors, and organize "Hello" days for new members.

- Archive/migrate/delete wiki pages in the "Category:Infrastructure" section.

- Work on tickets to set up a separate database for CommOps Datagrepper access.

- Investigate the feasibility of setting up ARA in infrastructure.

- Stand up a proof of concept for AWX deployment and discuss potential repository restructuring.

- Set up a Zabbix bot channel for alerts, adjust alerts based on comparisons with Nagios, and consider upgrading to the next LTS version.

**Overall, the workshop was a success, with productive discussions and a clear list of action items to move forward.**

**Note:** The workshop lacked remote participation due to network limitations. The source material encourages readers to express interest in helping with the action items.
