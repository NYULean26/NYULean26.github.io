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
