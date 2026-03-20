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

Hugo Extended 0.157.0+ locally. The theme requires minimum Hugo 0.123.0 (for `.GetTerms`).

## Two-Repository Architecture

This repo contains the **site content and configuration**. The theme lives in a separate Git repository included as a submodule:

- **Site repo** (this): content, config, static assets
- **Theme repo** (`themes/toph/`): layouts, CSS, partials, JS — tracked at `git@github.com:justwheel/toph-hugo-theme.git`

Changes to layouts, CSS (`assets/css/main.css`), or partials require working in the theme repo (also available at `/home/jwheel/git/web/toph-hugo-theme`). The submodule pointer in this repo is updated separately via `git submodule update --remote --rebase`.

If `themes/toph/` does not exist or is empty, the git submodule has not been cloned correctly. Check the `.gitmodules` file in the repository root and run `git submodule update --init` to resolve.

## Content Structure

- `content/blog/` — Blog posts (Markdown), organized by `YYYY/MM/slug.md`. Front matter: `title`, `date`, `categories`, `tags`. See the "Blog Migration" section below for critical rules.
- `content/projects/` — Project profiles with numeric prefix ordering (e.g., `01-red-hat.en.md`). Front matter requires: `title`, `date`, `slug`, `icon`, `hide_sitemap: true`, `categories: ["projects"]`. Translations use `.<lang>.md` suffix.
- `content/footer/` — Dynamic footer badges. Front matter requires: `categories: ["footer"]`, `hide_sitemap: true`.
- `content/categories/` — Category term `_index.md` files with human-readable `title` and optional `hide_sitemap: true` to hide from listings.
- `content/tags/` — Tag term `_index.md` files. Tags with `hide_sitemap: true` are hidden from the word cloud and taxonomy listings.
- `content/*.adoc` — Root pages (index, legal) use AsciiDoc format.
- `static/img/` — Images; `static/archive/` — archived assets.

Structural categories (`footer`, `projects`) are filtered from taxonomy pages via `params.taxonomy_exclude` in config. Individual categories and tags can also be hidden via `hide_sitemap: true` in their `_index.md` front matter.

## Blog Migration

The `content/blog/` directory contains blog posts imported from a WordPress dump of `blog.jwf.io`. Migrating all blog content into this Hugo site is a **prerequisite** to shutting down the WordPress site at `blog.jwf.io`, which provides significant cost savings and unifies Justin Wheeler's brand and identity behind `jwheel.org`.

Blogging capabilities are being actively built into the Toph theme to support this migration. The theme work spans taxonomy pages, single post enhancements, content discovery features, and supporting infrastructure (RSS, i18n, archetypes).

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

Date display format: `2006 January 02` (e.g., "2023 May 09") across all templates. `datetime` HTML attributes use ISO `2006-01-02`.

Excerpts use `.Plain | htmlUnescape | truncate 250` for safe plaintext without HTML entity artifacts.

## Git Conventions (CRITICAL)

- **Gitmoji** prefix on all commit subject lines (e.g., `🍱 content: Import blog posts`)
- **`Assisted-by:`** trailer citing exact AI model name (Fedora AI policy)
- Use `git commit --signoff` to add the `Signed-off-by` trailer — do not write it manually
- Commit messages emphasize WHY, not just WHAT
- Write commit messages to `/tmp/commit-msg.txt` — user runs `git commit --file /tmp/commit-msg.txt --signoff` manually
- **NEVER** run `git push` or create PRs — user does these manually
- **NEVER** use `--no-gpg-sign` or skip hooks
- User creates branches and approves all changes

## Style Guide for Agents

When demonstrating or suggesting bash commands, always use the fully-expanded form of flags and parameters (e.g., `--signoff` instead of `-s`, `--file` instead of `-F`, `--init` instead of `-i`). This promotes learning for the user.
