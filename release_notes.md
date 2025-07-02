# MicroTrace v1.0.0 Release Notes

🎉 **Initial Release – July 2025**

MicroTrace is a lightweight and reproducible R tool for identifying SNP-based clusters from pathogen whole-genome sequencing (WGS) data. This release supports rapid outbreak detection in public health, clinical microbiology, and epidemiology.

## 🚀 Features
- 📊 Input: Accepts pairwise SNP distance matrix in CSV format
- 🧠 Suggests SNP threshold (e.g., 10th percentile)
- 🌿 Clustering: UPGMA hierarchical clustering via `hclust`
- 🧬 Outputs:
  - `cluster_assignments.csv`
  - `example_dendrogram.png`
  - Integrated metadata (optional)
- 📑 Reporting: R Markdown HTML report generator
- ✅ Testing: `testthat` unit tests for core functions

## 📂 Structure
```
MicroTrace/
├── MicroTrace.R               # Core analysis script
├── data/                      # Input SNP matrix + metadata
├── docs/                      # Output images (e.g., dendrogram)
├── tests/                     # Automated test cases
├── paper/                     # JOSS manuscript and BibTeX
├── MicroTrace_Report.Rmd      # HTML report template
├── DESCRIPTION, LICENSE, README.md
```

## 🛠 Improvements Planned
- Optional integration with ggtree for enhanced dendrograms
- Shiny dashboard for interactive exploration
- Batch analysis support for multiple SNP matrices

## 📜 Citation
Lai, K. (2025). *MicroTrace: A Lightweight R Tool for SNP-Based Pathogen Clustering in Outbreak Detection*. Journal of Open Source Software.

Thank you for using MicroTrace! Feedback and contributions are welcome.
