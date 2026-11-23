# scSimEvalStudio Documentation Guidelines

When creating or updating documentation for `scSimEvalStudio`
(`README.md`, `vignettes/`, `_pkgdown.yml`, `docs/`): 1.
**Beginner-Friendly & Plain English**: Write for bench biologists and
first-time Shiny users; avoid intimidating mathematical equations (no
LaTeX/MathML formulas) and heavy statistical jargon. 2. **Shiny-App
Focus Only**: Document how to install, launch
([`launch_scSimEval_app()`](https://kabilanbio.github.io/scSimEvalStudio/reference/launch_scSimEval_app.md)),
load data, read visual outputs, and export results inside the GUI. 3.
**No Redundancy with `scSimEval`**: Do not duplicate the 56-metric
catalog, statistical derivations, normalization equations, or R
programmatic tutorials already documented at
`https://kabilanbio.github.io/scSimEval/`. 4. **Inline Core Docs Link
Only**: Reference `https://kabilanbio.github.io/scSimEval/` via clean
inline links inside the body text; do **not** add a separate top-level
navbar tab for `scSimEval Core Docs`.
