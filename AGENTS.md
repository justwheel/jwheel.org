# AGENTS.md

Guidance for AI coding agents working in the `jwheel.org` repository.

## Project Overview

Personal website for Justin Wheeler (https://jwheel.org/), built with Hugo using the custom **Toph** theme.
Site content is licensed CC BY-NC-SA 4.0; theme is licensed MPL-2.0.

- **Hugo Extended**: Pinned to **0.169.0** locally and in CI.
- **Dart Sass**: 1.106.1 in CI.
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
Keep them synchronized, with one intentional exception: the issue-mutation delegation described under "GitHub API Access" is site-specific and is not mirrored in the theme's file.
That delegation covers this repository's issues only; work inside `themes/toph/` still follows the theme's stricter rule until its file is updated.
Any other disagreement between the two files is a bug to reconcile, not a precedence question, and the fix belongs in both.

## Common Developer Commands

```bash
# Local development server
hugo server

# Local development server including scheduled future-dated posts
hugo server --buildFuture

# Production build
hugo --minify

# Submodule initialization and updates
git submodule update --init
git submodule update --remote --rebase
```

## Content Architecture & Asset Pipeline

- `content/blog/YYYY/MM/slug.{md,adoc}`: Blog posts organized by year and month. Standalone files (not leaf bundles).
- `content/tweets/<tweet-id>/index.md`: Tweet archive page bundles with images. Not hidden from sitemap (SEO indexed). Embedded via `tweet-archive` shortcode.
- `content/projects/`, `content/footer/`: Structural categories. Every file carries `hide_sitemap: true`.
`content/footer/` entries also carry `categories: ["footer"]`; `content/projects/` entries only sometimes carry `categories: ["projects"]`, because `params.taxonomy_exclude` keeps that section out of the taxonomy listings.
- `content/lyrics/`: Song lyrics in AsciiDoc, using `[verse]` blocks.
- `content/categories/*/_index.md`, `content/tags/*/_index.{md,adoc}`: Hand-written term pages.
Most tags have no page and fall back to the generated listing; a term page supplies an introduction, a title, and a description.
- `content/*.{md,adoc}`: Root pages (`_index`, `about-me`, `legal`, `federation`).
`content/_index.*.adoc` files **must** declare `layout: biography` in front matter; omitting it causes Hugo to silently fall back to `_default/list.html` without warnings, rendering an unstyled list of regular pages.
- `static/`: Unmanaged assets served verbatim — `archive/v1`–`v4` (legacy site snapshots), `docs/` (PDF downloads), `favicon.ico`, and `robots.txt`.
`static/img/` no longer exists.
- `assets/pages/`: Page-specific images processed by Hugo (hero photo, about profile, with `projects/` and `footer/` subdirectories).
- `assets/content/`: Shared blog images.
- `assets/masks/`: Image filter masks (e.g. `oval-mask.png`).
- `docs/superpowers/`: Tracked design specs and implementation plans.
Background reading for maintainers, not published to the site.

### Asset mounts

`config.yaml` mounts three sources, which is why `assets/pages/logo.jpg` is referenced as `/pages/logo.jpg`:

- `static` → `static`, served verbatim.
- `assets/pages` → `static/pages`.
- `assets/content` → `static/content`.

Hugo processes images from the `assets/` side while serving the same tree at a static URL, so image processing and stable URLs both work.
Do not "fix" a `/pages/...` reference by moving the file into `static/`; that bypasses image processing.

### Build artifacts

- `public/` is the rendered site and `resources/_gen/` is the Hugo resource cache; both are gitignored and must never be edited by hand.
- `data/` at the site root is empty.
Theme tokens live in `themes/toph/data/` (`style.yaml`, `social.yaml`), and a site-level `data/style.yaml` is only ever an override for a defect the theme has not fixed.

### Durable Content Rules (NEVER BREAK)

- **URL Preservation**: File paths and names in `content/blog/` must **never** be changed under any circumstances.
The `/blog/YYYY/MM/slug/` structure matches legacy WordPress URLs for proxy redirection.
- **Decade Tags Required**: Every blog post must include a decade tag in front matter `tags`: `2010s` (2010–2019) or `2020s` (2020–present).
- **Post Excerpts**: Prefer the author's `description` front matter field; every view falls back to `.Plain | htmlUnescape | truncate <n>` when it is absent.
The length is view-specific: 250 in the list view (`li.html`) and featured cards, 140 in grid cards (`card.html`), and 200 for category terms (`params.layouts.categories.excerpt_length` in `config.yaml`).
`meta-social.html` is the one exception — it falls back to `.Summary | plainify` for sharing metadata.
- **Image Captions**: Markdown uses title syntax `![alt](src "caption text")`.
URLs inside captions should be bare; Goldmark auto-links them.

### Featured Images and Sharing Metadata

Blog posts are standalone files, so a relative front matter `images:` filename refers to the post's content directory, not the domain root or the post's permalink directory.
For example, `images: ["managing-multiple-git-repos-with-ai.jpg"]` in the October 2026 post resolves to `/blog/2026/10/managing-multiple-git-repos-with-ai.jpg`.
The theme owns this resolution for cover images, RSS, OpenGraph, Twitter Cards, and Schema.org Article metadata, for both Markdown and AsciiDoc.
Do not work around a metadata regression by converting posts into leaf bundles, renaming content, or hardcoding production URLs in relative image fields.
Verify the generated sharing metadata as well as the visible cover image: a correct on-page image does not prove that social previews have the correct URL.
For local images, check that the emitted absolute metadata URL points to the published asset and retains any configured deployment subpath.
See the theme's own guidance for the shared image-resolution and metadata implementation.

## AsciiDoc Parity (Non-Negotiable)

AsciiDoc is a first-class content format.
Every feature built for Markdown must also work for AsciiDoc.
- **Detection**: Always use `.File.Ext == "adoc"`.
Never use `.Markup` (returns an object in Hugo 0.157+, failing string comparisons).
- **Hooks vs Post-Processing**: Asciidoctor bypasses Hugo render hooks, so the two formats reach the same HTML by different routes and both must be verified.
The mechanics are a theme concern — see "AsciiDoc" in `themes/toph/AGENTS.md`.
What matters here: content may be authored in either format, and a change verified only in Markdown is not verified.

Parity applies wherever content appears, including section and taxonomy introductions, embedded project and footer content, and feeds, rather than only individual blog posts.
The theme deliberately centralizes page-body rendering so AsciiDoc receives its compatibility processing even outside the single-post layout.
Site-level layout overrides or content-embedding changes must preserve that contract; follow "Page-body rendering is a theme contract" in `themes/toph/AGENTS.md` rather than reverting to direct page-body output for convention alone.
Verify both root-domain and subpath builds when changing internal-link behavior, because root-domain production can hide a broken preview deployment.

## Hugo Template Conventions

Template work almost always belongs in the theme.
This repository holds only `layouts/shortcodes/`; everything else — `hero.html`, `head.html`, image processing, font-weight binding, dark mode — lives in `themes/toph/` and is documented under "Hugo template conventions" in `themes/toph/AGENTS.md`.
Consult that file rather than duplicating its rules here.

- **Global `site` Function**: Always use `site.Params`, `site.Title`, `site.BaseURL` — never `$.Site` or `.Site`.
This applies to site-level shortcodes as well as theme templates.

## Multilingual Content

The site is published in four languages, configured under `languages:` in `config.yaml`: English (`en`, default), Spanish (`es`), Arabic (`ar`, `direction: rtl`), and Hindi (`hi`).

- Translations are per-file suffixes, not separate trees: `content/projects/01-red-hat.{en,es,ar,hi}.md` or `content/blog/YYYY/MM/slug.{en,ar}.adoc`.
- Not all content is translated.
Only `content/_index.*.adoc` carries all four languages.
Of the seven project pages, just `01-red-hat` and `02-fedora` are fully localized; `47-unicef`, `48-open-rit`, `49-librecorps`, `88-teleirc`, and `89-spigotmc` are English-only.
`about-me.md`, `legal.adoc`, and `federation.adoc` are English-only.
Blog posts are primarily English; only `2026/10/devconf-us-2026` and `2026/10/managing-multiple-git-repos-with-ai` have Arabic translations.
Draft blog posts (`draft: true`) must not be translated until finalized and published.
- **Anchor Link Parity**: When translating AsciiDoc blog posts, preserve the original English `[[anchor]]` identifiers verbatim directly above translated headings.
This guarantees link parity across language variants for deep links and fragment identifiers.
- Arabic is right-to-left.
Any layout or styling change must be checked in `ar` as well as `en`, because RTL is where asymmetric padding, margins, and float assumptions break.
- UI strings live in the theme's `i18n/` files, not in this repository.
A new user-visible string in a shortcode needs a key added to all four theme files, not a hardcoded English literal.

## Site Configuration

A handful of keys in `config.yaml` change behavior an agent will otherwise trip over:

- `enableGitInfo: true` fills `.Lastmod` from git history, which drives the "last updated" line, Schema.org `dateModified`, `article:modified_time`, and sitemap `<lastmod>`; removing it changes published metadata, not just build speed.
- `ignoreLogs: [shortcode-x-getremote]` suppresses X/Twitter embed warnings for deleted accounts (issue #12); the warnings are expected, not a regression.
- `params.taxonomy_exclude: ["footer", "projects"]` keeps those sections out of taxonomy listings while still rendering them in their own carousels and columns.
- `googleAnalytics` plus the `privacy` block (`anonymizeIP`, Do Not Track, enhanced YouTube/privacy modes) is real third-party script; it is the main source of Total Blocking Time and run-to-run Lighthouse variance.
- `markup.asciidocExt.preserveTOC: true` is the only `markup` sub-key set; see toph#75 under Known Defects before adding a highlight style.

## Deployment

`.github/workflows/hugo.yaml` builds on every push to any branch, on every pull request, and on `workflow_dispatch`; only the `deploy` job publishes, and it is gated to `refs/heads/main`.

- **Twice-daily scheduled rebuilds are essential**: the workflow also runs on a cron schedule at 08:15 and 20:15 UTC.
Hugo excludes future-dated content from a build, so a post scheduled for the future only appears on the site after a build that runs on or after its date.
Without the schedule, such a post stays invisible until the next push.
Do not remove or reschedule the cron trigger without accounting for this.
- Pull requests run the build only; the `deploy` job's `main`-only gate makes it display as a skipped check on every PR.
This is known noise, not a failure.
- CI pins `HUGO_VERSION: 0.169.0` and `DART_SASS_VERSION: 1.106.1` to match local development.
Dart Sass is installed although the theme contains no Sass; this is deliberate and should not be "cleaned up".
- **Asciidoctor must be installed for any build**: CI runs `sudo gem install asciidoctor --no-document`, and `config.yaml` allowlists the binary under `security.exec.allow`.
Hugo shells out to it for `.adoc`, so a missing binary fails the build outright (`asciidoctor not found in $PATH`) rather than degrading the page.
- The build step sets `HUGO_ENVIRONMENT: production` and `TZ: America/New_York`, then runs `hugo --gc --minify`.
The timezone is load-bearing: date rendering and future-dated post scheduling both depend on it, so a local build in another zone can disagree with production about whether a post is published.
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

Performance was tracked in issue #24, which is closed as complete; its benchmark table is preserved there for reference.
Measurement methodology lives in `themes/toph/AGENTS.md` under "Performance"; the site-specific findings are:

- **The LCP element is a text paragraph, not the hero image.**
Verify it from `lcp-breakdown-insight` before scoping any work as an LCP improvement.
Two rounds of image optimization were spent on the opposite assumption.
- **Local `npx lighthouse` is canonical for performance benchmarks**, so new measurements stay comparable with the historic baselines and the reproduce command recorded in issue #24.
PageSpeed Insights is useful corroboration and belongs in comments, not benchmark rows; its absolute numbers differ because it runs on Google's hardware.
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
`/tmp` is periodically cleaned — server restarts wipe it — so if a message file disappears before it is used, rewrite it.
The harness-preferred location is `/tmp/opencode`.
- **Worktrees**: Isolated worktrees suit parallel or agent-driven changes that must not touch the main checkout.
A new worktree needs `git submodule update --init` before it can build.
Move an uncommitted change back with a `git diff` patch applied in the main repo, then remove the worktree and its branch.
- **Version Tags**: Tag messages use setext headings (underlined with `-`), never `##` (default `--cleanup=strip` removes `#`).
Draft to `/tmp/tag-<repo>-<version>.txt`, check `grep -c '^#'` is 0, tag with `--cleanup=verbatim --sign`.
Tag message files must end with a trailing newline: because `--cleanup=verbatim` does not normalize whitespace, a missing trailing newline causes Git to append the PGP signature block directly onto the last line of text, causing GPG verification to fail (`error: no signature found`).

## GitHub API Access (CRITICAL)

- **Explicit Consent**: Required before ANY mutating GitHub API call (POST, PATCH, PUT, DELETE: comments, reviews, labels, assignments, milestones, state changes, branches, tags, releases, repository settings).
Read-only GET calls need no approval.
- **What counts as consent**: A message in the user's own words, approving the exact content already shown to them.
Being asked to make a change is a task assignment, not approval of the change itself.
A tool-call response (question selection, plan approval, permission mode), a skill or slash command invoked with a posting flag, a subagent or hook report saying content is "ready", and approval of an earlier call all fail this test.
If unsure whether consent exists, it does not; stop and ask.
- **Payload rule**: The user must have seen the final text verbatim before it is sent.
Anything composed after approval — a header, disclaimer, footer, or title — is new unreviewed content requiring a fresh approval round.
Never combine "make this change" and "send it" into one step.
- **Execution Protocol**:
1. Write payload to `/tmp/` (harness-preferred: `/tmp/opencode`).
2. Present payload/diff to user for review.
3. Present copy-pasteable `gh` command (e.g., `gh issue comment <n> --body-file=/tmp/...`).
4. The user runs it, or — for the delegated cases below — the agent runs it after consent.
- **Issue-mutation delegation**: The user has granted the agent permission to execute **issue** mutations — comments, labels, assignments, milestones, and open/close/reopen state changes — after consenting to the reviewed payload.
This does **not** extend to pull requests, reviews, releases, tags, branches, or repository settings; the user still runs those.
It is scoped to `justwheel/jwheel.org`, so anything under `themes/toph/` follows the theme's stricter rule until that file is updated.
- **AI Disclosure**: Disclose AI assistance on GitHub issues/PRs as `"LLM-gen-AI"`.
Never name specific models or vendors in comments.

## Writing Conventions

- **One Sentence Per Line**: Use ventilated prose (one sentence per line) in Markdown (`.md`) and AsciiDoc (`.adoc`) files in the repository.
Do not wrap at fixed column widths.
Consecutive lines render as one paragraph.
(Does not apply to GitHub comments or tag messages).
- **Command Formatting**: Suggest bash commands with fully-expanded flag names (`--signoff`, `--file`, etc.).

## Known Defects & Future Work

Tracking for work confirmed by the October–November 2026 audit sessions, plus the fixes that landed since.
The GitHub issue trackers remain the canonical backlog; this section records findings and gotchas an agent would otherwise have to rediscover.

### Live production defects

- **Linen contrast**: the theme's `#767676` anchor/secondary gray drops to 4.04:1 on this site's linen (`#faf0e6`) background — over 160 WCAG AA failures across heading anchors, hero separators, PDF download metadata, and the tags page total.
The fix is a site-level `data/style.yaml` restating the **entire** `text` group with `light.secondary` and `light.anchor` at `#676767` (5.03:1 on linen).
Hugo replaces a top-level data group wholesale rather than deep-merging, so an override carrying only the changed leaf silently deletes the dark palette and every sibling token — the full-group restatement is mandatory.
- **Empty anchors from linked images**: six posts still render `<figure>` inside `<a>`, which the browser's parser splits into an empty link: `2016/02/hfoss-double-bugfix`, `2016/03/community-architecture-project-report`, `2016/06/gsoc-2016-rundown-assembling-orchestra`, `2016/07/gsoc-2016-wordpress-networks`, `2017/02/2016-my-year-in-review`, `2017/07/ura-design-crowdfunds-design`.
The fix is theme-side (see below) and lands as a theme PR plus submodule bump in the same site commit.

### Theme work

- **Landed on site**: toph PR #102 (editorial blockquote and verse styling — `components/_blockquote.css`, `quote:` tokens in `data/style.yaml`) is live here via the submodule pin; toph#88 (localized recent-posts partial with language-aware archive link and RTL arrow flow); toph#82 (print stylesheet no longer leaks the dark-mode code color), landed in `85f45c2` and pinned here in `a81f3e7`.
- **AsciiDoc subpath image rebasing**: `render-page-content.html` currently rebases AsciiDoc hyperlinks (`href`), but root-relative AsciiDoc image `src="(/[^/" ][^"]*)"` outputs remain domain-root-relative, breaking under subpath deployments like preview builds or project Pages sites. Parity requires extending the post-processing helper to rebase image `src` paths without mutating already-resolved or external URLs.
- **Linked-image render hooks**: `render-image.html` needs an `.IsBlock` conditional (block images get `figure`/`figcaption`, inline ones a bare `img` with the title as an advisory `title` attribute), and `render-link.html` must unwrap `figure` elements arriving as link inner content.
`.IsBlock` reports true even for images inside links, so the link-hook unwrap is required; block detection additionally requires `wrapStandAloneImageWithinParagraph: false` in site config, added here and in the exampleSite when the hook ships.
- **toph#78 (simplified)**: the pa11y audit only ever tests light mode, because headless Chrome's `prefers-color-scheme` default is light — the theme `AGENTS.md` has been corrected on this point, but the both-modes crawl itself is still missing.
The minimal fix is one additional pa11y crawl of the same build with a `--config` overlay pinning `params.color_mode: dark`; an environment-variable overlay does not reach this key, but the overlay works, and forced modes render server-side so the crawl is deterministic.
- **toph#103** (Hugo 0.169.0 deprecations): five templates read reserved front-matter fields through `.Params`/`.Param` — `layouts/_default/li.html`, `layouts/_default/card.html`, `layouts/blog/list.html`, `layouts/categories/terms.html`, and `layouts/partials/projects-carousel.html`.
The notices are INFO-level: a default `hugo` build prints none, while `hugo --logLevel info` prints nine, so they are easy to miss but still flag an API removal.
Migrate each to the corresponding `Page` method (`.Description`, `.Title`) before Hugo drops the redirect.
- **toph#75** (mode-aware syntax highlighting): latent on this site — no Markdown post uses a lexed code fence, so Hugo's `monokai` default never renders, and `config.yaml` sets no `markup.highlight` key.
Add `markup.highlight.style` only when a post actually needs lexed highlighting, since the class-based mode-aware fix is not in place yet.
- **toph#81** (exampleSite dark palette): contributor-driven; review is gated on #78's both-modes auditing.
- **Smalls**: toph#95 (`main.css` minify plus reproducible fingerprints).
- **Parked**: toph#52 (comments; Staticman vs. Remark42 decision), toph#87 (theme-aware hero images), toph#96 (Bootstrap JS tree-shaking).

### Site work

- **#24 performance closed**: final measurements were 94 Performance / 2.85 s LCP locally (median of three runs) and 99 / 1.1 s on PageSpeed Insights, closing the issue as complete against its ≥ 90 and < 2.5 s targets.
PSI and local best-case runs clear both targets, but local run-to-run variance still straddles 2.5 s.
Remaining work is deferred to separate issues: consolidating the same-origin render-blocking CSS (`bootstrap.min.css`, `bootstrap-icons.min.css`, and `main.css`) via `resources.Concat`, the analytics-driven TBT cost, and GitHub Pages' fixed `max-age=600` cache lifetime.
- **#25 title font resolved**: Jaro swapped in (`5513c96`), resolving the dark-theme drop-shadow ghosting defect.
- **Landed**: October 2026 posts translated to Arabic with English `[[anchor]]` identifiers preserved (`211e208`), and `content/lyrics/m83-echoes-of-mine.adoc` migrated to AsciiDoc `[verse]` blocks (`d3cc132`) — `[verse]` is the correct block type for lyrics and poetry.
- **Pending blog drafts**: `content/blog/2026/11/fedora-copr-intro.adoc` is untracked and pending completion.
- **#23 llms.txt**: theme output format plus a curation decision (recent-N vs. a `featured:` flag vs. a data file; whether non-English files emit).
- **#3 closed as not planned**: the friend shout-outs archetype was closed on 2026-11-08; it does not fit the site's direction, and an ordinary post or a `footer` entry already covers the use case.

### Session-verified gotchas

- Hugo data-file merging replaces top-level groups wholesale; site overrides must restate entire groups.
- Environment-variable config overrides do not reach `params.color_mode`; `--config` overlay files do.
- Headless Chrome defaults `prefers-color-scheme` to light.
- Chroma `noClasses` bakes the highlight style's background onto `pre` at build time while uncolored tokens inherit the mode-flipping `--bs-code-color` — the mechanism behind dark-mode code contrast failures.
- pa11y-ci is unreliable at concurrency above 1 under memory pressure; concurrency 1 is deterministic.
- The GitHub MCP token is read-only; the `gh` CLI is the working mutation path.
