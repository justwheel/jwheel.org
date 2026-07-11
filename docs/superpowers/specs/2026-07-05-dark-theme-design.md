# Dark Theme Design

## Problem

Many people are sensitive to bright colors. Toph has no dark mode. The CSS-vars migration (theme PR #57) was built specifically to make this possible without a build-pipeline overhaul.

**GitHub issue:** toph-hugo-theme#56

## Design Goals

- Light and dark are peers — neither is the assumed default, in config naming or in behavior.
- A site can run dark-only, light-only, or both with a switchable toggle.
- Works for any theme user's arbitrary brand colors, not just the two sites configuring it here.

## Config Schema (breaking change, no back-compat shim)

```yaml
params:
  color_mode: auto  # auto | light | dark — defaults to "auto" if unset

  colors:
    light:
      primary: darkorchid
      secondary: linen
      accent: darkslateblue
      background: linen
    dark:
      primary: "#9932CC"
      secondary: "#f5f0fa"
      accent: "#483D8B"
      background: "#121212"

  fonts:
    default: ...   # unchanged — fonts are not mode-specific
```

`colors.primary`/`colors.secondary`/`colors.accent` (flat) are removed entirely. Every site using the theme must migrate to `colors.light.*`; `colors.dark.*` is optional per key, falling back to the matching `colors.light.*` value if unset (a robustness default for incomplete configs, not an implication that light is primary) — **except `background`**, which falls back to the theme's own dark neutral default (`#121212`) rather than to `colors.light.background`. Mirroring light's background into dark would produce a light-mode-colored "dark" site, defeating the point.

**`background` is a 4th color role, distinct from `secondary`.** See Data Architecture below for why this split is required, not just for symmetry.

**`color_mode` behavior:**
- `"light"`: `<html data-bs-theme="light">` hardcoded. Only the light `:root {}` block compiles. No dark CSS is generated, no toggle button, no FOUC-prevention script.
- `"dark"`: mirror image — `<html data-bs-theme="dark">` hardcoded, dark values become the base `:root {}` block, no toggle, no FOUC script.
- `"auto"`: both trees compile. Toggle renders, inline FOUC-prevention script runs, visitor's choice persists in `localStorage` (2-way light/dark toggle; first visit with no saved choice falls back to `prefers-color-scheme`).

## Data Architecture

**`data/style.yaml`:** every existing group (`text`, `border`, `bg`, `nav`, `shadow`) moves under a new `light:` parent, with a parallel `dark:` tree of the same key structure. `admonition:` is handled separately (see Admonition Colors below) since its backgrounds don't fit the formula approach.

**Required fix: `body` background must stop reading `--secondary`.** `_global.css` currently has `body { background-color: var(--secondary); }` — today `--secondary` serves double duty as both the page background *and* the text color used on top of `--primary`/`--accent-color` surfaces (navbar, badges, footer — 28 of its 29 usages in the codebase are `color:`, only this one is `background-color:`). That double duty is invisible in light mode because both roles want a light value. It breaks in dark mode: the page background must go dark while text sitting on the (unchanged, still-vivid) navbar/badge colors must stay light. `_global.css` changes to `background-color: var(--background)`, and `background` becomes its own color role (see Config Schema) — `secondary` keeps its real job, text-on-brand-surfaces.

**Text-role tints for `primary`/`accent-color`, via derived custom properties, not scattered overrides.** `var(--primary)` and `var(--accent-color)` are each used two ways: as literal bold-surface values (`background-color`, `border-color` — badges, buttons, navbar, card accents) and as literal text color (`color` — headings, links, post-meta labels). The bold-surface usages are fine unchanged in dark mode (verified below). The text usages are not — e.g. `#483D8B` directly on `#121212` is ~2.07:1, well under the 4.5:1 requirement. Rather than override each of the ~10–13 individual `color: var(--primary)`/`color: var(--accent-color)` selectors under `[data-bs-theme="dark"] { ... }` (scattered across most component CSS files), introduce two derived custom properties and rename those selectors once, mechanically, to use them:

```css
/* light :root — no adjustment needed, passthrough */
--primary-text: var(--primary);
--accent-text: var(--accent-color);

/* dark :root — lightened for contrast, computed live by the browser */
--primary-text: color-mix(in srgb, var(--primary) 60%, white);
--accent-text: color-mix(in srgb, var(--accent-color) 60%, white);
```

Every existing `color: var(--primary)` becomes `color: var(--primary-text)` (same for accent) — a single mechanical rename, not a design decision made per file. `background-color`/`border-color` usages are untouched.

**`head.html`:**
1. Branch on `$mode := site.Params.color_mode | default "auto"`.
2. Build `$light_vars` from `style.light` + `colors.light.*` + fonts, including the `-text` passthrough lines above — fed into the existing `css.Build` vars mechanism unchanged, producing the base `:root {}` block.
3. If `$mode` is `"auto"` or `"dark"`: build `$dark_vars` from `style.dark` + `colors.dark.*` (falling back to light per-key, except `background` — see Config Schema), emit as a small inline `<style>:root[data-bs-theme="dark"] { --key: value; }</style>` block after the main stylesheet `<link>`. `css.Build`'s `vars` mechanism only supports one `:root {}` block, so this override can't reuse that exact plumbing — the inline block reuses the same dict-flattening pattern already used for `$light_vars`. The `-text` and admonition icon/border lines in this block are `color-mix(in srgb, <light-hex> X%, white)` strings — Hugo string-interpolates the already-known light hex into the function call; no color math happens in Hugo/Go templates, only in the browser.
4. If `$mode == "light"`: skip step 3 entirely — no dark CSS shipped.

## Toggle Component

- Icon button in the navbar, next to the language dropdown (sun/moon, Bootstrap Icons — already loaded via CDN), rendered only when `color_mode == "auto"`.
- Click handler: flips `data-bs-theme` on `<html>` between `"light"`/`"dark"`, saves to `localStorage`, swaps the icon.
- FOUC prevention: a tiny **inline, blocking** script early in `<head>` (before first paint) reads `localStorage`; if unset, falls back to `window.matchMedia('(prefers-color-scheme: dark)')`. Must be inline/blocking, not deferred — an external or async script runs after initial paint and would flash the wrong theme.
- Bootstrap 5.3.8 understands `data-bs-theme` natively — every Bootstrap-driven component (navbar, dropdowns, modals, the tweet-archive lightbox) re-themes automatically with zero extra CSS.

## Color Palette

### Neutral tokens (theme-level, `data/style.yaml`)

Hybrid approach, verified with actual computed WCAG contrast ratios (not eyeballed):

| Token type | Method | Example |
|---|---|---|
| Saturated colors (text, borders, brand colors, admonition icon/border) | `color-mix(in srgb, <light-value> X%, white)` for foreground/text roles; mixed toward black for dark UI-surface roles | `text.body` `#330000` → `color-mix(..., 10%, white)` = `#ebe6e6` (contrast ~15.2:1 vs `#121212`) |
| Near-white pastels (admonition **backgrounds** only) | Hand-picked, NOT formula-derived | See table below |

**Why pastels are the exception:** `color-mix()` toward black only works when the source color has real saturation to preserve. Admonition backgrounds like `#f0f4f8` have R/G/B values within 8 of each other — mixing toward black at 15%, 30%, or even 50% all produce indistinguishable neutral grays (`#242525`, `#48494a`, `#787a7c`), destroying the note/tip/warning/caution/important color-coding. Verified computationally before ruling this out, not assumed.

**Admonition dark backgrounds (hand-picked, hue-matched to each type):**

| Type | Light bg | Dark bg |
|---|---|---|
| note | `#f0f4f8` | `#1a2530` |
| tip | `#f0f6f0` | `#1a2419` |
| warning | `#fef7ed` | `#2e2415` |
| caution | `#fef2f0` | `#2e1b17` |
| important | `#f4f0f8` | `#241f2e` |

**Admonition icon/border colors:** use `color-mix(in srgb, <light-value> 70%, white)`. Verified the unchanged light values against the new dark backgrounds first — icons ranged 2.26:1–3.70:1 (important and caution failing even the 3:1 non-text WCAG minimum), borders ranged 3.79:1–6.24:1 (border-important marginal). The 70%-white mix brings every icon to ≥4.58:1 and keeps borders visually consistent with the lightened icons.

### Brand colors

Both sites keep their light-mode hue family in dark mode, verified per-role (bold UI elements vs. body-sized text have different WCAG thresholds — 3:1 vs 4.5:1). Every text-role tint below uses the **same formula, `color-mix(in srgb, <color> 60%, white)`** — 60% was chosen (over the 70% shown during earlier palette exploration) because it's the lightest round percentage that still clears 4.5:1 for the darkest of the four colors here (exampleSite's cardinal red); using one shared percentage is simpler than tuning a different one per color, and every result below has real margin above 4.5:1, not a razor-thin pass:

