# Blog Content Migration Plan

> This is an iterative project. Each phase can be completed independently
> and checked in over time. Progress is tracked via the checklists below.

**Goal:** Review, fix, and publish the WordPress blog content import from
the `add/blog` branch into `main` on jwheel.org.

**Branch:** `add/blog` (1 commit ahead of `main`: `4abafa8`)

---

## Scope Summary

| Metric | Count |
|--------|-------|
| Markdown blog posts | 173 |
| Local image files (in `images/` dirs) | 391 |
| Image directories (`content/blog/YYYY/MM/images/`) | 64 |
| Unique external image URLs | 308 |
| Posts referencing `blog.justinwflory.com` | 81 |
| Posts referencing `jwfblog.wpenginepowered.com` | 24 |
| Posts referencing `blog.jwf.io` | 12 |
| Unique WordPress upload images (`wp-content/uploads/`) | 224 |

### External Image Domains (by frequency)

| Count | Domain | Notes |
|-------|--------|-------|
| 272 | blog.justinwflory.com | Old WordPress domain — same as blog.jwf.io |
| 31 | jwfblog.wpenginepowered.com | WP Engine CDN — same as blog.jwf.io |
| 22 | 1504253206.rsc.cdn77.org | CDN — investigate |
| 19 | cdn.fedoramagazine.org | Fedora Magazine — third party |
| 7 | i1.wp.com | WordPress CDN proxy |
| 5 | upload.wikimedia.org | Wikimedia Commons — public domain/CC |
| 4 | miro.medium.com | Medium — third party |
| 3 | i.imgur.com | Imgur — unreliable hosting |
| 3 | i.giphy.com | Giphy — animated GIFs |
| 3 | i0.wp.com | WordPress CDN proxy |
| 2 | example.com | Placeholder — likely broken |
| 2 | communityblog.fedoraproject.org | Fedora Community Blog |
| 1 | www.apache.org | Apache Foundation |
| 1 | telegram.org | Telegram |
| 1 | slack-imgs.com | Slack image proxy |

---

## Phase 1: Domain Normalization

Normalize all WordPress domain references to a single canonical domain.
The three domains `blog.justinwflory.com`, `jwfblog.wpenginepowered.com`,
and `blog.jwf.io` all point to the same WordPress site. Canonical domain
is `jwfblog.wpenginepowered.com` (WP Engine internal DNS — works even if
`blog.jwf.io` DNS changes, and clearly flags WordPress-dependent content).

- [x] Decide on canonical domain: `jwfblog.wpenginepowered.com`
- [x] Find-and-replace `blog.justinwflory.com` → canonical domain (81 files)
- [x] Find-and-replace `blog.jwf.io` → canonical domain (11 files; 1 prose reference in lights.md intentionally kept)
- [x] Replace old domain inside WP CDN proxy URLs (`i0.wp.com/blog.justinwflory.com/...`)
- [x] Verify: 0 files reference `blog.justinwflory.com`, 111 files use canonical domain

## Phase 2: Local Image Audit

Audit images that are already stored locally in `content/blog/YYYY/MM/images/`.

- [x] Count local images: 264 files across 64 directories
- [x] Identify orphaned images: 15 orphaned (5.7%) — mostly WordPress-generated alternate sizes
- [x] Identify duplicates: 10 filenames duplicated across 26 files (e.g., teleirc-development-update.jpg x6)
- [x] Image reference patterns found:
  - `coverImage` front matter (107 posts) — Hugo-native, local filename
  - WordPress external URLs (269 refs) — still on jwfblog.wpenginepowered.com
  - WordPress caption shortcodes (166 refs) — legacy [caption] syntax
- [x] Key finding: many local copies exist but posts still reference external WordPress URLs
- [ ] Decide: remove orphaned images or keep for potential future use
- [ ] Decide: deduplicate images that appear in multiple directories

## Phase 3: External Image Assessment

For each external domain, assess whether images can/should be migrated locally.

### 3a: WordPress uploads (jwfblog.wpenginepowered.com/wp-content/uploads/)
These are images the user originally uploaded — full ownership rights.

**Revised finding:** Of 250 unique WordPress image URLs, 149 already have
local copies (originals in `images/` dirs). The remaining 101 are
WordPress-generated **resized variants** (e.g., `-1024x683`, `-300x225`)
of originals that already exist locally. Very few, if any, downloads needed.

- [ ] Update Markdown references from WordPress resized URLs to local originals
- [ ] For each resized URL, strip the WordPress size suffix to find the local original
- [ ] Verify local originals exist and render at acceptable quality
- [ ] Download only images where no local original exists (expected: very few)
- [ ] Verify all migrated references render correctly

### 3b: WordPress CDN proxies (i1.wp.com, i0.wp.com)
These are WordPress.com CDN-proxied versions of the same uploads.

- [ ] Identify the original image for each CDN URL
- [ ] Replace with local path (most already exist locally)
- [ ] Download only if no local copy exists

### 3c: CDN images (1504253206.rsc.cdn77.org)
- [ ] Investigate what these images are
- [ ] Check if still accessible
- [ ] Assess ownership and migration feasibility

### 3d: Third-party images (Fedora Magazine, Wikimedia, Medium, etc.)
These require copyright/IP assessment before local hosting.

- [ ] **cdn.fedoramagazine.org** (19 images): Fedora Magazine content,
      likely CC-BY-SA. Assess license compatibility.
- [ ] **upload.wikimedia.org** (5 images): Check individual licenses
      (usually CC/public domain). Can likely host locally with attribution.
- [ ] **miro.medium.com** (4 images): Third-party content. May need to
      link externally or replace with alternatives.
- [ ] **i.imgur.com** (3 images): Unreliable hosting. Download and host
      locally if the user owns the content, or replace.
- [ ] **i.giphy.com** (3 images): Animated GIFs. Assess whether to keep
      as external embeds or download.
- [ ] **communityblog.fedoraproject.org** (2 images): Fedora community
      content, likely CC-BY-SA.
- [ ] **Other single-reference domains**: Assess individually.

### 3e: Broken/placeholder references
- [ ] **example.com** (2 references): These are broken. Remove or replace.
- [ ] **slack-imgs.com** (1 reference): Slack image proxy, likely expired.
      Remove or replace.

## Phase 4: Content Review

Review blog posts for rendering quality on the live site.

- [ ] Build site with `hugo server` and visually inspect posts by year
- [ ] Check for broken Markdown formatting (unclosed tags, bad escaping)
- [ ] Check for missing front matter fields
- [ ] Verify categories and tags match existing taxonomy structure
- [ ] Check for raw HTML that Hugo may omit (see `warning-goldmark-raw-html`)
- [ ] Verify date formats and URL paths match WordPress originals

## Phase 5: Pull Request and Merge

- [ ] Rebase `add/blog` onto latest `main`
- [ ] Create PR with summary of all changes
- [ ] Final review of rendered site
- [ ] Merge to `main`

---

## Progress Tracking

This plan is designed for iterative work. Each phase and sub-phase can
be completed in separate sessions. Update the checkboxes as work is
completed. The plan file itself serves as the living checklist.

**Last updated:** 2026-03-22
**Status:** Phase 1 complete, Phase 2 audit complete (orphans kept, dedup deferred), Phase 3 not started

**Note:** Toph submodule has 6+ unaccounted commits (hero partial, social
registry, a11y fixes) that need a submodule pointer update before the
blog content PR.
