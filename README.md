[jwheel.org](https://jwheel.org)
================================

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC_BY--NC--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![Deploy Hugo site to GitHub Pages](https://github.com/justwheel/jwheel.org/actions/workflows/hugo.yaml/badge.svg)](https://github.com/justwheel/jwheel.org/actions/workflows/hugo.yaml)

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

- [Hugo Extended](https://gohugo.io/installation/) 0.158.0 or later
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

Content in this repository is licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-nc-sa/4.0/) (CC BY-NC-SA 4.0) license.

Under CC BY-NC-SA 4.0:

- **Attribution** — You must give appropriate credit, provide a link to the license, and indicate if changes were made.
- **NonCommercial** — You may not use the material for commercial purposes.
- **ShareAlike** — If you remix, transform, or build upon the material, you must distribute your contributions under the same license.

The [Toph theme](https://github.com/justwheel/toph-hugo-theme) is licensed separately under [MPL-2.0](https://www.mozilla.org/en-US/MPL/2.0/).
