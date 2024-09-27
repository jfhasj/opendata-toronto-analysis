#### Preamble ####
# Purpose: Tests for valid data entries from the simulated data for each column we are concerned with
# Author: Sean Eugene Chua
# Date: 23 September 2024
# Contact: seaneugene.chua@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have installed `tidyverse` and `lubridate`, file of simulated data already exists
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(lubridate)

# Load the simulated dataset
simulated_data <- read_csv("outputs/data/simulated_data.csv")

# Test 1: Check if OCC_DATE is valid (i.e., it should be a date)
test_occ_date <- function(data) {
  if (!all(!is.na(data$OCC_DATE))) {
    stop("OCC_DATE contains NA values.")
  }
  if (!all(data$OCC_DATE >= as.Date("2014-01-01") & data$OCC_DATE <= as.Date("2023-12-31"))) {
    stop("OCC_DATE contains dates outside the range 2014-01-01 to 2023-12-31.")
  }
  print("OCC_DATE test passed.")
}

# Test 2: Check if OCC_YEAR is within valid range
test_occ_year <- function(data) {
  if (!all(data$OCC_YEAR >= 2014 & data$OCC_YEAR <= 2023)) {
    stop("OCC_YEAR contains values outside the range 2014-2023.")
  }
  print("OCC_YEAR test passed.")
}

# Test 3: Check if OCC_MONTH has valid categories
test_occ_month <- function(data) {
  valid_months <- month.name
  if (!all(data$OCC_MONTH %in% valid_months)) {
    stop("OCC_MONTH contains invalid categories.")
  }
  print("OCC_MONTH test passed.")
}

# Test 4: Check if OCC_TIME_RANGE has valid categories
test_occ_time_range <- function(data) {
  valid_times <- c("Morning", "Afternoon", "Evening", "Night")
  if (!all(data$OCC_TIME_RANGE %in% valid_times)) {
    stop("OCC_TIME_RANGE contains invalid categories.")
  }
  print("OCC_TIME_RANGE test passed.")
}

# Test 5: Check if DIVISION is valid
test_division <- function(data) {
  valid_divisions <- paste0("D", 11:55)
  invalid_divisions <- setdiff(unique(data$DIVISION), valid_divisions)
  if (length(invalid_divisions) > 0) {
    stop(paste("Invalid Divisions found:", paste(invalid_divisions, collapse = ", ")))
  }
  print("DIVISION test passed.")
}

# Run all tests
run_all_tests <- function(data) {
  test_occ_date(data)
  test_occ_year(data)
  test_occ_month(data)
  test_occ_time_range(data)
  test_division(data)
}

# Execute the tests on the simulated data
run_all_tests(simulated_data)