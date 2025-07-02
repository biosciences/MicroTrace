# SNP Distance Histogram Analysis in MicroTrace

This document explains the statistical basis and interpretation of the SNP distance histogram used in the MicroTrace pipeline.

---

## Purpose
The SNP distance histogram provides an overview of the pairwise genetic distances between samples. It helps users:

- Understand the clustering structure
- Choose an appropriate SNP threshold for outbreak detection
- Visualize whether the data support distinct genomic clusters

---

## Data Source
The histogram is based on all off-diagonal elements from the pairwise SNP distance matrix, which represents SNP differences between all sample pairs. These are obtained via:

```r
dvals <- as.numeric(dist_obj)
```

---

## Statistics Used

### 1. Histogram
```r
hist(dvals, main = "SNP Distance Distribution", xlab = "Distance", col = "lightblue")
```
- Shows the frequency of SNP distances
- Helps detect tight clusters (peaks near zero) or multiple subpopulations (bimodal shapes)

### 2. Threshold Suggestion (10th Percentile)
```r
suggestion <- quantile(dvals, 0.1)
```
- Suggests a conservative SNP cutoff
- Low distances are likely from within-cluster comparisons (e.g., same transmission chain)

---

## Interpretation Guidelines
| Pattern         | Interpretation                                  |
|----------------|--------------------------------------------------|
| Sharp peak at 0–5 SNPs | Potential outbreak cluster                  |
| Bimodal         | Likely 2 or more separate populations           |
| Uniform/flat    | Samples likely unrelated                        |

---

## Suggested Enhancements (Future)
- Export mean, SD, min, max of `dvals` to a CSV
- Add density plot for smoother distribution visualization
- Report number of sample pairs per SNP bin
- Option to overlay vertical SNP threshold line on histogram

---

## Example Output (Saved to File)

- `docs/snp_distance_histogram.png`
- Recommended threshold printed to console and optionally saved

---

For advanced validation, users may optionally compute silhouette scores using the `cluster` package.

---

**Contact**: Kaitao Lai, University of Sydney

**File generated:** `docs/snp_distance_analysis.md`