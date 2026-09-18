# AGENTS.md

Guidance for AI coding agents working in the `jwheel.org` repository.

## Project Overview

Personal website for Justin Wheeler (https://jwheel.org/), built with Hugo using the custom **Toph** theme.
Site content is licensed CC BY-NC-SA 4.0; theme is licensed MPL-2.0.

- **Hugo Extended**: Pinned to **0.165.0** locally and in CI.
- **Dart Sass**: 1.101.0 in CI.
- The theme requires minimum Hugo 0.161.0.

## Two-Repository Architecture

This project is split across two repositories:
- **Site repo** (this): content, site config, static/page assets.
- **Theme submodule** (`themes/toph/`): layouts, CSS, partials, JS (`justwheel/toph-hugo-theme`).
- **Agent working directory**: Always run commands from the site root (`/home/jwheel/git/web/jwheel.org`).
- Never `cd`.
- Run theme commands via `git -C themes/toph/ ...`.
- **User-facing commands**: Never include `-C` or `cd`.
- Precede theme commands with a one-line reminder (`Run this from themes/toph/:`) and present bare commands.

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
- **Hooks vs Post-Processing**: Asciidoctor bypasses Hugo render hooks.
Markdown uses hooks (e.g., `render-heading.html`); AsciiDoc uses post-processing (e.g., `replaceRE` in `single.html`).
Both must produce identical HTML markup and CSS classes.

## Hugo Template Conventions

- **Global `site` Function**: Always use `site.Params`, `site.Title`, `site.BaseURL`—never `$.Site` or `.Site`.
Convert any `.Site` occurrences encountered during refactoring.
- **Asset Image Processing**: Guard raster processing with `reflect.IsImageResourceProcessable $resource`.
Prefer `.Resize` for proportional scaling without cropping.
Hugo's `.Fill` uses `Smart` crop by default, which shifts focal points and cuts edges/chins on portraits.
If square aspect is required, specify explicit anchors (e.g., `.Fill "500x500 webp Center"`).

## Verification & State Checking

- **Prove State Before Asserting**: Always run the proving command first; the user explicitly accepts extra tool calls.
A negative grep proves pattern absence, not positive correctness.
Enumerate all surfaces before claiming exhaustiveness.

## Git Workflow & Conventions (CRITICAL)

- **Execution**: NEVER run `git commit`, `git push`, or `git merge` directly.
User executes these manually.
- **Staging**: Prefer directory/glob arguments over long explicit file lists.
Check `git status --porcelain` before staging.
Never run `git reset` without permission (user stages manually to track work).
- **Commit Messages**: Format: `<gitmoji> <component>: <summary>`.
Body: Explain **WHY** (rationale, problem solved, alternatives considered), not WHAT or HOW (avoid diff narration).
Three to six sentences typical.
Follow the 50/72 rule: subject line ≤ 50 characters, body lines wrapped at ≤ 72 characters.
- **Trailer**: `Assisted-by: <model> <version> (<context window>)`.
Verify the exact model name from the environment (`gemini-3.8-flash`) before writing.
Do **not** cite Fedora policy in the commit message or documentation.
- **Sign-off**: Suggest `git commit --signoff` (never write `Signed-off-by` in text).
- **Drafting**: Draft commit messages to `/tmp/commit-<name>.txt` (unique filename, human-readable).
Present user command as a single unbroken line:
`git add <path> && git commit --edit --file=/tmp/commit-<name>.txt --gpg-sign --signoff`
- **Version Tags**: Tag messages use setext headings (underlined with `-`), never `##` (default `--cleanup=strip` removes `#`).
Draft to `/tmp/tag-<repo>-<version>.txt`, check `grep -c '^#'` is 0, tag with `--cleanup=verbatim --sign`.

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
