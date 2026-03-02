---
title: "HPC workloads in containers: Comparison of container run-times"
date: 2019-08-20
categories: 
  - "foss"
  - "tech"
tags: 
  - "cluster-computing"
  - "containers"
  - "fedora-planet"
  - "high-performance-computing-hpc"
  - "linux"
  - "open-source"
  - "open-source-communities"
  - "research-and-learning"
coverImage: "hpc-workloads-containers.jpg"
---

Recently, I worked on an interesting project to evaluate different container run-times for high-performance computing (HPC) clusters. HPC clusters are what we once knew as [supercomputers](https://en.wikipedia.org/wiki/Supercomputer). Today, instead of giant mainframes, they are hundreds, thousands, or tens of thousands of [massively parallel](https://en.wikipedia.org/wiki/Massively_parallel) systems. Since performance is critical, virtualization with tools like virtual machines or Docker containers was not realistic. The overhead was too much compared to bare metal.

However, the times are a-changing! [Containers](https://blog.justinwflory.com/tag/containers/) are entering as real players in the HPC space. Previously, containers were brushed off as incompatible with most HPC workflows. Now, several open source projects are emerging with unique approaches to enabling containers for HPC workloads. This blog post evaluates four container run-times in an HPC context, as they stand in July 2019:

- Charliecloud
- Shifter
- Singularity
- Podman

<!--more-->

## Research requirements

My research focused around a specific set of requirements. To receive a favorable review, a container run-time needed to meet three basic requirements:

- Support CentOS/RHEL 7.5+
- Compatibility with [Univa GridEngine](https://en.wikipedia.org/wiki/Univa_Grid_Engine)
- Support for very large numbers of users

Obviously there are security concerns with the third requirement. This is one reason containers have not made a strong showing in the HPC world yet. With the Docker security model, root access is a requirement to build and run containers. In a production HPC environment where users do not trust other users, this is a hard blocker.

Other HPC environments may differ. If you are an HPC administrator and also considering containers in your environment, consider my requirements. My research was exclusively framed through these three requirements.

## Charliecloud

[Charliecloud](https://github.com/hpc/charliecloud) is an open source project based on a user-defined software stack (UDSS). Like most container implementations, it uses Linux user namespaces to run unprivileged containers. It is designed to be as minimal and lightweight as possible, to the point of not adding features that could conflict with any specific use cases. This can be a positive or a negative, depending on how complex your environment is.

However, I abandoned my research on Charliecloud early on after reading this [PLOS research paper](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0177459):

> The software makes use of kernel namespaces that are not deemed stable by multiple prominent distributions of Linux (e.g. **no versions of Red Hat Enterprise Linux or compatibles support it**), and may not be included in these distributions for the foreseeable future.
> 
> The software is emphasized for its simplicity and being less than 500 lines of code, and this is an indication of having a lack of user-driven features. The containers are not truly portable because they must be extracted from Docker and configured by an external C executable before running, and even after this step, all file ownership and permissions are dependent on the user running the workflow.
> 
> [Singularity: Scientific containers for mobility of compute](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0177459), May 2017 (Gregory M. Kurtzer, Vanessa Sochat, Michael W. Bauer)

However, it is worth noting this paper was written in support of Singularity. It was also written by the Singularity project lead and others from the Singularity open source community. If you are conducting your own independent research, consider looking closer at Charliecloud, since at the time of writing it is still actively developed. The research paper was written in May 2017.

_Edit_: This situation already changed and Charliecloud is probably worth a deeper look:

https://twitter.com/SingularityApp/status/1163846727700344834

## Shifter

[Shifter](https://github.com/NERSC/shifter) is another container run-time implementation focused on HPC users. At time of writing, it is almost exclusively backed by the [National Energy Research Scientific Computing Center](https://www.nersc.gov/) and [Cray](https://www.cray.com/). Most documented use cases use [Slurm](https://slurm.schedmd.com/) for cluster management / job scheduling. Instead of a Docker/OCI format, it uses its own Shifter-specific format, but this is reverse-compatible with Docker container images. It requires hosting a registry service and a **Shifter Image Gateway**.

The Shifter Image Gateway is a REST interface implemented with [Python Flask](https://palletsprojects.com/p/flask/). It pulls images from the registry service and converts them to the Shifter image format. MPI integration is supported but its implementation is MPICH-centric.

The downside to Shifter is lack of community. There are not many other organizations other than NERSC and Cray that appear to support Shifter. [Documentation exists](https://github.com/NERSC/shifter/tree/master/doc), but at writing time (July 2019), the last significant contribution was April 2018. Some bugs and feature requests are triaged, but there is not much of a maintainer presence in these issues. Most follow-up discussion to new issues are from a handful of outside contributors without commit access.

Additionally, there are several signs of stagnant development, such as [NERSC/shifter#172](https://github.com/NERSC/shifter/pull/172) to add better MPI integration. However, the PR stalled out since it was first opened in April 2017. Furthermore, there is a high bus factor: most contributions and pull requests come from the same two developers, indicating low engagement from the wider HPC community. Code is [regularly tested](https://travis-ci.org/NERSC/shifter), but integration tests [only exist for Slurm](https://travis-ci.org/NERSC/shifter/jobs/541868408#L880-L969). For more details, check out the [GitHub project pulse](https://github.com/NERSC/shifter/pulse).

A detail worth noting is Shifter was one of the first real container run-times for HPC. A former Shifter collaborator branched off from Shifter to start Singularity (and eventually, a for-profit company to support it, Sylabs). It invites room for personal biases when evaluating Shifter and Singularity, specifically if you are not a newcomer in the HPC community.

## Singularity

[Singularity](https://sylabs.io/singularity/) is the third and last HPC-specific player in the container run-time world. The vendor is [Sylabs Inc](https://sylabs.io/about-us/mission). There are a few different factors that make Singularity interesting, and in my opinion, the most promising HPC container implementation.

### General overview

Singularity v3.x.x is written almost entirely in Golang. It supports two image formats: Docker/OCI and Singularity's native Single Image Format (SIF). As of September 2018, there are an estimated 25,000+ systems running Singularity, including users like [TACC](https://www.tacc.utexas.edu/), [San Diego Supercomputer Center](https://www.sdsc.edu/), and [Oak Ridge National Laboratory](https://www.ornl.gov/). Additionally, Univa [announced a partnership](http://www.univa.com/about/news/press_2018/07312018.php) with Sylabs in July 2018 to bring Singularity workflows to Univa GridEngine.

Sylabs offers Singularity (free and open source) and SingularityPRO (paid and proprietary). The commercial version comes with a support contract and long-term support for some releases (among other things).

Admin/root access is not required to run Singularity containers and it requires no additional configuration to do this out of the box. Containers are run under the Linux user ID that launches them (see _[Security and privilege escalation](https://sylabs.io/guides/2.6/user-guide/introduction.html#security-and-privilege-escalation)_).

At a quick glance, Sylabs developers appear to be [actively engaged](https://github.com/sylabs) in the Kubernetes development community, particularly around Red Hat technology. They also seem to keep their promises: in early 2018, blog posts show ambitious feature promises for the then-upcoming v3.0.0 release at the end of the year. Near the end of 2018, the release was delivered on-time with most/all of the promised functionality.

### Image formats

The Singularity Image Format (SIF) is a single-image format (i.e. no layers involved). This was a design decision specifically for HPC workloads. SIFs are treated like a binary executable by a Linux user. Additionally, it is possible to create SIFs using the [Definition File](https://sylabs.io/guides/3.3/user-guide/definition_files.html#sections) spec.

However, Singularity is also compatible with Docker/OCI images and OCI is given [active development focus](https://github.com/sylabs/singularity/labels/OCI) by upstream Singularity. Docker/OCI images are converted on-the-fly to a SIF. Docker/OCI images can be used locally or pulled from a remote registry like Docker Hub or [Quay](https://www.openshift.com/products/quay). To the user, if using a Docker/OCI image, the conversion is seamless and does not require additional configuration to use.

See [this Sylabs blog post](https://web.archive.org/web/20190726223349/https://archive.sylabs.io/2018/03/sif-containing-your-containers/) for a deeper dive on how SIFs were designed.

### Flexible configuration

Singularity (uniquely?) offers advanced configuration options for HPC administrators. Some highlights are detailed here:

- **Controlling bind mounts**:
    - `mount dev = minimal`: Only binds `null`, `zero`, `random`, `urandom`, and `shm` into container
    - `mount home = {yes,no}`, `mount tmp = {yes,no}`: Choose to enable or disable these bind mounts globally
    - `bind path = ""`: Bind specific paths into containers by default
    - `user bind control = {yes,no}`: Allow users to include their own bind mount paths or limit it to an admin-approved set of paths (above)
- **Controlling containers**:
    - `limit container paths =`: Possible to limit SIFs provided at a specific path and nowhere else

### HPC community engagement

These notes only apply to Singularity free, not the proprietary SingularityPRO product.

The signals from their open source community engagement are positive and strong. They appear authentic and genuine to an [open source commitment](https://sylabs.io/resources/community) (i.e. not [open-core business model](https://blogs.gnome.org/bolsh/2010/07/19/rotten-to-the-open-core/)). This is demonstrated in a few ways:

First, they have [thorough user documentation](https://sylabs.io/guides/3.3/user-guide/), intended for end-users in HPC environments using Singularity. They have a less thorough but still useful [admin documentation](https://sylabs.io/guides/3.2/admin-guide/).

Second, all issues are triaged quickly and get feedback from core developers or outside contributors at a consistent pace. Pull requests don't stagnate either: the oldest PR is less than six months old.

Third, code is regularly tested ([1](https://travis-ci.org/sylabs/singularity), [2](https://circleci.com/gh/sylabs/singularity/tree/master)). The code generally follows [best practices](https://goreportcard.com/report/github.com/sylabs/singularity) (i.e. it is not atrocious to work with).

Fourth, there are also a handful of active contributors (both developers and in the community support channels) who come from outside of Sylabs, which indicates more engagement by a wider audience of people.

For more statistics, check out the [GitHub project pulse](https://github.com/sylabs/singularity/pulse).

## Podman

_tl;dr_: Podman is an underdog that shows promise, but likely needs another one or two years of time for most HPC use cases.

[Podman](https://podman.io/) is a container run-time developed by Red Hat. Its primary goal is to be a drop-in replacement for Docker. While it is not explicitly designed with HPC use cases in mind, it intends to be a lightweight "wrapper" to run containers without the overhead of the full Docker daemon. Furthermore, the Podman development team is recently looking into better support for HPC use cases.

Podman is currently lacking for a HPC use case for some of these reasons:

1. [Missing support for parallel filesystems](https://github.com/containers/libpod/issues/3478) (e.g. [IBM Spectrum Scale](https://en.wikipedia.org/wiki/IBM_Spectrum_Scale))
2. Rootless Podman was designed to [use kernel user namespaces](https://github.com/containers/libpod/blob/master/rootless.md) which is [not compatible with most parallel filesystems](https://github.com/containers/libpod/issues/3561) (might change in a year or two)
3. [Not yet possible to set system site policy defaults](https://github.com/containers/libpod/issues/3587)
4. [Pulling Docker/OCI images requires multiple subuids/subgids](https://github.com/containers/libpod/issues/3589) (might change in a year or two)

Where Podman does shine is providing a way to run **_and_** build containers without root access or `setuid`.

The same challenges and problems required for Podman to run OCI containers in an HPC environment are the same problems faced by Singularity to build SIF images without root in the HPC environment: **mapping UIDs to subuids/subgids on the compute nodes**. More interestingly, **[Buildah](https://buildah.io/)** offers a promising way to enable users to build container images as Docker/OCI images all without root. It is plausible to use Buildah as the container image delivery mechanism and swap out the container run-time implementation (Podman vs. Singularity) depending on specific needs and requirements.

## What do you think?

I hope other folks out there in the HPC world find this preliminary research useful. Do you agree or disagree with any parts of this write-up? Is something out-of-date? Drop a comment down below.
