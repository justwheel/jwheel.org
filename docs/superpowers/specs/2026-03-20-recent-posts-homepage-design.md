# Recent Posts on Homepage — Design Spec

## Summary

Add a "Recent Posts" section to the homepage that shows the 5 most recent visible blog posts between the bio text and the projects carousel.

## Placement

In `layouts/index.html`, the partial is called between `.Content` (bio) and `projects-carousel.html`. The section only renders if visible blog posts exist.

## Layout

### Featured Post (Most Recent)

- Full-width card with primary-colored left border (`4px solid var(--primary)`)
- "Latest Post" label (uppercase, small, primary color)
- Linked title (primary color, underline, `htmlUnescape`)
- Date in `2006 January 02` format
- Excerpt: `.Plain | htmlUnescape | truncate 250`

### Secondary Posts (Next 4)

- 4-column CSS grid (`grid-template-columns: repeat(4, 1fr)`)
- Each card: linked title, date, excerpt (`.Plain | htmlUnescape | truncate 140`)
- Cards use `flex-direction: column` for uniform height
- Stacks to single column on mobile (`max-width: 600px`)

### Footer

- Centered "View all posts →" link pointing to `/blog/`

## Filtering

Posts with `hide_sitemap: true` in front matter are excluded. The query filters on `hide_sitemap` before selecting the 5 most recent posts. This ensures hidden content (e.g., desk-drawer posts) never appears on the homepage, even if they are the newest.

## Files

- **New:** `layouts/partials/recent-posts.html` — the partial
- **New:** CSS section in `assets/css/main.css` — recent posts styles
- **Modified:** `layouts/index.html` — add partial call between bio and projects carousel

## Template Logic

```
1. Get all pages from the "blog" section
2. Filter out pages with hide_sitemap: true
3. Sort by date descending
4. Take the first 5
5. Render post 1 as featured card
6. Render posts 2-5 as secondary grid cards
7. Render "View all posts" link
```

Guard the entire section with a check that the filtered list is non-empty.

## CSS Patterns

- Reuse existing design language: `#e0ddd5` borders, `var(--primary)` accents, `term-excerpt` class for muted text
- Follow `/* ===[ Section Name ]=== */` comment convention
- Mobile breakpoint at `max-width: 600px` consistent with rest of theme

## i18n

No new i18n keys needed — the section uses static English text ("Recent Posts", "Latest Post", "View all posts →"). i18n for these labels can be added in Phase 4 (Supporting Infrastructure) when other i18n strings are addressed.

## What This Does NOT Do

- No pagination — always exactly 5 posts
- No archive page — that is a separate Phase 3 deliverable
- No navbar changes — discoverability via navigation is deferred