**jwheel.org:**
| Role | Value |
|---|---|
| `colors.dark.primary` (bold: navbar bg, badges, buttons, borders) | `#9932CC` (unchanged from light) — ~3.3:1 vs `#121212`, passes 3:1 large/UI threshold |
| `colors.dark.primary` text role (headings, links) | `color-mix(in srgb, #9932CC 60%, white)` = `#C284E0` — ~6.8:1 |
| `colors.dark.accent` (bold role) | `#483D8B` (unchanged) — background-with-secondary-text usage is fine (~9:1 with light secondary text) |
| `colors.dark.accent` text role (h2/h4, post-meta labels, links) | `color-mix(in srgb, #483D8B 60%, white)` = `#918BB9` — corrects ~2.07:1 (fails AA) to ~5.9:1 (passes) |
| `colors.dark.secondary` | Light value (near-white) — text-on-primary/accent-colored surfaces (navbar text, footer text) only, never a background (see Data Architecture) |
| `colors.dark.background` | `#121212` — its own role, independent of `secondary` |

**exampleSite:**
| Role | Value |
|---|---|
| `colors.dark.primary` (bold role) | `#8c1515` (unchanged) |
| `colors.dark.primary` text role | `color-mix(in srgb, #8c1515 60%, white)` = `#BA7373` — corrects ~2:1 (fails) to ~5.2:1 (passes) |
| `colors.dark.accent` (bold role) | `#696349` (unchanged) |
| `colors.dark.accent` text role | `color-mix(in srgb, #696349 60%, white)` = `#A5A192` — ~7.2:1 |
| `colors.dark.secondary` | Light value (`#ffffff`), same reasoning as jwheel.org |
| `colors.dark.background` | `#121212` |

