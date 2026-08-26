# Computer-Assisted Formalization of Mathematics

Course website for **Computer-Assisted Formalization of Mathematics**, taught at New York University in Fall 2026. The linked books and Lean materials are public and may also be used for independent study.

- DS-GA 3001 · Section 007: Special Topics in Data Science
- MATH-GA 2650: Advanced Topics in Analysis
- Instructor: Jaume de Dios Pont

The website is generated with [Verso](https://github.com/leanprover/verso): its schedule and reading catalog are typed Lean data, the page template is written in Lean, and GitHub Actions builds and deploys the result.

## Build and preview locally

Install [elan](https://github.com/leanprover/elan), then run:

```sh
lake update
lake build
lake exe generate-site
python3 -m http.server 8000 -d _site
```

Then open <http://localhost:8000>.

## Update the site

Meeting dates, weekly topics, readings, and book links live in `Course/Data.lean`. The Verso page and theme live in `Course/FrontPage.lean` and `Main.lean`; visual styles live in `assets/`.

Pushing to the `main` branch runs the pinned Lean 4 + Verso build and republishes the generated `_site/` artifact with GitHub Pages.

## Status

The Fall 2026 course plan is still in progress. Lecture files, course-specific worksheets, project dates, the lab room, and TA office hours remain forthcoming.
