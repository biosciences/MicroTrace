# MicroTrace v1.0.0 Release Notes

🎉 **Initial Release – July 2025**

MicroTrace is a lightweight and reproducible R tool for identifying SNP-based clusters from pathogen whole-genome sequencing (WGS) data. This release supports rapid outbreak detection in public health, clinical microbiology, and epidemiology.

## 🚀 Features
- 📊 Input: Accepts pairwise SNP distance matrix in CSV format
- 🧠 Suggests SNP threshold (e.g., 10th percentile)
- 🌿 Clustering: UPGMA hierarchical clustering via `hclust`
- 🧬 Outputs:
  - `cluster_assignments.csv`
  - `intra_cluster_stats.csv`
  - `example_dendrogram.png`
  - `snp_distance_histogram.png`
  - `snp_distance_density.png`
- 📑 Reporting: R Markdown HTML report with embedded visualizations
- 📘 Documentation: SNP thresholding rationale in `snp_distance_analysis.md`
- ✅ Testing: `testthat` unit tests for core functions

## 📂 Structure
```
MicroTrace/
├── MicroTrace.R               # Core analysis script
├── MicroTrace_Report.Rmd      # HTML report template
├── data/                      # Input SNP matrix + metadata + stats
├── docs/                      # Output plots + statistical notes
├── tests/                     # Automated test cases
├── paper/                     # JOSS manuscript and BibTeX
├── DESCRIPTION, LICENSE, README.md, release_notes.md
```

## 🆕 Updates Since Initial Draft
- Added SNP distance density plot
- Embedded histogram and density plots in HTML report
- Added intra-cluster SNP summary statistics table
- Added markdown documentation of SNP threshold rationale (`docs/snp_distance_analysis.md`)
- Linked rationale file in `README.md`
- Improved `paper.md` with explanation of percentile threshold and motivation
- Humanized acknowledgements and statement of need

## 🛠 Future Roadmap
- Interactive Shiny dashboard version
- Support for multiple batches / outbreak timelines
- Visual enhancements via ggtree + ggplot themes

## 📝 Citation
Lai, K. (2025). *MicroTrace: A Lightweight R Tool for SNP-Based Pathogen Clustering in Outbreak Detection*. Journal of Open Source Software.

Thank you for using MicroTrace! Feedback and contributions are welcome.