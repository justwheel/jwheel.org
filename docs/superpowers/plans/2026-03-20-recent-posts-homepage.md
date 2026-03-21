# Recent Posts on Homepage — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a "Recent Posts" section to the homepage showing the 5 most recent visible blog posts, with a featured card for the latest post and a 4-column grid for the next 4.

**Architecture:** A new Hugo partial (`recent-posts.html`) queries the blog section, filters hidden posts, and renders a featured + grid layout. The partial is called from `index.html` between the bio and projects carousel. CSS lives in `main.css` following existing conventions.

**Tech Stack:** Hugo templates, Bootstrap 5, CSS Grid, vanilla HTML/CSS

**Spec:** `docs/superpowers/specs/2026-03-20-recent-posts-homepage-design.md`

---

### Task 1: Create the recent-posts partial

**Files:**
- Create: `themes/toph/layouts/partials/recent-posts.html`

- [ ] **Step 1: Create the partial with filtering and featured card**

```html
{{/*
    recent-posts.html — Recent blog posts for the homepage

    Shows the 5 most recent visible blog posts: the latest as a
    featured card, the next 4 in a compact grid. Only renders if
    visible blog posts exist.

    Posts with hide_sitemap: true are excluded so hidden content
    (e.g., desk-drawer category) never appears on the homepage.

    Called from index.html between the bio and projects carousel.
*/}}

{{/* Build filtered list of visible blog posts */}}
{{- $posts := slice -}}
{{- range where .Site.RegularPages "Section" "blog" -}}
    {{- if not .Params.hide_sitemap -}}
        {{- $posts = $posts | append . -}}
    {{- end -}}
{{- end -}}
{{- $posts = $posts | sort ".Date" "desc" | first 5 -}}

{{ if $posts }}
<section class="recent-posts">
    <h2>Recent Posts</h2>

    {{/* Featured card — most recent post */}}
    {{ with index $posts 0 }}
    <div class="recent-featured">
        <div class="recent-featured-label">Latest Post</div>
        {{/*
            htmlUnescape converts HTML entities (e.g., "&amp;" → "&",
            "&rsquo;" → "'") so titles render as plain text, not escaped strings.
        */}}
        <a class="recent-featured-title" href="{{ .Permalink }}">{{ .Title | htmlUnescape }}</a>
        <time class="recent-featured-date" datetime="{{ .Date.Format "2006-01-02" }}">
            {{- .Date.Format "2006 January 02" -}}
        </time>
        {{ with .Params.description | default (.Plain | htmlUnescape | truncate 250) }}
        <p class="recent-featured-excerpt">{{ . }}</p>
        {{ end }}
    </div>
    {{ end }}

    {{/* Secondary posts — next 4 in a grid */}}
    {{ if gt (len $posts) 1 }}
    <div class="recent-grid">
        {{ range after 1 $posts }}
        <div class="recent-card">
            <a class="recent-card-title" href="{{ .Permalink }}">{{ .Title | htmlUnescape }}</a>
            <time class="recent-card-date" datetime="{{ .Date.Format "2006-01-02" }}">
                {{- .Date.Format "2006 January 02" -}}
            </time>
            {{ with .Params.description | default (.Plain | htmlUnescape | truncate 140) }}
            <p class="recent-card-excerpt">{{ . }}</p>
            {{ end }}
        </div>
        {{ end }}
    </div>
    {{ end }}

    <div class="recent-view-all">
        <a href="{{ "blog/" | relURL }}">View all posts →</a>
    </div>
</section>
{{ end }}
```

- [ ] **Step 2: Verify Hugo builds cleanly**

Run: `hugo` in the exampleSite directory (or jwheel.org root)
Expected: No template parsing errors. The partial won't render yet since index.html doesn't call it.

- [ ] **Step 3: Commit**

```
git add layouts/partials/recent-posts.html
```

Commit message:
```
✨ blog: Add recent posts partial for homepage

Add a reusable partial that displays the 5 most recent visible blog
posts on the homepage. The latest post gets a featured card with
excerpt, and the next 4 appear in a compact grid. Posts with
hide_sitemap: true are excluded.

The partial is not yet called from index.html — integration follows
in a separate commit.
```

---

### Task 2: Add CSS for recent posts section

**Files:**
- Modify: `themes/toph/assets/css/main.css` (append new section at end)

- [ ] **Step 1: Add the recent posts CSS section**

Append after the last CSS rule in `main.css`:

