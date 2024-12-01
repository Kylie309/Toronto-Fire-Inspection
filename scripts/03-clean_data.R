#### Preamble ####
# Purpose: Cleans the raw data of Highrise Residential Fire Inspection Results
# Author: Yunkai Gu
# Date: 1 December 2024
# Contact: kylie.gu@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - The `tidyverse` `dplyr` `lubridate` package must be installed and loaded
# - 02-download_data.R must have been run
# Any other information needed? Make sure you are in the `Toronto_Fire_Inspection` rproj

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(lubridate)


#### Clean data ####
raw_data <- read_csv("data/01-raw_data/fire_raw_data.csv")

cleaned_data <- 
  raw_data |>
  # Standardize column names to snake_case for consistency
  janitor::clean_names() |>
  # Parse 'inspections_closeddate' as a full datetime (ymd_hms), 
  # fall back to date-only (ymd)
  mutate(
    inspections_closeddate = coalesce(
      as.Date(ymd_hms(inspections_closeddate, quiet = TRUE)),
      as.Date(ymd(inspections_closeddate, quiet = TRUE))
    )
  ) |>
  # Keep only rows where inspections were closed during 2024
  filter(inspections_closeddate >= as.Date("2024-01-01")) |>
  # Parse 'inspections_opendate' as a full datetime (ymd_hms), 
  # fall back to date-only (ymd)
  mutate(
    inspections_opendate = coalesce(
      as.Date(ymd_hms(inspections_opendate, quiet = TRUE)),
      as.Date(ymd(inspections_opendate, quiet = TRUE))
    )
  ) |>
  # Calculate the difference in days between 'inspections_closeddate' and 'inspections_opendate'
  # Store the result as a numeric value in a new column 'date_num'
  mutate(
    date_num = as.numeric(inspections_closeddate - inspections_opendate),
    # Add the 'violation' column which indicates whether there's violation
    violation = if_else(violations_item_number == 0, 0, 1)
  ) |>
  # Select and retain only the specified columns needed
  select(property_type, inspections_opendate, inspections_closeddate, 
         date_num, violation)


#### Save data ####
write_parquet(cleaned_data, "data/02-analysis_data/fire_cleaned_data.parquet")