# MicroTrace.R - Modular SNP Clustering Tool

# Load required libraries
library(ape)
library(ggplot2)
library(readr)
library(dendextend)
library(dplyr)
# Optional: library(cluster) # for silhouette score

# =============================
# MicroTrace Core Functions
# =============================

# Load distance matrix from CSV
distance_loader <- function(path) {
  df <- as.data.frame(read_csv(path, show_col_types = FALSE))  # convert to data.frame
  rownames(df) <- df$Sample
  dist_matrix <- as.matrix(df[, -1])  # exclude Sample column
  return(as.dist(dist_matrix))
}

# Recommend threshold and save SNP histogram + density
auto_threshold_suggestion <- function(dist_obj, plot_path = "docs/snp_distance_histogram.png") {
  dvals <- as.numeric(dist_obj)
  dir.create(dirname(plot_path), recursive = TRUE, showWarnings = FALSE)

  # Histogram
  png(plot_path, width = 800, height = 600)
  hist(dvals, main = "SNP Distance Distribution", xlab = "Distance", col = "lightblue", breaks = 20)
  dev.off()

  # Density plot
  png("docs/snp_distance_density.png", width = 800, height = 600)
  plot(density(dvals), main = "SNP Distance Density Curve", xlab = "Distance", col = "blue", lwd = 2)
  dev.off()

  suggestion <- quantile(dvals, 0.1)  # conservative threshold
  cat("Suggested threshold (10th percentile):", round(suggestion, 2), "SNPs\n")
  return(suggestion)
}

# Intra-cluster distance summary statistics
get_cluster_distances <- function(dist_obj, cluster_assignments) {
  mat <- as.matrix(dist_obj)
  result <- lapply(unique(cluster_assignments), function(cl) {
    members <- names(cluster_assignments[cluster_assignments == cl])
    submat <- mat[members, members, drop = FALSE]
    lower <- submat[lower.tri(submat)]
    data.frame(
      Cluster = cl,
      Size = length(members),
      Mean = mean(lower),
      SD = sd(lower),
      Min = min(lower),
      Max = max(lower)
    )
  })
  do.call(rbind, result)
}

# Perform hierarchical clustering and output plots + clusters
run_microtrace_clustering <- function(dist_obj, threshold = 5, output_prefix = "data/", dendro_path = "docs/example_dendrogram.png", metadata_path = NULL) {
  # Ensure output directories exist
  dir.create(output_prefix, recursive = TRUE, showWarnings = FALSE)
  dir.create(dirname(dendro_path), recursive = TRUE, showWarnings = FALSE)

  hc <- hclust(dist_obj, method = "average")
  clusters <- cutree(hc, h = threshold)
  cluster_df <- data.frame(Sample = names(clusters), Cluster = clusters)

  # Optional: integrate metadata
  if (!is.null(metadata_path) && file.exists(metadata_path)) {
    meta <- read_csv(metadata_path, show_col_types = FALSE)
    cluster_df <- left_join(cluster_df, meta, by = "Sample")
  }

  # Save cluster assignments in ordered column format
  output_cols <- c("Sample", "Cluster", "Collection_Date", "Ward", "Patient_ID")
  available_cols <- intersect(output_cols, colnames(cluster_df))
  write_csv(cluster_df[, available_cols], paste0(output_prefix, "cluster_assignments.csv"))

  # Dendrogram plot
  png(dendro_path, width = 800, height = 600)
  plot(as.dendrogram(hc), main = paste("MicroTrace SNP Clustering (h =", threshold, ")"), xlab = "Samples", sub = "", ylab = "SNP Distance")
  abline(h = threshold, col = "red", lty = 2)
  dev.off()

  # Statistics
  cat("\nCluster Statistics:\n")
  cat(" - Number of clusters:", length(unique(clusters)), "\n")
  cat(" - Cluster sizes:\n")
  print(table(clusters))

  intra_stats <- get_cluster_distances(dist_obj, clusters)
  cat("\nIntra-cluster SNP Distance Summary:\n")
  print(intra_stats)

  write_csv(intra_stats, paste0(output_prefix, "intra_cluster_stats.csv"))

  # Optional: Silhouette Score
  # sil <- silhouette(clusters, dist_obj)
  # cat("\nAverage silhouette width:", round(mean(sil[, 3]), 3), "\n")

  cat("\nClustering complete.\nOutput:\n -", paste0(output_prefix, "cluster_assignments.csv"), 
      "\n -", dendro_path, 
      "\n -", paste0(output_prefix, "intra_cluster_stats.csv"), 
      "\n - docs/snp_distance_histogram.png",
      "\n - docs/snp_distance_density.png\n")
}

# =============================
# Execution Block
# =============================

# Load distance matrix
dist_path <- "data/sim_snp_dist.csv"
dist_obj <- distance_loader(dist_path)

# Suggest a threshold and save plot
auto_threshold_suggestion(dist_obj, plot_path = "docs/snp_distance_histogram.png")

# Run clustering
run_microtrace_clustering(dist_obj, threshold = 5, metadata_path = "data/metadata.csv")