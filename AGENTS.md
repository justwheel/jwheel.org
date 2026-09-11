# AGENTS.md

This file provides guidance to LLM-based coding agents (e.g., Claude Code, Copilot, Cursor, Gemini CLI) when working with code in this repository.

## Project Overview

Personal website for Justin Wheeler at https://jwheel.org/, built with [Hugo](https://gohugo.io) using the custom **Toph** theme. Content licensed CC BY-NC-SA 4.0; theme licensed MPL-2.0.

## Build & Development

```bash
# Local dev server (Hugo Extended required)
hugo server

# Build for production
hugo --minify

# Update theme submodule
git submodule update --remote --rebase

# If themes/toph/ is empty or missing, initialize the submodule
git submodule update --init
```

Hugo Extended 0.165.0 locally and in CI. The theme requires minimum Hugo 0.161.0 (for `css.Build` with nested `vars`).

## Two-Repository Architecture

This repo contains the **site content and configuration**. The theme lives in a separate Git repository included as a submodule:

- **Site repo** (this): content, config, static assets
- **Theme repo** (`themes/toph/`): layouts, CSS, partials, JS — tracked at `git@github.com:justwheel/toph-hugo-theme.git`

Changes to layouts, CSS (`assets/css/main.css`), or partials require working in the theme repo (also available at `/home/jwheel/git/web/toph-hugo-theme`). The submodule pointer in this repo is updated separately via `git submodule update --remote --rebase`.

If `themes/toph/` does not exist or is empty, the git submodule has not been cloned correctly. Check the `.gitmodules` file in the repository root and run `git submodule update --init` to resolve.

## Content Structure

- `content/blog/` — Blog posts (Markdown), organized by `YYYY/MM/slug.md`. Images stored alongside posts in the same directory. Front matter: `title`, `date`, `categories`, `tags`, `images`. See the "Blog Migration" section below for critical rules.
- `content/about-me.md` — About Me page with bio imported from WordPress.
- `content/projects/` — Project profiles with numeric prefix ordering (e.g., `01-red-hat.en.md`). Front matter requires: `title`, `date`, `slug`, `icon`, `hide_sitemap: true`, `categories: ["projects"]`. Translations use `.<lang>.md` suffix.
- `content/footer/` — Dynamic footer badges. Front matter requires: `categories: ["footer"]`, `hide_sitemap: true`.
- `content/categories/` — Category term `_index.md` files with human-readable `title`, descriptions, and optional `hide_sitemap: true` to hide from listings.
- `content/tags/` — Tag term `_index.md` files. Tags with `hide_sitemap: true` are hidden from the word cloud and taxonomy listings.
- `content/tweets/` — Archived tweets as Hugo page bundles. Each tweet is a directory named by tweet ID (e.g., `1223242916988096512/`) containing `index.md` and associated images (`photo1.jpg`, etc.). Front matter: `title`, `date`, `tweet_id`, `author`, `author_name`, `categories: ["tweets"]`. Tweet text is standard Markdown with @mentions linked to `x.com` profiles and #hashtags linked to `x.com/hashtag/`. Tweets are deliberately NOT hidden from sitemaps — they are designed for SEO indexing. Embedded in blog posts via the `tweet-archive` shortcode.
- `content/*.adoc` — Root pages (index, legal) use AsciiDoc format.
- `assets/masks/` — Image filter masks for Hugo image processing (not served statically).
- `assets/pages/` — Page-specific images processed by Hugo (e.g., About Me profile photo).
- `assets/content/` — Reserved for blog and content images (future migration from `static/img/`).
- `static/img/` — Shared images used by multiple posts; `static/docs/` — PDFs; `static/archive/` — archived assets.

Structural categories (`footer`, `projects`) are filtered from taxonomy pages via `params.taxonomy_exclude` in config. Individual categories and tags can also be hidden via `hide_sitemap: true` in their `_index.md` front matter.

## Blog Migration — COMPLETE