**Deviation from earlier exploration, flagged explicitly:** the visual-companion mockups shown earlier this session used a 70% mix for jwheel.org's accent (`#7F77AE`, ~4.6:1) and hand-picked, non-formula values for exampleSite (`#e8705f`, `#8a7f5a`) chosen before the color-mix() approach existed. Once "Option A" extended color-mix() to brand colors broadly, those exampleSite values needed to become a real mix of `#8c1515`/`#696349` rather than arbitrary hex — and 70% turned out to fail WCAG AA for exampleSite's red specifically (~4.0:1). Standardizing all four on 60% keeps one formula, real margin everywhere, and the same hue family the mockups demonstrated — just slightly lighter than the `#7F77AE` shown earlier.

## Print Stylesheet Interaction

`_print.css` already forces `background-color: #fff; color: #000` regardless of mode (established in PR #62) — dark mode requires no changes there. Printing always renders light, by existing design.

## Files Changed

| File | Action |
|---|---|
| `themes/toph/data/style.yaml` | Restructure: nest existing groups under `light:`, add parallel `dark:` tree |
| `themes/toph/layouts/partials/head.html` | Branch on `color_mode`, build light+dark var dicts, emit dark override `<style>` block conditionally |
| `themes/toph/layouts/partials/nav.html` | Add toggle button (rendered only when `color_mode == "auto"`) |
| `themes/toph/assets/css/base/_global.css` | Fix `body` background to use `--background` instead of `--secondary`; rename its own `color: var(--primary)`/`var(--accent-color)` usages (h1, h2/h4, hanchor hover) to the `-text` variables |
| `themes/toph/assets/css/{base,blog,components,taxonomy}/*.css` (~13 files: `_nav.css`, `_footer.css`, `_recent-posts.css`, `_blog-archive.css`, `_post-nav.css`, `_post-meta.css`, `_hero.css`, `_team.css`, `_tags.css`, `_categories.css`, `_pdf-download.css`, `_tweet-archive.css`, `_terms-controls.css`, `_content.css`) | Mechanical rename: every `color: var(--primary)` / `color: var(--accent-color)` → `color: var(--primary-text)` / `color: var(--accent-text)`. `background-color`/`border-color` usages of the same variables are untouched. |
| `themes/toph/assets/css/components/_asciidoc-admonition.css` | Add dark-mode background/icon/border overrides |
| New: `themes/toph/assets/js/theme-toggle.js` (or inline in a partial) | Toggle click handler + `localStorage` persistence |
| New: inline FOUC-prevention script in `head.html` (early, blocking) | Read `localStorage`/`prefers-color-scheme`, set `data-bs-theme` before paint |
| `themes/toph/exampleSite/config.yaml` | Migrate `colors.*` to `colors.light.*`, add `colors.dark.*` (including new `background` key) |
| `jwheel.org/config.yaml` | Same migration, plus jwheel.org's specific dark values |
| `themes/toph/README.md`, `AGENTS.md` (both repos) | Document the new config schema and breaking change |

## Out of Scope

- Three-way (light/dark/system) toggle — explicitly rejected in favor of a simpler 2-way toggle.
- Per-site dark values for every neutral token (text/border/shadow/nav) — theme ships one dark neutral set via `color-mix()` formulas; not exposed as site-level config.
- Automatic accessibility auditing of user-supplied brand colors for future theme adopters — the `color-mix()` formulas improve typical cases but can't guarantee AA for every arbitrary input color a theme user might choose.
