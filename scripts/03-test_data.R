#### Preamble ####
# Purpose: Tests for valid data entries from the simulated data for each column we are concerned with
# Author: Sean Eugene Chua
# Date: 23 September 2024
# Contact: seaneugene.chua@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have installed `tidyverse`, file of simulated data already exists
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

simulated_data <- read_csv("outputs/data/simulated_data.csv")

# Test 1: Check if OCC_DAY is within valid range
test_occ_day <- function(data) {
  if (!all(data$OCC_DAY >= 1 & data$OCC_DAY <= 31)) {
    stop("OCC_DAY contains values outside the range 1-31")
  }
  print("OCC_DAY test passed.")
}

# Test 2: Check if OCC_HOUR is within valid range
test_occ_hour <- function(data) {
  if (!all(data$OCC_HOUR >= 0 & data$OCC_HOUR <= 23)) {
    stop("OCC_HOUR contains values outside the range 0-23")
  }
  print("OCC_HOUR test passed.")
}

# Test 3: Check if OCC_TIME has valid categories
test_occ_time <- function(data) {
  valid_times <- c("Morning", "Afternoon", "Evening", "Night")
  if (!all(data$OCC_TIME %in% valid_times)) {
    stop("OCC_TIME contains invalid categories")
  }
  print("OCC_TIME test passed.")
}

# Test 4: Check if all Divisions are valid
test_divisions <- function(data) {
  valid_divisions <- paste0("D", 11:55)
  invalid_divisions <- setdiff(unique(data$DIVISION), valid_divisions)
  if (length(invalid_divisions) > 0) {
    stop(paste("Invalid Divisions found:", paste(invalid_divisions, collapse = ", ")))
  }
  print("Division test passed.")
}

# Test 6: Check if INJURIES are non-negative integers
test_injuries <- function(data) {
  if (!all(data$INJURIES >= 0)) {
    stop("INJURIES column contains negative or non-integer values")
  }
  print("Injuries column test passed.")
}

# Run all tests
run_all_tests <- function(data) {
  test_occ_day(data)
  test_occ_hour(data)
  test_occ_time(data)
  test_divisions(data)
  test_injuries(data)
}

# Run the tests on the read data
run_all_tests(simulated_data)
