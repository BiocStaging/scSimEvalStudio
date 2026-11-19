# Interactive Single-Cell Simulation Benchmarking with scSimEvalStudio

## Introduction

**`scSimEvalStudio`** provides the interactive Shiny graphical studio
companion for **`scSimEval`**. While `scSimEval` focuses cleanly on
Bioconductor programmatic evaluation across `SingleCellExperiment`
objects and reproducibility pipelines, `scSimEvalStudio` exposes
point-and-click dataset uploads, real-time evaluation progress logs,
pre-saved `.rds` exploration, interactive zoomable plots, and
Excel/figure exports.

## Launching the Shiny Studio

After installing both `scSimEval` and `scSimEvalStudio`, launch the
interactive studio from R:

``` r
library(scSimEvalStudio)
launch_scSimEval_app()
```

By default,
[`launch_scSimEval_app()`](https://kabilanbio.github.io/scSimEvalStudio/reference/launch_scSimEval_app.md)
configures `shiny.maxRequestSize` to 10 GiB (`10 * 1024^3`) so large
multiomics `.rds` archives can be loaded locally.

## Verifying Application Initialization

In automated or non-interactive environments, you can confirm that the
bundled Shiny application initializes cleanly and inspects the bundled
demonstration benchmark dataset:

``` r
library(scSimEvalStudio)

app_dir <- system.file("shiny", "scSimEvalApp", package = "scSimEvalStudio")
dir.exists(app_dir)
#> [1] TRUE

app <- shiny::shinyAppDir(app_dir)
#> Loading required package: shiny
#> 
#> Attaching package: 'bslib'
#> The following object is masked from 'package:utils':
#> 
#>     page
#> 
#> Attaching package: 'DT'
#> The following objects are masked from 'package:shiny':
#> 
#>     dataTableOutput, renderDataTable
class(app)
#> [1] "shiny.appobj"

demo_file <- file.path(app_dir, "data", "demo_benchmark_data.rds")
demo_obj <- readRDS(demo_file)
names(demo_obj)
#> [1] "benchmark_df"            "benchmark_summary_table"
#> [3] "dataset_summary_df"      "methods"
head(demo_obj$benchmark_summary_table[, c("Method", "Category", "Metric", "Score")], 6)
#>                  Method                      Category         Metric     Score
#> scMultiSim.1 scMultiSim (I) Distributional Properties    Wasserstein 0.7190470
#> scMultiSim.2 scMultiSim (I) Distributional Properties             KS 0.5516079
#> scMultiSim.3 scMultiSim (I) Distributional Properties            MAD 0.0000000
#> scMultiSim.4 scMultiSim (I) Distributional Properties  Bhattacharyya 0.5304023
#> scMultiSim.5 scMultiSim (I) Distributional Properties Runs_Statistic 0.7451238
#> scMultiSim.6 scMultiSim (I) Distributional Properties    NN_Mismatch 0.6441069
```

## Bioconductor Ecosystem Integration

`scSimEvalStudio` accepts `SingleCellExperiment` objects (including
multi-modal `SingleCellExperiment` objects with `altExp` assays and
`colData` annotations `cell_type` and `batch`) evaluated directly by
[`scSimEval::evaluate_simulation_accuracy()`](https://kabilanbio.github.io/scSimEval/reference/evaluate_simulation_accuracy.html)
and
[`scSimEval::evaluate_multiomics_accuracy()`](https://kabilanbio.github.io/scSimEval/reference/evaluate_multiomics_accuracy.html).

## Session Information

``` r
sessionInfo()
#> R version 4.6.2 (2026-10-29)
#> Platform: x86_64-pc-linux-gnu
#> Running under: Ubuntu 24.04.5 LTS
#> 
#> Matrix products: default
#> BLAS:   /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.12.0 
#> LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.12.0  LAPACK version 3.12.0
#> 
#> locale:
#>  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
#>  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
#>  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
#>  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
#>  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
#> [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
#> 
#> time zone: Asia/Kolkata
#> tzcode source: system (glibc)
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> other attached packages:
#> [1] scSimEval_0.99.11      Matrix_1.7-6           DT_0.34.0             
#> [4] ggplot2_4.0.4          bslib_0.12.0           shiny_1.14.0          
#> [7] scSimEvalStudio_0.99.0
#> 
#> loaded via a namespace (and not attached):
#>   [1] RColorBrewer_1.1-3          jsonlite_2.0.0             
#>   [3] magrittr_2.0.5              farver_2.1.2               
#>   [5] rmarkdown_2.32              fs_2.1.0                   
#>   [7] ragg_1.5.2                  vctrs_0.7.3                
#>   [9] memoise_2.0.1               htmltools_0.5.9            
#>  [11] S4Arrays_1.12.1             SparseArray_1.12.3         
#>  [13] sass_0.4.10                 sctransform_0.4.3          
#>  [15] parallelly_1.50.0           KernSmooth_2.23-27         
#>  [17] fontawesome_0.5.3           htmlwidgets_1.6.4          
#>  [19] desc_1.4.3                  ica_1.0-3                  
#>  [21] plyr_1.8.9                  plotly_4.12.1              
#>  [23] cachem_1.1.0                igraph_2.3.4               
#>  [25] mime_0.13                   lifecycle_1.0.5            
#>  [27] pkgconfig_2.0.3             R6_2.6.1                   
#>  [29] fastmap_1.2.0               MatrixGenerics_1.24.0      
#>  [31] future_1.82.0               digest_0.6.39              
#>  [33] patchwork_1.3.2             S4Vectors_0.50.3           
#>  [35] Seurat_6.0.0                RSpectra_0.16-2            
#>  [37] irlba_2.4.1                 crosstalk_1.2.2            
#>  [39] textshaping_1.0.5           GenomicRanges_1.64.0       
#>  [41] progressr_1.1.0             httr_1.4.9                 
#>  [43] abind_1.4-8                 compiler_4.6.2             
#>  [45] withr_3.0.3                 S7_0.2.2                   
#>  [47] bsicons_0.1.2               BiocParallel_1.46.0        
#>  [49] fastDummies_1.7.6           MASS_7.3-66                
#>  [51] DelayedArray_0.38.2         ggsci_5.2.0                
#>  [53] tools_4.6.2                 otel_0.3.0                 
#>  [55] zip_3.0.2                   httpuv_1.6.17              
#>  [57] future.apply_1.21.0         glue_1.8.1                 
#>  [59] promises_1.5.0              grid_4.6.2                 
#>  [61] Rtsne_0.17                  cluster_2.1.8.3            
#>  [63] reshape2_1.4.5              generics_0.1.4             
#>  [65] gtable_0.3.6                tidyr_1.3.2                
#>  [67] data.table_1.18.6.1         sp_2.2-4                   
#>  [69] XVector_0.52.0              BiocGenerics_0.58.1        
#>  [71] RcppAnnoy_0.0.23            ggrepel_0.9.8              
#>  [73] RANN_2.6.3                  pillar_1.11.1              
#>  [75] stringr_1.6.0               spam_2.11-4                
#>  [77] RcppHNSW_0.7.0              later_1.4.8                
#>  [79] dplyr_1.2.1                 brand.yml_0.1.0            
#>  [81] lattice_0.23-1              tidyselect_1.2.1           
#>  [83] SingleCellExperiment_1.34.0 CDI_1.10.0                 
#>  [85] pbapply_1.7-5               knitr_1.52                 
#>  [87] gridExtra_2.3.1             IRanges_2.46.0             
#>  [89] Seqinfo_1.2.0               SummarizedExperiment_1.42.0
#>  [91] scattermore_1.2             stats4_4.6.2               
#>  [93] xfun_0.62                   pls_2.9-0                  
#>  [95] Biobase_2.72.0              matrixStats_1.5.0          
#>  [97] stringi_1.8.9               yaml_2.3.12                
#>  [99] evaluate_1.0.5              codetools_0.2-20           
#> [101] tibble_3.3.1                cli_3.6.6                  
#> [103] uwot_0.2.5                  xtable_1.8-8               
#> [105] systemfonts_1.3.3           jquerylib_0.1.4            
#> [107] Rcpp_1.1.2                  globals_0.20.0             
#> [109] png_0.1-9                   parallel_4.6.2             
#> [111] pkgdown_2.2.1               dotCall64_1.2              
#> [113] listenv_1.1.0               viridisLite_0.4.3          
#> [115] scales_1.4.0                ggridges_0.5.7             
#> [117] SeuratObject_5.4.0          openxlsx_4.2.9             
#> [119] purrr_1.2.2                 writexl_2.0.1              
#> [121] rlang_1.3.0                 cowplot_1.2.0
```
