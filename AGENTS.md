# AGENTS.md

This file provides guidance to LLM-based coding agents (e.g., Claude Code, Copilot, Cursor, Gemini CLI) when working with code in this repository.

## Project Overview

Personal website for Justin Wheeler at https://jwheel.org/, built with [Hugo](https://gohugo.io) using the custom **Toph** theme. Licensed MPL-2.0.

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

Hugo Extended 0.158.0 locally and in CI. The theme requires minimum Hugo 0.123.0 (for `.GetTerms`).

## Two-Repository Architecture

This repo contains the **site content and configuration**. The theme lives in a separate Git repository included as a submodule:

- **Site repo** (this): content, config, static assets
- **Theme repo** (`themes/toph/`): layouts, CSS, partials, JS — tracked at `git@github.com:justwheel/toph-hugo-theme.git`

Changes to layouts, CSS (`assets/css/main.css`), or partials require working in the theme repo (also available at `/home/jwheel/git/web/toph-hugo-theme`). The submodule pointer in this repo is updated separately via `git submodule update --remote --rebase`.

If `themes/toph/` does not exist or is empty, the git submodule has not been cloned correctly. Check the `.gitmodules` file in the repository root and run `git submodule update --init` to resolve.

## Content Structure

- `content/blog/` — Blog posts (Markdown), organized by `YYYY/MM/slug.md`. Images stored alongside posts in the same directory. Front matter: `title`, `date`, `categories`, `tags`, `coverImage`. See the "Blog Migration" section below for critical rules.
- `content/about-me.md` — About Me page with bio imported from WordPress.
- `content/projects/` — Project profiles with numeric prefix ordering (e.g., `01-red-hat.en.md`). Front matter requires: `title`, `date`, `slug`, `icon`, `hide_sitemap: true`, `categories: ["projects"]`. Translations use `.<lang>.md` suffix.
- `content/footer/` — Dynamic footer badges. Front matter requires: `categories: ["footer"]`, `hide_sitemap: true`.
- `content/categories/` — Category term `_index.md` files with human-readable `title`, descriptions, and optional `hide_sitemap: true` to hide from listings.
- `content/tags/` — Tag term `_index.md` files. Tags with `hide_sitemap: true` are hidden from the word cloud and taxonomy listings.
- `content/*.adoc` — Root pages (index, legal) use AsciiDoc format.
- `static/img/` — Shared images used by multiple posts; `static/docs/` — PDFs; `static/archive/` — archived assets.

Structural categories (`footer`, `projects`) are filtered from taxonomy pages via `params.taxonomy_exclude` in config. Individual categories and tags can also be hidden via `hide_sitemap: true` in their `_index.md` front matter.

## Blog Migration — COMPLETE

The `content/blog/` directory contains 173 blog posts migrated from WordPress (`blog.jwf.io`). The migration is complete (PR #13). All WordPress, CDN, and third-party image URLs have been eliminated. Images are stored alongside posts, YouTube/Twitter embeds use Hugo shortcodes, and captions use inline Markdown title syntax with bare URLs auto-linked by Goldmark.

### URL Preservation (NEVER BREAK)

**File names in `content/blog/` MUST NEVER BE CHANGED UNDER ANY CIRCUMSTANCES.** Once a blog post is "published", its URL is permanent. The URL schema (`/blog/YYYY/MM/slug/`) is a 1:1 match with the previous WordPress URL structure at `blog.jwf.io`. This enables proxy-level traffic redirection from `blog.jwf.io` to `jwheel.org/blog/` without any URL breakage. Renaming, moving, or restructuring any existing blog file would break this redirect mapping.

## Configuration

`config.yaml` (YAML, not TOML). Key sections:
- `taxonomies` — explicit `category: categories`, `tag: tags` mapping
- `params.colors` — primary, secondary, accent
- `params.fonts` — default, title, header (with weights)
- `params.taxonomy_exclude` — categories hidden from taxonomy listings
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

Blog posts can set `coverImage: "filename.jpg"` in front matter to display a full-width image between the title and post metadata. Non-absolute paths are resolved relative to the post's directory via `path.Join`. Posts are standalone files (not leaf bundles), so `.Resources` is not available.

## Image Captions

Images with captions use the Markdown title attribute: `![alt](src "caption text")`. The `render-image.html` hook wraps these in `<figure>/<figcaption>`. For captions with URLs, use bare URLs instead of Markdown link syntax — Goldmark's `linkify` extension auto-links them. AsciiDoc images use `.imageblock/.title` with identical CSS.

## RSS Feed

Custom RSS template at `layouts/_default/rss.xml` with full post content in CDATA, `.RegularPages` filtering, and `biography.name` for managing editor. Tag-specific feeds are available at `/tags/<tag>/index.xml` (e.g., `/tags/fedora-planet/index.xml`).

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
- Write commit messages to `/tmp/commit-msg.txt` — user runs `git commit --file /tmp/commit-msg.txt --signoff` manually
- **NEVER** run `git push` or create PRs — user does these manually
- **NEVER** use `--no-gpg-sign` or skip hooks
- **NEVER** reply to GitHub PR review comments until AFTER the fix is committed and pushed to the remote
- User creates branches and approves all changes

## JavaScript Conventions

- Vanilla JS only (no dependencies beyond Bootstrap)
- Use `const` for variables that are not reassigned; `var` only when reassignment is needed
- Always provide explicit radix to `parseInt()` (e.g., `parseInt(value, 10)`)

## Style Guide for Agents

When demonstrating or suggesting bash commands, always use the fully-expanded form of flags and parameters (e.g., `--signoff` instead of `-s`, `--file` instead of `-F`, `--init` instead of `-i`). This promotes learning for the user.
