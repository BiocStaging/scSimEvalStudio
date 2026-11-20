# scSimEvalStudio

**`scSimEvalStudio`** is the interactive Shiny graphical interface companion package for **[scSimEval](https://github.com/kabilanbio/scSimEval)** (`SingleCellExperiment`-based benchmarking of single-cell RNA-seq, scATAC-seq, and paired/unpaired multiomics simulations).

## Installation

Install the package from Bioconductor:

```r
if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}
BiocManager::install("scSimEvalStudio")
```

To install the development version from GitHub:

```r
if (!requireNamespace("remotes", quietly = TRUE)) {
    install.packages("remotes")
}
remotes::install_github("kabilanbio/scSimEval")
remotes::install_github("kabilanbio/scSimEvalStudio")
```

## Quick Start

```r
library(scSimEvalStudio)
launch_scSimEval_app()
```

## Development & Support

- **Maintainer:** Kabilan Sakthivel (`kabilan151414@gmail.com`)
- **Documentation:** [https://kabilanbio.github.io/scSimEvalStudio/](https://kabilanbio.github.io/scSimEvalStudio/)
- **Issues:** [https://github.com/kabilanbio/scSimEvalStudio/issues](https://github.com/kabilanbio/scSimEvalStudio/issues)
