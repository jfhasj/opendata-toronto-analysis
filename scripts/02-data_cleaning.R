#### Preamble ####
# Purpose: Cleans the raw data on shooting occurrences obtained from Open Data Toronto
# Author: Sean Eugene Chua
# Date: 23 September 2024
# Contact: seaneugene.chua@mail.utoronto.ca
# License: None
# Pre-requisites: need to have libraries `janitor` and `here`
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(here)

data_path <- here("inputs", "data", "unedited_data.csv")
shootings_data <- read_csv(data_path)

cleaned_data <-
  shootings_data |>
  janitor::clean_names() |>
  rename(
    date = occ_date, year = occ_year, month = occ_month, time_of_day = occ_time_range
  ) |>
  mutate(date = as.Date(date)) |>
  filter(year >= 2014 & year <= 2023) |>
  select(
    date, year, month, time_of_day, division
  ) |>
  tidyr::drop_na()

# Additional cleaning steps if needed
cleaned_data <- cleaned_data |>
  mutate(
    month = factor(month, levels = month.name),
    time_of_day = factor(time_of_day, levels = c("Morning", "Afternoon", "Evening", "Night"))
  )

print(head(cleaned_data))
# Save the cleaned dataset to a new CSV file
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")
