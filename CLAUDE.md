# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Single-file static landing page for **Vimmai Creative Oy**, a Finnish creative agency based in Helsinki. The entire site lives in `index.html` — no build tools, no dependencies, no package manager.

To preview: open `index.html` directly in a browser, or run a local server:
```bash
python3 -m http.server 8080
```

## Architecture

All HTML, CSS, and JavaScript are embedded in `index.html`:

- **CSS** (lines ~7–342): CSS custom properties for theming in `:root`. Light theme with `--bg`, `--surface`, `--border`, `--accent` (`#8b5cf6`), `--accent2` (`#3b82f6`), `--text`, `--muted`.
- **HTML sections** (lines ~344–447): `nav` → `.hero` → `#palvelut` → `.vimmai-palvelut` → `.stats#luvut` → `.referenssit#referenssit` → `.cta-section#yhteystiedot` → `footer`
- **JavaScript particle system** (lines ~449–589): Canvas-based animated particles in the hero. Mouse repulsion, velocity damping, gradient colour lerp between `COLOR_A`/`COLOR_B`. Pure `requestAnimationFrame` loop, no external libraries.

## Known Issues (from `raportti.md`)

- **Mobile nav is broken** — nav `<ul>` is hidden at ≤700 px with no hamburger menu replacement
- **No contact form** — CTA section only has a `mailto:` link
- **Missing SEO meta tags** — no `<meta name="description">`, Open Graph, or Schema.org JSON-LD
- **No `prefers-reduced-motion` support** — particle animation runs regardless of OS accessibility setting
- **Accessibility gaps** — missing `<main>`, `aria-hidden` on canvas/emoji icons, no skip-link
- **Placeholder social links** — footer Instagram/LinkedIn/Behance all point to `href="#"`
- **Typo** — "Mobiilioptimointu" should be "Mobiilioptimoitu" (in the Vimmai palvelut section)
