# MicroTrace: SNP-Based Clustering for Pathogen Outbreak Detection

**MicroTrace** is a lightweight R package for detecting SNP-based transmission clusters from pathogen genome distance matrices.

## 📄 Project Links
- 💻 [View Source Code on GitHub](https://github.com/biosciences/MicroTrace): Explore the full repository
- 🧬 [Live Report (GitHub Pages)](https://biosciences.github.io/MicroTrace/MicroTrace_Report.html): View the interactive HTML output

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
├── convert_snp_dists_to_microtrace.py  # convert a SNP distance matrix
├── test_microtrace.R      # Unit tests
├── MicroTrace_Report.Rmd      # R Markdown HTML report
├── data/
│   ├── sim_snp_dist.csv       # Example SNP distance matrix
│   ├── metadata.csv           # Sample metadata
│   └── intra_cluster_stats.csv
├── docs/
│   ├── example_dendrogram.png
│   ├── snp_distance_histogram.png
│   └── snp_distance_density.png
├── paper/
│   ├── paper.md               # JOSS manuscript
│   └── paper.bib              # References
├── DESCRIPTION                # R project metadata
├── LICENSE                    # MIT license
└── README.md
```
## 📦 Installation
You need R (≥ 3.6) and the following R packages:

```r
install.packages(c("ape", "ggplot2", "readr", "dplyr", "dendextend"))
```

## 🧬 Preparing Input from SNP-Dists

If you have a core genome alignment (e.g., from Snippy), you can compute SNP distances using [`snp-dists`](https://github.com/tseemann/snp-dists):

### 1. Install snp-dists via conda:
```bash
conda install -c bioconda snp-dists
```

### 2. Run snp-dists on your alignment:
```bash
snp-dists core.full.aln > snp_dist.tsv
```

### 3. Convert to MicroTrace-compatible CSV:
Use the provided Python script:
```bash
python tools/convert_snp_dists_to_microtrace.py -i snp_dist.tsv -o data/sim_snp_dist.csv
```

This will produce a `sim_snp_dist.csv` file readable by MicroTrace.

## 🧪 Example Usage

1. Run the full pipeline:

```r
source("MicroTrace.R")
```

2. Generate the HTML report:

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

> Lai, K. (2025). *MicroTrace: A lightweight R tool for SNP-based pathogen clustering in outbreak detection*. arXiv: https://arxiv.org/abs/2507.08060 (submitted to *Journal of Open Source Software*). https://github.com/biosciences/MicroTrace

## 📚 Additional Resources

- [Statistical rationale: SNP distance histogram and thresholding](docs/snp_distance_analysis.md)

## 📜 License
MIT License

---

Developed by Kaitao Lai, University of Sydney.
