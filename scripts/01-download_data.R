#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto as a local file
# Author: Sean Eugene Chua
# Date: 23 September 2024
# Contact: seaneugene.chua@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to install `opendatatoronto` and `dplyr` libraries
# Any other information needed? None

library(opendatatoronto)
library(dplyr)

# Get the package
package <- show_package("shootings-firearm-discharges")

# List resources in the package
resources <- list_package_resources(package)

# Filter for CSV format
csv_resource <- resources %>%
  filter(format == "CSV") %>%
  arrange(desc(last_modified)) %>%
  slice(1)

# Get the resource
shootings_data <- get_resource(csv_resource)

# Write the data to a CSV file with your own path
write_csv(shootings_data, "inputs/data/unedited_data.csv")
