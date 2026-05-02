# PDF Download Shortcode Design

## Problem

Two blog posts link to local PDFs with bare Markdown links that render as plain text, indistinguishable from regular links.
A dedicated shortcode makes downloads feel intentional and polished.

**GitHub issue:** #15

## Shortcode API

**File:** `themes/toph/layouts/shortcodes/pdf-download.html`

```
{{</* pdf-download file="/docs/example.pdf" title="Document Title" */>}}

{{</* pdf-download file="/docs/example.pdf" title="Document Title" description="A brief explanation." */>}}
```

**Parameters:**

| Name | Required | Description |
|------|----------|-------------|
| `file` | Yes | Path to the PDF relative to `static/` (e.g., `/docs/example.pdf`) |
| `title` | Yes | Display title for the document |
| `description` | No | Brief explanation of the PDF content |

## Layout

Horizontal bar with three elements in a single row:

1. **Icon** — 44x44px square with `var(--primary)` background, white `bi-file-earmark-pdf-fill` Bootstrap Icon
2. **Text area** — title (bold), optional description (muted), file size metadata ("PDF · 442 KB")
3. **Download button** — pill-style button with `var(--primary)` background, `bi-download` icon + "Download" label

The entire card is wrapped in an `<a>` element with `download` attribute so clicking anywhere triggers the download.

## File Size Formatting

Computed at build time via Hugo's `os.Stat` on the `static/` path.

| Size range | Format | Example |
|------------|--------|---------|
| < 1 MB (1,000,000 bytes) | KB | "53 KB" |
| 1 MB – 999 MB | MB | "4.2 MB" |
| >= 1,000 MB | GB | "1.2 GB" |

Division uses 1000-based units (SI), not 1024 (binary).

## CSS Component

**File:** `themes/toph/assets/css/components/_pdf-download.css`
**Import:** Add to `themes/toph/assets/css/main.css` after the `_code.css` import.

Selectors:
- `.pdf-download` — flex container, border (`--border-medium`), rounded corners, shadow (`--shadow-card`), hover lift
- `.pdf-download__icon` — fixed 44x44px, `var(--primary)` background, centered white icon
- `.pdf-download__info` — flex-grow text container
- `.pdf-download__title` — bold title text
- `.pdf-download__description` — optional muted description (`--text-muted`)
- `.pdf-download__meta` — file type and size label (`--text-secondary`)
- `.pdf-download__button` — styled span (not a nested `<a>`) with `var(--primary)` background

All colors use CSS custom properties — adapts to any Toph site's brand colors.

### Mobile Behavior

Below Bootstrap's `sm` breakpoint (576px):
- Card stacks vertically: icon centered on top, text below, full-width download button at bottom
- Icon, title, and description center-align

## Error Behavior

If the `file` path doesn't exist, Hugo's `os.Stat` fails at build time with a clear error.
This is intentional — fail-fast catches broken links before deploy.

## AsciiDoc Compatibility

Hugo processes shortcodes before the content renderer.
`{{</* pdf-download */>}}` works identically in `.md` and `.adoc` files with no special handling.

## Files Changed

| File | Action |
|------|--------|
| `themes/toph/layouts/shortcodes/pdf-download.html` | Create — shortcode template |
| `themes/toph/assets/css/components/_pdf-download.css` | Create — component styles |
| `themes/toph/assets/css/main.css` | Edit — add `@import` line |
| `content/blog/2020/11/open-source-archetypes-unicef-open-source.md` (line 24) | Edit — replace bare PDF link with shortcode |
| `content/blog/2018/11/sustain-oss-2018-quick-rewind.md` (line 97) | Edit — replace bare PDF link with shortcode |

## Out of Scope

- External URL support (issue explicitly defers this)
- JavaScript (pure CSS + Hugo template)
- New dependencies (Bootstrap 5.3.8 + Bootstrap Icons 1.11.3 already loaded via CDN)
