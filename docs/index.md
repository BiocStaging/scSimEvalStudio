# scSimEvalStudio: Interactive Shiny App for Single-Cell Simulation Benchmarking

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Documentation](https://img.shields.io/badge/docs-pkgdown-blue.svg)](https://kabilanbio.github.io/scSimEvalStudio/)
[![Core
Engine](https://img.shields.io/badge/scSimEval-v0.99.18-2c3e50.svg)](https://kabilanbio.github.io/scSimEval/)

------------------------------------------------------------------------

## Welcome to `scSimEvalStudio`

**`scSimEvalStudio`** (version `0.99.9`) is the beginner-friendly,
point-and-click **Shiny web application** companion to
**[`scSimEval`](https://kabilanbio.github.io/scSimEval/)**.

It lets you compare single-cell **RNA-seq**, **ATAC-seq**, and
**multiomics** simulation methods right in your browser—**without
writing plotting or analysis code**. You can try built-in example
datasets with one click, upload your own `.rds` files, zoom into
interactive charts, and export ready-to-use tables and
publication-quality figures.

> **Looking for the statistical methods, full 56-metric catalog, or R
> scripting tutorials?** Visit the **[scSimEval Core Package
> Documentation](https://kabilanbio.github.io/scSimEval/)**.

------------------------------------------------------------------------

## Get Started in 3 Simple Steps

### Step 1: Install `scSimEvalStudio`

Install from Bioconductor:

\
`if`` ``(``!`[`requireNamespace`](https://rdrr.io/r/base/ns-load.html)`(``"BiocManager"``, quietly ``=`` ``TRUE``)``)`` ``{`\
`    `[`install.packages`](https://rdrr.io/r/utils/install.packages.html)`(``"BiocManager"``)`\
`}`\
`BiocManager``::`[`install`](https://bioconductor.github.io/BiocManager/reference/install.html)`(`[`c`](https://rdrr.io/r/base/c.html)`(``"scSimEval"``, ``"scSimEvalStudio"``)``)`

Or install the latest development versions from GitHub:

\
`if`` ``(``!`[`requireNamespace`](https://rdrr.io/r/base/ns-load.html)`(``"remotes"``, quietly ``=`` ``TRUE``)``)`` ``{`\
`    `[`install.packages`](https://rdrr.io/r/utils/install.packages.html)`(``"remotes"``)`\
`}`\
`remotes``::`[`install_github`](https://remotes.r-lib.org/reference/install_github.html)`(``"kabilanbio/scSimEval"``)`\
`remotes``::`[`install_github`](https://remotes.r-lib.org/reference/install_github.html)`(``"kabilanbio/scSimEvalStudio"``)`

### Step 2: Launch the App

\
[`library`](https://rdrr.io/r/base/library.html)`(`[`scSimEvalStudio`](https://kabilanbio.github.io/scSimEvalStudio/)`)`\
\
`# Launches the Shiny studio on a local port with a 10 GiB upload limit`\
[`launch_scSimEval_app`](https://kabilanbio.github.io/scSimEvalStudio/reference/launch_scSimEval_app.md)`(``)`

### Step 3: Explore or Upload Your Data

1.  Open the **Data Hub** tab and click a **1-click built-in example
    dataset** (Rice Bud or Soybean Root) to try the app immediately—no
    data preparation needed.
2.  When ready to benchmark your own data, upload your real reference
    `.rds` file and one or more simulated `.rds` files
    (`SingleCellExperiment` or `Seurat` objects—`Seurat` objects are
    converted automatically).
3.  Switch to **Comparative Bubble Matrix**, **Visualizations**, and
    **Benchmark Results & Export** to rank simulators and download your
    figures and Excel reports.

------------------------------------------------------------------------

## Inside the Shiny Studio (At a Glance)

| Tab | What You Can Do |
|:---|:---|
| **1. Home** | Quick overview of the studio and a 1-click button to jump straight to **Data Hub**. |
| **2. Data Hub** | Load built-in example benchmarks, upload your own `.rds` datasets (scRNA-seq, scATAC-seq, or paired/unpaired multiomics), reload saved `.rds`/`.csv` results, or download a ready-to-run R script for large cluster jobs. |
| **3. Comparative Bubble Matrix** | Visually see which simulator performs best—**larger circles and scores closer to 1.0 mean a closer match to your real data**, and a **bold outline** marks the top simulator per metric. Includes a ranked **Fidelity Leaderboard** table. |
| **4. Visualizations** | Explore 8 interactive chart tabs (Summary Bars, Distribution QC, Metric Heatmap, Metric Plots, PCA & MDS Maps, UMAP/t-SNE/PCA Cell Embeddings, and Runtime/RAM Scalability) with zoom, pan, fullscreen view, and 600 DPI exports. |
| **5. Benchmark Results & Export** | Search and filter the complete scores table, and download everything as an **Excel workbook (`.xlsx`)**, **`.csv`**, or reusable **`.rds`** session file. |
| **6. Help & Getting Started** | Built-in beginner guide, workflow overview, and copy-paste tips right inside the app. |
| **7. Logs** | Live progress tracker showing what the app is running in real time, with search and `.txt` log download. |
| **8. Contact** | Research team details and issue-reporting links. |

------------------------------------------------------------------------

## Step-by-Step Guide & Further Reading

- **Shiny App Walkthrough:** Read the **[Architecture & Studio
  Guide](https://kabilanbio.github.io/scSimEvalStudio/articles/scSimEvalStudio-workflow.html)**
  for a simple, tab-by-tab tour of the app.
- **Metrics & R Workflows:** Visit the **[scSimEval Core
  Documentation](https://kabilanbio.github.io/scSimEval/)** for full
  metric explanations, statistical methodology, and R code tutorials.

------------------------------------------------------------------------

## Development & Support

`scSimEvalStudio` is developed and maintained at the **Division of
Agricultural Bioinformatics, ICAR-Indian Agricultural Statistics
Research Institute (ICAR-IASRI), New Delhi, India**.

- **Maintainer:** Kabilan Sakthivel (`kabilan151414@gmail.com`)
- **Bug Reports & Feature Requests:**
  <https://github.com/kabilanbio/scSimEvalStudio/issues>
