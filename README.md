# MicroTrace: SNP-Based Clustering for Pathogen Outbreak Detection

**MicroTrace** is an open-source R tool for performing real-time clustering of pathogen samples based on SNP distance matrices. It enables outbreak detection using hierarchical clustering and metadata integration.

## 🚀 Features
- Reads SNP distance matrix in CSV format
- Suggests SNP threshold based on distribution
- Performs hierarchical clustering (UPGMA)
- Merges optional sample metadata (e.g., ward, date)
- Outputs cluster table and dendrogram image
- Generates publication-ready HTML reports (via R Markdown)

## 📦 Installation
You need R (≥ 3.6) and the following R packages:

```r
install.packages(c("ape", "ggplot2", "readr", "dplyr", "dendextend"))
```

## 📂 Directory Structure
```
MicroTrace/
├── MicroTrace.R               # Main analysis script
├── MicroTrace_Report.Rmd      # R Markdown HTML report
├── data/
│   ├── sim_snp_dist.csv       # Example SNP distance matrix
│   └── metadata.csv           # Sample metadata
├── docs/
│   └── example_dendrogram.png
├── tests/
│   └── test_microtrace.R      # Unit tests
├── paper/
│   ├── paper.md               # JOSS manuscript
│   └── paper.bib              # References
├── DESCRIPTION                # R project metadata
├── LICENSE                    # MIT license
└── README.md
```

## 🧪 Example Usage

1. Run the full pipeline:

```r
source("MicroTrace.R")
```

2. Generate report:

```r
rmarkdown::render("MicroTrace_Report.Rmd")
```

## 📝 Citation
If you use this tool in your research, please cite:

Lai, K. (2025). *MicroTrace: A Lightweight R Tool for SNP-Based Pathogen Clustering in Outbreak Detection*. Journal of Open Source Software.

## 📜 License
MIT License

---

Developed by Kaitao Lai, University of Sydney.