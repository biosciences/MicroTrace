# test_microtrace.R - Basic Functionality Test for MicroTrace

# Load required packages
library(testthat)
library(readr)

# Source the main script (adjust path if needed)
source("../MicroTrace.R")

# Test 1: Load matrix
test_that("distance_loader loads correct dimensions", {
  dist_obj <- distance_loader("./data/sim_snp_dist.csv")
  expect_true(inherits(dist_obj, "dist"))
  expect_equal(attr(dist_obj, "Size"), 10)  # Should be 10 samples
})

# Test 2: Threshold suggestion within expected range
test_that("auto_threshold_suggestion returns numeric", {
  dist_obj <- distance_loader("./data/sim_snp_dist.csv")
  threshold <- auto_threshold_suggestion(dist_obj)
  expect_true(is.numeric(threshold))
  expect_true(threshold >= 0)
})

# Test 3: Full clustering run with metadata
test_that("Clustering completes and outputs exist", {
  dist_obj <- distance_loader("./data/sim_snp_dist.csv")
  run_microtrace_clustering(
    dist_obj,
    threshold = 5,
    metadata_path = "../data/metadata.csv"
  )
  expect_true(file.exists("./data/cluster_assignments.csv"))
  expect_true(file.exists("./docs/example_dendrogram.png"))
})