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

simulate_shootings_data <- function(n_rows = 500) {
  # Generate random dates for the OCC_DATE column
  start_date <- as.Date("2014-01-01")
  end_date <- as.Date("2023-12-31")
  OCC_DATE <- sample(seq(start_date, end_date, by="day"), n_rows, replace = TRUE)
  
  # Extract year and month from OCC_DATE
  OCC_YEAR <- year(OCC_DATE)
  OCC_MONTH <- month(OCC_DATE, label = TRUE, abbr = FALSE)
  
  # Generate random hours and time ranges
  OCC_HOUR <- sample(0:23, n_rows, replace = TRUE)
  OCC_TIME_RANGE <- case_when(
    OCC_HOUR %in% 5:11 ~ "Morning",
    OCC_HOUR %in% 12:17 ~ "Afternoon",
    OCC_HOUR %in% 18:23 ~ "Evening",
    TRUE ~ "Night"
  )
  
  # Generate random divisions
  DIVISION <- paste0("D", sample(11:55, n_rows, replace = TRUE))
  
  # Create the final tibble
  data <- tibble(
    OCC_DATE,
    OCC_YEAR,
    OCC_MONTH,
    OCC_TIME_RANGE,
    DIVISION
  )
  
  return(data)
}

# Generate simulated data
simulated_data <- simulate_shootings_data()
write_csv(simulated_data, "outputs/data/simulated_data.csv")