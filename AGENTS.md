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

Hugo Extended 0.161.1 locally and in CI. The theme requires minimum Hugo 0.161.0 (for `css.Build` with nested `vars`).

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

## Configuration

`config.yaml` (YAML, not TOML). Key sections:
- `taxonomies` — explicit `category: categories`, `tag: tags` mapping
- `params.colors` — primary, secondary, accent
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

## GitHub API Access (CRITICAL)

**ALWAYS** get explicit user consent before posting any content to GitHub under their account. This includes comments, replies, issue creation, PR creation, and any other action that publishes content visible to others.

The user and the agent work as a team. Communication on GitHub must be effective, genuine, and honest. This requires a human-in-the-loop check before every public-facing action.

Workflow:
1. Draft the proposed comment/reply in the terminal
2. Present it to the user for review
3. Wait for explicit approval (e.g., "post it")
4. Only then execute the GitHub API call

Never skip this step, even if the user has approved similar comments before. Each comment is a separate approval.

## Git Conventions (CRITICAL)

- **Gitmoji** prefix on all commit subject lines (e.g., `🍱 content: Import blog posts`)
- **`Assisted-by:`** trailer citing exact AI model name (Fedora AI policy)
- Use `git commit --signoff` to add the `Signed-off-by` trailer — do not write it manually
- Commit messages emphasize WHY, not just WHAT
- Write commit messages to `/tmp/commit-msg-<descriptive-name>.txt` (unique filenames, never reuse) — user runs `git commit --edit --file /tmp/commit-msg-<name>.txt --gpg-sign --signoff`
- **NEVER** run `git push` or create PRs — user does these manually
- **NEVER** use `--no-gpg-sign` or skip hooks
- **NEVER** reply to GitHub PR review comments until AFTER the fix is committed and pushed to the remote
- User creates branches and approves all changes

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

## Style Guide for Agents

When demonstrating or suggesting bash commands, always use the fully-expanded form of flags and parameters (e.g., `--signoff` instead of `-s`, `--file` instead of `-F`, `--init` instead of `-i`). This promotes learning for the user.