```css


/* ===[ Homepage: Recent posts (layouts/partials/recent-posts.html) ]=== */

.recent-posts {
  margin: 2.5rem 0;
}

.recent-posts h2 {
  font-family: var(--header-font), serif;
  font-size: 1.6rem;
  margin-bottom: 1.25rem;
}

/* Featured card — the most recent post */
.recent-featured {
  border: 1px solid #e0ddd5;
  border-left: 4px solid var(--primary);
  border-radius: 4px;
  padding: 1.25rem;
  background: #fff;
  margin-bottom: 1.5rem;
}

.recent-featured-label {
  font-size: 0.7rem;
  color: var(--primary);
  text-transform: uppercase;
  letter-spacing: 0.08em;
  margin-bottom: 0.25rem;
}

.recent-featured-title {
  display: block;
  font-size: 1.2rem;
  font-weight: 600;
  color: var(--primary);
  text-decoration: underline;
  text-decoration-thickness: 2px;
  text-underline-offset: 0.15em;
}

.recent-featured-title:hover {
  color: var(--accent-color);
  text-decoration-thickness: 3px;
}

.recent-featured-date {
  display: block;
  color: #888;
  font-size: 0.8rem;
  margin-top: 0.25rem;
}

.recent-featured-excerpt {
  color: #555;
  font-size: 0.9rem;
  margin-top: 0.5rem;
  line-height: 1.5;
}

/* Secondary posts grid — 4 columns */
.recent-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 1rem;
}

.recent-card {
  border: 1px solid #e0ddd5;
  border-radius: 4px;
  padding: 1rem;
  background: #fff;
  display: flex;
  flex-direction: column;
}

.recent-card-title {
  font-size: 0.9rem;
  font-weight: 600;
  color: var(--primary);
  text-decoration: none;
}

.recent-card-title:hover {
  color: var(--accent-color);
  text-decoration: underline;
}

.recent-card-date {
  color: #888;
  font-size: 0.75rem;
  margin-top: 0.25rem;
}

.recent-card-excerpt {
  color: #555;
  font-size: 0.8rem;
  line-height: 1.4;
  margin-top: 0.5rem;
  flex: 1;
}

/* "View all posts" link */
.recent-view-all {
  text-align: center;
  margin-top: 1.25rem;
}

.recent-view-all a {
  color: var(--accent-color);
  font-size: 0.9rem;
  text-decoration: none;
  border-bottom: 1px dashed var(--accent-color);
}

.recent-view-all a:hover {
  color: var(--primary);
  border-bottom-color: var(--primary);
}

/* On mobile, stack secondary posts vertically */
@media screen and (max-width: 600px) {
  .recent-grid {
    grid-template-columns: 1fr;
  }
}
```

- [ ] **Step 2: Verify Hugo builds cleanly**

Run: `hugo` — no errors expected.

- [ ] **Step 3: Commit**

```
git add assets/css/main.css
```

Commit message:
```
💄 blog: Add CSS for recent posts homepage section

Style the recent posts partial with a featured card (primary left
border, underlined title), 4-column secondary grid, and centered
"view all" link. Stacks to single column on mobile.
```

---

### Task 3: Integrate partial into index.html

**Files:**
- Modify: `themes/toph/layouts/index.html` (add partial call on line 10, before projects-carousel)

- [ ] **Step 1: Add the partial call to index.html**

Insert `{{ partial "recent-posts.html" . }}` between `{{ .Site.Home.Content }}` (line 9) and `{{ partial "projects-carousel.html" . }}` (line 10):

```html
{{ define "main" }}
  {{ if .Site.Home.Content }}
    <span class="rounded-profile">
      <img src="{{ index $.Site.Params.images 0 }}" alt="{{ i18n "index.rounded_profile_image" }} {{ $.Site.Params.biography.name }}" title="{{ i18n "index.rounded_profile_image" }} {{ $.Site.Params.biography.name }}">
    </span>
    {{ if .Param "hire_me" }}
      {{ partial "for-hire.html" . }}
    {{ end }}
    {{ .Site.Home.Content }}
    {{ partial "recent-posts.html" . }}
    {{ partial "projects-carousel.html" . }}
    {{ partial "projects.html" . }}
  {{ else }}
    <h2>{{ i18n "index.default.header" | safeHTML }}</h2>
    <p>{{ i18n "index.default.body" | safeHTML }}</p>
    <ol>
      <li>{{ i18n "index.default.customize_step1" | safeHTML }}</li>
      <li>{{ i18n "index.default.customize_step2" | safeHTML }}</li>
      <li>{{ i18n "index.default.customize_step3" | safeHTML }}</li>
    </ol>
  {{ end }}
{{ end }}
```

- [ ] **Step 2: Verify Hugo builds and renders correctly**

Run: `hugo server` and check the homepage. The recent posts section should appear between the bio and projects carousel. Verify:
- Featured card shows the most recent visible blog post
- 4 secondary cards show in a row on desktop
- Posts with `hide_sitemap: true` do not appear
- "View all posts →" link points to `/blog/`

- [ ] **Step 3: Commit**

```
git add layouts/index.html
```

Commit message:
```
✨ blog: Integrate recent posts into homepage layout

Call the recent-posts partial from index.html between the bio text
and projects carousel. The section only renders when visible blog
posts exist in the blog section.
```
