# MicroTrace: SNP-Based Clustering for Pathogen Outbreak Detection

**MicroTrace** is a lightweight R package for detecting SNP-based transmission clusters from pathogen genome distance matrices.

## 🚀 Features
- Reads SNP distance matrix in CSV format
- Suggests SNP threshold based on distance distribution
- Performs hierarchical clustering (UPGMA)
- Merges optional sample metadata (e.g., ward, date)
- Outputs cluster table, dendrogram, and SNP distance plots
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
│   ├── metadata.csv           # Sample metadata
│   └── intra_cluster_stats.csv
├── docs/
│   ├── example_dendrogram.png
│   ├── snp_distance_histogram.png
│   └── snp_distance_density.png
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

## 📊 Output Files
- `cluster_assignments.csv`: sample-to-cluster table
- `intra_cluster_stats.csv`: summary of SNP distances within clusters
- `example_dendrogram.png`: visual tree with SNP threshold cut
- `snp_distance_histogram.png`: histogram of all SNP pairwise distances
- `snp_distance_density.png`: density plot of SNP distances

## 📝 Citation
If you use this tool in your research, please cite:

Lai, K. (2025). *MicroTrace: A Lightweight R Tool for SNP-Based Pathogen Clustering in Outbreak Detection*. Journal of Open Source Software.

## 📚 Additional Resources

- [Statistical rationale: SNP distance histogram and thresholding](docs/snp_distance_analysis.md)

## 📜 License
MIT License

---

Developed by Kaitao Lai, University of Sydney.
