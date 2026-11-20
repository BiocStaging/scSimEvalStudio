# Beginner's Guide to scSimEvalStudio

## 1. Welcome to `scSimEvalStudio`

**`scSimEvalStudio`** (version `0.99.3`) is a **point-and-click Shiny
web app** built to make single-cell and multiomics simulation
benchmarking simple and accessible—even if you are brand new to R.

Instead of writing scripts to run metrics and format dozens of plots,
`scSimEvalStudio` gives you a clean browser workspace where you can:

- Try **1-click example datasets** immediately to learn how the app
  works.
- Upload your own **scRNA-seq**, **scATAC-seq**, or **multiomics**
  `.rds` datasets (`SingleCellExperiment` or `Seurat`).
- Compare simulators visually on an easy **0 to 1 scale** (where
  **1.0 = best match** to your real dataset).
- Zoom, pan, customize, and download **600 DPI figures**, **Excel
  workbooks**, and **reproducible R scripts**.

> **Want the full metric definitions, statistical details, or R
> programming tutorials?** All underlying evaluation methods are
> documented separately on the **[scSimEval Core Package
> Documentation](https://kabilanbio.github.io/scSimEval/)**.

![Overview of the 4 simple stages inside scSimEvalStudio](../workflow_diagram.png)

------------------------------------------------------------------------

## 2. Step 1 — Install and Open the App

### Install from Bioconductor

``` r
if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}
BiocManager::install(c("scSimEval", "scSimEvalStudio"))
```

### Or Install from GitHub

``` r
if (!requireNamespace("remotes", quietly = TRUE)) {
    install.packages("remotes")
}
remotes::install_github("kabilanbio/scSimEval")
remotes::install_github("kabilanbio/scSimEvalStudio")
```

### Launch the Shiny Studio

``` r
library(scSimEvalStudio)
launch_scSimEval_app()
```

Your default web browser will open automatically. By default, the app
allows uploads up to **10 GiB** so large single-cell `.rds` files can be
loaded locally without errors.

------------------------------------------------------------------------

## 3. Step 2 — Load Data in the Data Hub Tab

When the app opens, click **Data Hub** in the top bar. You have **4 easy
options**:

1. **Try a 1-Click Example Dataset (Recommended for Beginners)** —
   Choose an included empirical benchmark (Rice Bud with 6 simulators or
   Soybean Root with 3 simulators) to populate every chart and table in
   seconds.
2. **Upload Your Own Single-Cell Data (`scRNA-seq` or `scATAC-seq`)** —
   Upload your real reference `.rds` file along with one or more
   simulated `.rds` files. Both `SingleCellExperiment` and `Seurat`
   `.rds` files are accepted (`Seurat` objects are converted
   automatically).
3. **Upload Multiomics Data (RNA + ATAC)** — Choose **Paired** (same
   cells) or **Unpaired** (separate cells from the same tissue), upload
   your `.rds` files, and click **Run**.
4. **Reload Previously Saved Results (`.rds` or `.csv`)** — Upload any
   previously saved benchmark archive to explore and customize plots
   instantly without waiting for calculations to run again.

> **Tip for Very Large Datasets:** After configuring your files in
> **Data Hub**, click **Download R Script** to save a ready-to-run
> script for a lab workstation or HPC server, then upload the saved
> `.rds` output back into **Data Hub**.

------------------------------------------------------------------------

## 4. Step 3 — Compare Simulators at a Glance

Open the **Comparative Bubble Matrix** tab to see how your simulators
rank:

- **How to Read the Scores:** Every metric is shown on a simple **0.0 to
  1.0 scale**, where **closer to 1.0 means a closer match** to your real
  biological dataset.
- **Comparative Bubble Matrix Figure:** The left bars show overall and
  category averages; the right grid shows individual metrics as circles.
  **Bigger circles = better scores**, and a **bold black outline**
  highlights the top-performing simulator for each metric.
- **Fidelity Leaderboard:** Switch to the second sub-tab for a clean,
  sortable ranking table that you can download as a `.csv` file.
- **Easy Filtering:** Filter by dataset, modality, simulators, or
  categories, and adjust width and height before downloading.

------------------------------------------------------------------------

## 5. Step 4 — Explore Interactive Charts (Visualizations Tab)

The **Visualizations** tab provides **8 focused chart views**:

| Sub-Tab | What It Helps You See |
|:---|:---|
| **1. Evaluation Summary** | Overall and category-level bar charts and radar profiles comparing all simulators side by side. |
| **2. Distribution QC** | Visual checks showing whether simulated library sizes, gene/peak averages, and zero counts match your real data. |
| **3. Metric Heatmap** | Color-coded matrix displaying all simulator scores together in one view (switch between 0–1 scores and raw values). |
| **4. Metric Plots** | Zoom in on any single metric bar chart or compare simulator spread across a category using boxplots. |
| **5. PCA Ordination** | Simple 2D map showing which simulators sit closest to the **Ideal Reference** target. |
| **6. MDS Metric Space** | Visual map grouping simulators that behave similarly across evaluation metrics. |
| **7. Cell Embeddings (UMAP, t-SNE & PCA)** | Side-by-side or overlaid 2D cell plots colored by cell type, batch, or library size, plus a clean cluster quality summary table. |
| **8. Scalability Benchmark** | Compare simulator speed (runtime) and memory usage (RAM) with selectable units (seconds, minutes, MB, GB, or per-core). |

### Interactive Zoom, Pan & Publication Downloads

- **Zoom & Pan Toolbar:** Zoom smoothly from **25% to 400%**, drag to
  pan around large figures, or click **Full View** for fullscreen
  inspection.
- **High-Resolution Downloads:** Save any chart as a **600 DPI JPEG** or
  **Vector PDF**.
- **1-Click R Script Export:** Download a standalone `ggplot2` R script
  for any figure to customize colors or labels in R later.

------------------------------------------------------------------------

## 6. Step 5 — Export Results, Monitor Progress & Get Help

- **Benchmark Results & Export:** Search and filter the master results
  table, and download a formatted **Excel workbook (`.xlsx`)**,
  **`.csv`** table, or full **`.rds`** session backup.
- **Logs:** Watch live progress messages (`INFO`, `WARNING`, `SUCCESS`)
  while benchmarks run, filter messages by type, or download a `.txt`
  log file.
- **Help & Contact:** Quick in-app tips, file format checklists, and
  contact details for the development team at ICAR-IASRI, New Delhi.

------------------------------------------------------------------------

## 7. Quick Verification (For Package Testing)

``` r
library(scSimEvalStudio)

app_dir <- system.file("shiny", "scSimEvalApp", package = "scSimEvalStudio")
dir.exists(app_dir)
#> [1] TRUE

app <- shiny::shinyAppDir(app_dir)
class(app)
#> [1] "shiny.appobj"

demo_file <- file.path(app_dir, "data", "demo_benchmark_data.rds")
demo_obj <- readRDS(demo_file)
demo_obj$methods
#> [1] "scMultiSim" "scDesign3"  "MOSim"      "scCross"    "scMoMtF"    "Matilda"
```