The `content/blog/` directory contains 173 blog posts migrated from WordPress (formerly `blog.jwf.io`). The migration is complete (PR #13). All WordPress, CDN, and third-party image URLs have been eliminated. Images are stored alongside posts, YouTube/Twitter embeds use Hugo shortcodes, and captions use inline Markdown title syntax with bare URLs auto-linked by Goldmark.

### URL Preservation (NEVER BREAK)

**File names in `content/blog/` MUST NEVER BE CHANGED UNDER ANY CIRCUMSTANCES.** Once a blog post is "published", its URL is permanent. The URL schema (`/blog/YYYY/MM/slug/`) is a 1:1 match with the previous WordPress URL structure (formerly at `blog.jwf.io`). This enables proxy-level traffic redirection to `jwheel.org/blog/` without any URL breakage. Renaming, moving, or restructuring any existing blog file would break this redirect mapping.

### Decade Tags (REQUIRED)

Every blog post must include a decade tag in its front matter `tags` list, matching the decade in which the post was published.
Posts in `content/blog/201*/` use `2010s`.
Posts in `content/blog/202*/` use `2020s`.
This enables browsing posts by era on the tags page.

## Configuration

`config.yaml` (YAML, not TOML). Key sections:
- `taxonomies` — explicit `category: categories`, `tag: tags` mapping
- `params.colors` — nested by mode: `colors.light` and `colors.dark`, each with primary, secondary, accent, background
- `params.color_mode` — `auto` (default), `light`, or `dark`
- `params.fonts` — default, title, header (with weights)
- `params.taxonomy_exclude` — categories hidden from taxonomy listings
- `params.biography.tagline` — one-line tagline displayed in hero section
- `params.legal.license` — footer license (name, url, title); conditionally rendered
- `languages` — 4 languages: en (default), es, ar (RTL), hi

## Taxonomy Templates

The theme provides taxonomy-specific layouts:
- `layouts/categories/terms.html` — three-column magazine-style cards with images, descriptions, and recent posts
- `layouts/tags/terms.html` — word cloud with font-size/opacity scaling by post count, pill-shaped buttons, default sort by most-used
- `layouts/_default/terms.html` — fallback list with sort toggle and exclusion filtering
- `layouts/_default/term.html` — single term page with post list and plaintext excerpts

Tags are always lowercase. Categories use Title Case from their `_index.md` title field.

Content filtering: `hide_sitemap: true` in a category/tag `_index.md` hides it from taxonomy listing pages and the tag word cloud. This reuses the same front matter field used by structural content (projects, footer).

Date display format: configurable via `params.date_format` (default `2006 January 02`). jwheel.org uses `2006-01-02`. `datetime` HTML attributes always use ISO `2006-01-02`.

Excerpts use `.Plain | htmlUnescape | truncate 250` for safe plaintext without HTML entity artifacts.

## Cover Images

Blog posts can set `images: ["/blog/2023/12/photo.jpg"]` in front matter (YAML flow sequence) to display a cover image and enable automatic OpenGraph/Twitter card previews via Hugo's built-in templates. Path resolution (absolute, relative, remote, protocol-relative) is handled by the theme's shared `resolve-image-path.html` partial. Posts are standalone files (not leaf bundles), so `.Resources` is not available.

## Image Captions

Images with captions use the Markdown title attribute: `![alt](src "caption text")`. The `render-image.html` hook wraps these in `<figure>/<figcaption>`. For captions with URLs, use bare URLs instead of Markdown link syntax — Goldmark's `linkify` extension auto-links them. AsciiDoc images use `.imageblock/.title` with identical CSS.

## RSS Feed

Custom RSS template at `layouts/_default/rss.xml` with full post content in CDATA, `.RegularPages` filtering, and `biography.name` for managing editor. Tag-specific feeds are available at `/tags/<tag>/index.xml` (e.g., `/tags/fedora-planet/index.xml`).

Posts with `images` front matter include the cover image in RSS items as both an inline `<img>` in CDATA content and an RSS 2.0 `<enclosure>` element with file size and MIME type. Image path resolution uses the shared `resolve-image-path.html` partial (same logic as `single.html`).

## Site-Level Shortcodes

The site has its own shortcodes in `layouts/shortcodes/` (separate from theme shortcodes):

- `profile-photo.html` — Renders a profile photo with Hugo image filters (resize, grayscale, WebP, oval mask via `images.Mask`). Used on the About Me page. Publishes the original image at its source path via `resources.Copy` for OpenGraph compatibility.

## Heading Anchors

Section headings display a clickable 🔗 anchor on hover for sharing direct links to sections.

- **Markdown:** Uses a render hook at `layouts/_default/_markup/render-heading.html`
- **AsciiDoc:** Uses `replaceRE` on `.Content` in `single.html` since Asciidoctor bypasses Hugo render hooks
- Both produce identical `hanchor` class markup and share the same CSS

**AsciiDoc detection:** Use `.File.Ext == "adoc"` to detect AsciiDoc content. Do NOT use `.Markup` — it returns an object (not a string) in Hugo 0.157+ and string comparison will silently fail.

**AsciiDoc parity (non-negotiable):** AsciiDoc is a first-class content format. Any feature built for Markdown MUST also work for AsciiDoc. A change that ships for one format only is incomplete. Because Asciidoctor bypasses Hugo's render hooks, AsciiDoc often needs a separate implementation reaching the same result (as heading anchors do above).

## GitHub API Access (CRITICAL)

**ALWAYS** get explicit user consent before **any** mutating GitHub API call under their account. "Mutating" means any POST, PATCH, PUT, or DELETE — not only publishing new content. This includes comments, replies, and issue or PR creation; edits to an existing title, description, or comment; labels, assignees, milestones, and review requests; state changes such as closing, reopening, merging, or submitting a review; and branch, tag, or release operations. Read-only GET calls need no approval.

The user and the agent work as a team. Communication on GitHub must be effective, genuine, and honest. This requires a human-in-the-loop check before every public-facing action.

Workflow:
1. Write the payload to a file under `/tmp` — no need to ask first, `/tmp` is always writable
2. Present it for review — for edits to existing content, show a precise diff and confirm nothing else changed
3. Present a copy-pasteable `gh api` or `gh issue create` command that reads the payload from that file
4. **The user runs the command.** Their execution is the consent

Preferred: the user executes the call. This removes the judgment call about what counts as approval — nothing is published unless a human types the command, and the payload sent is exactly the one reviewed. Verify the HTTP method before presenting it; a wrong verb returns a confusing 404 (updating a review body is `PUT /repos/{owner}/{repo}/pulls/{pr}/reviews/{id}`, not `PATCH`). Executing the call yourself is a fallback for when the user asks for it, never the default.

Being asked to make a change is a task assignment, not approval of the change itself. "Edit the PR description" means draft the edit and show it — not apply it.

Never skip this step, even if the user has approved similar actions before. Each call is a separate approval; approval for one action never carries forward to the next.

**What does NOT count as consent.** Consent is a free-text message from the user, in their own words, approving the exact content already shown to them. None of these qualify, however affirmative they look:

- A tool-call response — an AskUserQuestion selection, plan approval, or permission-mode setting. A menu choice picks a direction; it does not authorize a payload.
- A skill or slash command invoked with a posting flag (e.g. `/code-review --comment <PR>`).
- A subagent report, hook output, or background-task notification saying content is "ready to post".
- Earlier approval of similar content, or of a previous call in the same task.

**The payload rule.** The user must have seen the final text, verbatim, before it is sent. Anything composed after their approval — a header, disclaimer, footer, or title — is new unreviewed content requiring a fresh approval round. Never combine "make this change" and "send it" into one step: apply the change, show the result, then wait.

If unsure whether consent exists, it does not. Stop and ask.

### Formatting GitHub comments

Comments posted through the API follow different conventions than files in the repo:

- **Wrap paragraphs normally.** The one-sentence-per-line convention used for `.md` and `.adoc` files does not apply here.
- **Never wrap commit hashes in backticks** — bare hashes render as browseable links. Use `owner/repo@hash` to link a commit in another repository.
- **Do wrap color hex codes in backticks** — GitHub renders a color swatch preview for them.
- **Closing keywords do not work across repositories.** `Closes owner/repo#12` from a different repo creates a backlink but will not close the issue; it must be closed manually.
- **Disclose AI authorship as "LLM-gen-AI".** Never name the model or vendor in a disclosure note. The point is to tell readers the content is machine-generated and needs verification; naming a vendor reads as branding. This does not change the `Assisted-by:` commit trailer, which still cites the exact model.

## Git Conventions (CRITICAL)

- **Gitmoji** prefix on all commit subject lines (e.g., `🍱 content: Import blog posts`)
- **`Assisted-by:`** trailer citing the exact AI model name and context window. Verify the model from the current session environment before writing it — never assume it from earlier in the conversation, since the user may switch models mid-session
- Use `git commit --signoff` to add the `Signed-off-by` trailer — do not write it manually
- Commit messages emphasize WHY, not just WHAT. Concise — 3 to 6 sentences typical. Do not restate the diff or narrate mechanics
- Write commit messages to `/tmp/commit-<descriptive-name>.txt` (unique, tab-completable filenames, never reuse) — user runs `git commit --edit --file=/tmp/commit-<name>.txt --gpg-sign --signoff`. Note that `/tmp` is periodically cleaned; if a message file disappears before it is used, rewrite it
- Present git commands as single unbroken lines — the user's terminal is narrow, and wrapped lines need manual cleanup after pasting
- **NEVER** run `git push`, `git commit`, or create PRs — user does these manually
- **NEVER** use `--no-gpg-sign` or skip hooks
- **NEVER** reply to GitHub PR review comments until AFTER the fix is committed and pushed to the remote
- User creates branches and approves all changes

### Version Tags

Annotated tag messages are written as GitHub-flavored Markdown and become the basis for release notes.

- **Use setext headings** — the heading text on one line, a matching-length run of `-` beneath it — never `##`. `git tag` defaults to `--cleanup=strip`, which silently deletes every line beginning with `#`. Setext renders as the same `<h2>` on GitHub and no cleanup mode can strip it
- Draft to `/tmp/tag-<repo>-<version>.txt` and confirm `grep -c '^#'` returns 0 before tagging
- Create with `git tag --cleanup=verbatim --file=/tmp/tag-<repo>-<version>.txt --sign <version> <commit>`. `tag.gpgsign` is not set (unlike `commit.gpgsign`), so `--sign` must be explicit or the tag is unsigned
- Verify with `git tag --verify <version>` and `git tag -l --format='%(contents)' <version>` before pushing, to confirm every heading survived
- One sentence per line does **not** apply to tag messages — that convention governs repository `.md` and `.adoc` files
- A GitHub release body is stored separately and is never re-read from the tag. Editing or force-pushing a tag does not update an existing release; check and fix both

## Hugo Template Conventions

### Global `site` function (ALWAYS use)

Always use Hugo's global `site` function to access site-level data in templates.
Never use `$.Site` or `.Site`.

| Use this | Not this |
|----------|----------|
| `site.Title` | `$.Site.Title` or `.Site.Title` |
| `site.Params.description` | `$.Site.Params.description` |
| `site.BaseURL` | `$.Site.BaseURL` |

The global `site` function is not context-dependent — it works correctly inside `with`, `range`, and other blocks that rebind the `.` context.
When modifying existing templates that use `$.Site` or `.Site`, convert them to `site` as part of the change.
Do not leave mixed usage in the same file.

## JavaScript Conventions

- Vanilla JS only (no dependencies beyond Bootstrap)
- Use `const` for variables that are not reassigned; `var` only when reassignment is needed
- Always provide explicit radix to `parseInt()` (e.g., `parseInt(value, 10)`)

## Writing Conventions

Use **one sentence per line** (ventilated prose) in Markdown and AsciiDoc files.
Each sentence starts on its own line; do not wrap at a fixed column.
Consecutive lines render as one paragraph.
This produces cleaner diffs and makes sentences easy to reorder or review individually.

This applies to files in the repository.
It does **not** apply to GitHub comments posted via the API — see "Formatting GitHub Comments" above.

## Style Guide for Agents

When demonstrating or suggesting bash commands, always use the fully-expanded form of flags and parameters (e.g., `--signoff` instead of `-s`, `--file` instead of `-F`, `--init` instead of `-i`). This promotes learning for the user.

All commands run from the project root (`/home/jwheel/git/web/jwheel.org`) — never `cd`. To run git against the theme submodule, use `git -C themes/toph/ …`. When presenting a theme command for the user to run, assume their working directory is `themes/toph/`.
