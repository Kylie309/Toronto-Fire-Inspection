#### Preamble ####
# Purpose: Tests the structure and validity of the fire inspection outcome 
  # dataset after cleaning.
# Author: Yunkai Gu
# Date: 1 December 2024
# Contact: kylie.gu@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - The `tidyverse` package must be installed and loaded
# - 02-download_data.R and 03-clean_data.R must have been run
# Any other information needed? Make sure you are in the `Toronto_Fire_Inspection` rproj


#### Workspace setup ####
library(tidyverse)


# Read the dataset
analysis_data <- read_parquet("data/02-analysis_data/fire_cleaned_data.parquet")


#### Test data ####

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

# Check if the dataset has 13193 rows
if (nrow(analysis_data) == 13193) {
  message("Test Passed: The dataset has 13193 rows.")
} else {
  stop("Test Failed: The dataset does not have 13193 rows.")
}

# Check if the dataset has 5 columns
if (ncol(analysis_data) == 5) {
  message("Test Passed: The dataset has 5 columns.")
} else {
  stop("Test Failed: The dataset does not have 5 columns.")
}

# Check if the 'property_type' column contains only valid property types
valid_types <- c("High Rise",
                 "Low Rise",
                 "Detention",
                 "Group Home",
                 "Group Home (VO)",
                 "Hospital",
                 "Hotel & Motel",
                 "Nursing Home",
                 "Residential Care",
                 "Rooming House")

if (all(analysis_data$property_type %in% valid_types)) {
  message("Test Passed: The 'property_type' column contains only valid property types.")
} else {
  stop("Test Failed: The 'property_type' column contains invalid property types.")
}

# Check if the 'inspections_opendate' column contains only valid dates
valid_opendate <- seq(as.Date("2019-07-09"), as.Date("2024-11-20"), by = "day")

if (all(analysis_data$inspections_opendate %in% valid_opendate)) {
  message("Test Passed: The 'inspections_opendate' column contains only valid open dates.")
} else {
  stop("Test Failed: The 'inspections_opendate' column contains invalid open dates.")
}

# Check if the 'inspections_closeddate' column contains only valid dates
valid_closeddate <- seq(as.Date("2024-01-02"), as.Date("2024-11-28"), by = "day")

if (all(analysis_data$inspections_closeddate %in% valid_closeddate)) {
  message("Test Passed: The 'inspections_closeddate' column contains only valid closed dates.")
} else {
  stop("Test Failed: The 'inspections_closeddate' column contains invalid closed dates.")
}

# Check if the 'date_num' column contains only valid numbers
valid_date <- c(0:1679)

if (all(analysis_data$date_num %in% valid_date)) {
  message("Test Passed: The 'date_num' column contains only valid numbers.")
} else {
  stop("Test Failed: The 'date_num' column contains invalid numbers.")
}

# Check if the 'violation' column contains only 0 and 1
valid_violation <- c(0,1)

if (all(analysis_data$violation %in% valid_violation)) {
  message("Test Passed: The 'violation' column contains only 0 and 1.")
} else {
  stop("Test Failed: The 'violation' column contains intergers other than 0 and 1.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(analysis_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if there are no empty strings in 'property_type' column
if (all(analysis_data$property_type != "")) {
  message("Test Passed: There are no empty strings in 'property_type' column.")
} else {
  stop("Test Failed: There are empty strings in 'property_type' column.")
}