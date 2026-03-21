[jwheel.org](https://jwheel.org)
================================

[![Deploy Hugo site to GitHub Pages](https://github.com/justwheel/jwheel.org/actions/workflows/hugo.yaml/badge.svg)](https://github.com/justwheel/jwheel.org/actions/workflows/hugo.yaml)
[![License: MPL 2.0](https://img.shields.io/badge/License-MPL_2.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)

Personal website, blog, and project portfolio for Justin Wheeler.


## Overview

This repository contains the content and configuration for [jwheel.org](https://jwheel.org).
It is built with [Hugo](https://gohugo.io), a static site generator, using the custom [Toph](https://github.com/justwheel/toph-hugo-theme) theme.
The site includes a personal biography, project profiles, and a blog migrated from WordPress.
This site, in one form or another, has existed since 2013 or 2014.


## Theme

The site uses the **Toph** Hugo theme, included as a Git submodule at `themes/toph/`.
The theme is developed in a separate repository:

- **Source:** https://github.com/justwheel/toph-hugo-theme
- **Example site:** https://justwheel.github.io/toph-hugo-theme/
- **License:** [MPL-2.0](https://www.mozilla.org/en-US/MPL/2.0/)


## Build & Development

### Prerequisites

- [Hugo Extended](https://gohugo.io/installation/) 0.157.0 or later
- [Asciidoctor](https://asciidoctor.org/) (for AsciiDoc content)
- Git (for submodule management)

### Getting started

```bash
# Clone the repository with the theme submodule
git clone --recurse-submodules https://github.com/justwheel/jwheel.org.git

# If the theme submodule is empty, initialize it
git submodule update --init

# Start the local development server
hugo server

# Build for production
hugo --minify
```

### Updating the theme

```bash
git submodule update --remote --rebase
```


## Translations

The site supports 4 languages: English (default), Spanish, Arabic (RTL), and Hindi.
To add a translation for a content page, create a new file with the language code suffix:

- English (default): `my-page.en.md` or `my-page.md`
- Spanish: `my-page.es.md`
- Arabic: `my-page.ar.md`
- Hindi: `my-page.hi.md`

For AsciiDoc content, use the `.adoc` extension instead of `.md` (e.g., `_index.ar.adoc`).

Translation files share the same base filename and directory as the original.
Hugo automatically links them together and displays language switcher navigation.


## Legal

Licensed under the [Mozilla Public License 2.0](https://www.mozilla.org/en-US/MPL/2.0/) (MPL-2.0) or any later version published by the Mozilla Foundation.

Under the MPL-2.0:

- You are free to use, modify, and distribute this code.
- Modified files must be released under the same MPL-2.0 license.
- You may combine MPL-licensed code with code under other licenses (including proprietary) in a larger work, as long as MPL-licensed files remain under MPL-2.0.
- The license applies to the source code (templates, CSS, configuration). Blog post content and personal information are not licensed for redistribution.
