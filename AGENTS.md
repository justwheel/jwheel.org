# AGENTS.md

Guidance for AI coding agents working in the `jwheel.org` repository.

## Project Overview

Personal website for Justin Wheeler (https://jwheel.org/), built with Hugo using the custom **Toph** theme.
Site content is licensed CC BY-NC-SA 4.0; theme is licensed MPL-2.0.

- **Hugo Extended**: Pinned to **0.167.0** locally and in CI.
- **Dart Sass**: 1.101.0 in CI.
- The theme requires minimum Hugo 0.166.0.

## Two-Repository Architecture

This project is split across two repositories:
- **Site repo** (this): content, site config, static/page assets.
- **Theme submodule** (`themes/toph/`): layouts, CSS, partials, JS (`justwheel/toph-hugo-theme`).
- **Agent working directory**: Always run commands from the site root (`/home/jwheel/git/web/jwheel.org`).
- Never `cd`.
- Run theme commands via `git -C themes/toph/ ...`.
- **User-facing commands**: Never include `-C` or `cd`.
- Precede theme commands with a one-line reminder (`Run this from themes/toph/:`) and present bare commands.

### The theme has its own AGENTS.md

`themes/toph/AGENTS.md` is checked out on disk and is **authoritative for everything inside the theme**: layouts, partials, CSS architecture, dark mode, image processing, accessibility, performance measurement, and the theme's own CI.
Read it before changing anything under `themes/toph/`, and do not restate its contents here.
This file covers what the theme's cannot know — site content, configuration, deployment, and the editorial rules specific to jwheel.org.

Two categories are **deliberately duplicated** across both files, because they are safety-critical and an agent may only ever read one: the git workflow and the GitHub write-consent protocol.
Keep them synchronized.
A disagreement between the two files is a bug to reconcile, not a precedence question, and the fix belongs in both.

## Common Developer Commands

```bash
# Local development server
hugo server

# Production build
hugo --minify

# Submodule initialization and updates
git submodule update --init
git submodule update --remote --rebase
```

## Content Architecture & Asset Pipeline

- `content/blog/YYYY/MM/slug.{md,adoc}`: Blog posts organized by year and month. Standalone files (not leaf bundles).
- `content/tweets/<tweet-id>/index.md`: Tweet archive page bundles with images. Not hidden from sitemap (SEO indexed). Embedded via `tweet-archive` shortcode.
- `content/projects/`, `content/footer/`: Structural categories. Front matter requires `hide_sitemap: true` and appropriate `categories`.
- `content/*.adoc`: Root pages (`_index`, `legal`, etc.).
`content/_index.*.adoc` files **must** declare `layout: biography` in front matter; omitting it causes Hugo to silently fall back to `_default/list.html` without warnings, rendering an unstyled list of regular pages.
- `assets/pages/`: Page-specific images processed by Hugo (hero photo, about profile, with `projects/` and `footer/` subdirectories). Note: `static/img/` is completely eliminated.
- `assets/content/`: Shared blog images.
- `assets/masks/`: Image filter masks (e.g. `oval-mask.png`).

### Durable Content Rules (NEVER BREAK)

- **URL Preservation**: File paths and names in `content/blog/` must **never** be changed under any circumstances.
The `/blog/YYYY/MM/slug/` structure matches legacy WordPress URLs for proxy redirection.
- **Decade Tags Required**: Every blog post must include a decade tag in front matter `tags`: `2010s` (2010–2019) or `2020s` (2020–present).
- **Post Excerpts**: Always use `.Plain | htmlUnescape | truncate 250` (never `.Summary`).
- **Image Captions**: Markdown uses title syntax `![alt](src "caption text")`.
URLs inside captions should be bare; Goldmark auto-links them.

## AsciiDoc Parity (Non-Negotiable)

AsciiDoc is a first-class content format.
Every feature built for Markdown must also work for AsciiDoc.
- **Detection**: Always use `.File.Ext == "adoc"`.
Never use `.Markup` (returns an object in Hugo 0.157+, failing string comparisons).
- **Hooks vs Post-Processing**: Asciidoctor bypasses Hugo render hooks, so the two formats reach the same HTML by different routes and both must be verified.
The mechanics are a theme concern — see "AsciiDoc" in `themes/toph/AGENTS.md`.
What matters here: content may be authored in either format, and a change verified only in Markdown is not verified.

## Hugo Template Conventions

Template work almost always belongs in the theme.
This repository holds only `layouts/shortcodes/`; everything else — `hero.html`, `head.html`, image processing, font-weight binding, dark mode — lives in `themes/toph/` and is documented under "Hugo template conventions" in `themes/toph/AGENTS.md`.
Consult that file rather than duplicating its rules here.

- **Global `site` Function**: Always use `site.Params`, `site.Title`, `site.BaseURL` — never `$.Site` or `.Site`.
This applies to site-level shortcodes as well as theme templates.

## Multilingual Content

The site is published in four languages, configured under `languages:` in `config.yaml`: English (`en`, default), Spanish (`es`), Arabic (`ar`, `direction: rtl`), and Hindi (`hi`).

- Translations are per-file suffixes, not separate trees: `content/projects/01-red-hat.{en,es,ar,hi}.md`.
- Not all content is translated.
Blog posts are English-only; projects and root pages carry the full set.
- Arabic is right-to-left.
Any layout or styling change must be checked in `ar` as well as `en`, because RTL is where asymmetric padding, margins, and float assumptions break.
- UI strings live in the theme's `i18n/` files, not in this repository.
A new user-visible string in a shortcode needs a key added to all four theme files, not a hardcoded English literal.

## Deployment

Built and deployed to GitHub Pages by `.github/workflows/hugo.yaml` on push to `main`.

- CI pins `HUGO_VERSION: 0.167.0` and `DART_SASS_VERSION: 1.101.0` to match local development.
Dart Sass is installed although the theme contains no Sass; this is deliberate and should not be "cleaned up".
- `--baseURL` is injected from the Pages configuration at build time; never hardcode it in `config.yaml`.
- **GitHub Pages serves `cache-control: max-age=600`** on every asset and exposes no way to change it.
Lighthouse will therefore always report a cache-lifetime finding, and it is not actionable without putting a CDN in front.
- Deployment is not instant.
After a push, confirm the Pages run succeeded and that production is serving the new build (check `age` and `last-modified`) before measuring anything against it.

## Theme Submodule

`themes/toph/` is pinned to a specific commit, and that pointer is part of this repository's history.

- Bump it in the **same commit** as the site changes that depend on it, so the two halves of a cross-repository change stay reviewable together.
A theme bump landing alone, divorced from the content change that motivated it, reads as an unexplained version churn.
- The theme's `theme.toml` declares `min_version = "0.166.0"`.
That is a support floor for downstream users and is deliberately lower than the pinned build version — do not raise it to match.

## Performance

Tracked in issue #24, which carries the running benchmark table.
Measurement methodology lives in `themes/toph/AGENTS.md` under "Performance"; the site-specific findings are:

- **The LCP element is a text paragraph, not the hero image.**
Verify it from `lcp-breakdown-insight` before scoping any work as an LCP improvement.
Two rounds of image optimization were spent on the opposite assumption.
- **Local `npx lighthouse` is canonical for the #24 table**, so rows stay comparable with the existing baselines and with the reproduce command recorded in the issue.
PageSpeed Insights is useful corroboration and belongs in comments, not table rows; its absolute numbers differ because it runs on Google's hardware.
- Analytics (`gtag`) drives Total Blocking Time and run-to-run variance, not LCP.
Do not conflate the two.

## Verification & State Checking

- **Prove State Before Asserting**: Always run the proving command first; the user explicitly accepts extra tool calls.
A negative grep proves pattern absence, not positive correctness.
Enumerate all surfaces before claiming exhaustiveness.

## Git Workflow & Conventions (CRITICAL)

- **Execution**: NEVER run `git commit`, `git push`, or `git merge` directly.
User executes these manually.
- **Staging**: Prefer directory/glob arguments over long explicit file lists.
Check `git status --porcelain` before staging to avoid capturing untracked in-progress drafts.
Never run `git reset` without permission (user stages manually to track work).
- **Commit Messages**: Format: `<gitmoji> <component>: <summary>`.
Body: Explain **WHY** (rationale, problem solved, alternatives considered), not WHAT or HOW (avoid diff narration).
Three to six sentences typical.
Follow the 50/72 rule: subject line ≤ 50 characters, body lines wrapped at ≤ 72 characters.
Wrap body lines **greedily** — pack each line with as many words as fit without reaching 73 characters, rather than breaking early for balance.
Wrap technical identifiers, file paths, layout names, and code entities in backticks (`` ` ``).
Backticks must never be split across line breaks (must open and close on the same line).
- **Trailer**: `Assisted-by: <model name> (<context window>)`.
Read the exact model from the current session environment before writing it.
Never copy a model name from this file, from earlier in the conversation, or from a previous session — the user may switch models mid-session, and any literal written here will be wrong for most agents that read it.
Do **not** cite Fedora policy in the commit message or documentation.
- **Sign-off**: Suggest `git commit --signoff` (never write `Signed-off-by` in text).
- **Drafting**: Draft commit messages to `/tmp/commit-<name>.txt` (unique filename, human-readable).
Present user command as a single unbroken line:
`git add <path> && git commit --edit --file=/tmp/commit-<name>.txt --gpg-sign --signoff`
- **Version Tags**: Tag messages use setext headings (underlined with `-`), never `##` (default `--cleanup=strip` removes `#`).
Draft to `/tmp/tag-<repo>-<version>.txt`, check `grep -c '^#'` is 0, tag with `--cleanup=verbatim --sign`.
Tag message files must end with a trailing newline: because `--cleanup=verbatim` does not normalize whitespace, a missing trailing newline causes Git to append the PGP signature block directly onto the last line of text, causing GPG verification to fail (`error: no signature found`).

## GitHub API Access (CRITICAL)

- **Explicit Consent**: Required before ANY mutating GitHub API call (POST, PATCH, PUT, DELETE: comments, PR creation, review submissions, labels, state changes).
- **Execution Protocol**:
1. Write payload to `/tmp/`.
2. Present payload/diff to user for review.
3. Present copy-pasteable `gh` command (e.g., `gh issue comment <n> --body-file=/tmp/...`).
4. User executes the command.
- **AI Disclosure**: Disclose AI assistance on GitHub issues/PRs as `"LLM-gen-AI"`.
Never name specific models or vendors in comments.

## Writing Conventions

- **One Sentence Per Line**: Use ventilated prose (one sentence per line) in Markdown (`.md`) and AsciiDoc (`.adoc`) files in the repository.
Do not wrap at fixed column widths.
Consecutive lines render as one paragraph.
(Does not apply to GitHub comments or tag messages).
- **Command Formatting**: Suggest bash commands with fully-expanded flag names (`--signoff`, `--file`, etc.).
