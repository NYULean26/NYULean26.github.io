# Computer-Assisted Formalization of Mathematics

Source for the [Fall 2026 NYU course website](https://nyulean26.github.io/).

- DS-GA 3001 · 007 / MATH-GA 2650
- Instructor: Jaume de Dios Pont
- Generated with [Verso](https://github.com/leanprover/verso) and Lean 4

## Build locally

Install [elan](https://github.com/leanprover/elan), then run:

```sh
lake build
lake exe generate-site
python3 -m http.server 8000 -d _site
```

Open <http://localhost:8000>. The committed `lake-manifest.json` pins the dependency
graph, so `lake update` is only for an intentional dependency upgrade.

## Source tour

The modules form a one-way pipeline:

```text
Model → Content → Components → Home → Site ─┐
          └──────────────→ Theme ───────────┴→ Course → Main
```

- [`Course/Model.lean`](Course/Model.lean) defines the course-domain types without depending on Verso or HTML.
- [`Course/Content.lean`](Course/Content.lean) contains the semester facts: meetings, readings, books, and staff information.
- [`Course/Components.lean`](Course/Components.lean) renders the repeated, data-driven parts as semantic HTML.
- [`Course/Home.lean`](Course/Home.lean) is the actual Verso document. Its order matches the visible page, so ordinary prose edits belong here.
- [`Course/Theme.lean`](Course/Theme.lean) owns the document shell, course header, and footer.
- [`Course/Site.lean`](Course/Site.lean) connects the home page and static assets.
- [`Course.lean`](Course.lean) is the public umbrella for the site and theme.
- [`Main.lean`](Main.lean) pairs them in the executable entry point.
- [`assets/styles.css`](assets/styles.css) and the light/dark browser favicons are the hand-written static assets.

To attach a worksheet or lecture file to a meeting, add a `ResourceLink` to that
meeting's `materials` array. Course-work entries already accept an optional URL.

## Deployment

Pushing `main` runs the pinned Lean and Verso build, uploads `_site/`, and deploys the
organization's root GitHub Pages site. Generated files are intentionally not committed.
