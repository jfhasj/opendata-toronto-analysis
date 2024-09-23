#### Preamble ####
# Purpose: Simulates 500 rows of data that mimic our raw dataset
# Author: Sean Eugene Chua
# Date: 23 September 2024
# Contact: seaneugene.chua@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have installed `tidyverse` and `lubridate`
# Any other information needed? Ensure to set a seed for reproducibility


#### Workspace setup ####
library(tidyverse)
library(lubridate)

# Set seed for reproducibility
set.seed(464)

# Simulate data
simulate_shootings_data <- function(n_rows = 500) {
  # Generate initial data
  data <- tibble(
    OCC_DAY = sample(1:31, n_rows, replace = TRUE),
    OCC_HOUR = sample(0:23, n_rows, replace = TRUE),
    DIVISION = paste0("D", sample(11:55, n_rows, replace = TRUE)),
    INJURIES = rpois(n_rows, lambda = 0.5) # Using Poisson distribution for injuries
  ) %>%
    mutate(
      OCC_TIME = case_when(
        OCC_HOUR %in% 5:11 ~ "Morning",
        OCC_HOUR %in% 12:17 ~ "Afternoon",
        OCC_HOUR %in% 18:23 ~ "Evening",
        TRUE ~ "Night"
      )
    )

  return(data)
}

# Generate simulated data
simulated_data <- simulate_shootings_data()
write_csv(simulated_data, "outputs/data/simulated_data.csv")
