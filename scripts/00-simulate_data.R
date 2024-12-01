#### Preamble ####
# Purpose: Simulates a dataset of fire inspection outcomes which contains
  # violation status by property type and inspection time interval
# Author: Yunkai Gu
# Date: 1 December 2024
# Contact: kylie.gu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed and loaded
# Any other information needed? Make sure you are in the `Toronto_Fire_Inspection` rproj


#### Workspace setup ####
library(tidyverse)


#### Simulation preparation ####
# Set seed
set.seed(123)

# Set number of rows in simulation data
n <- 13193

# Property types
property_type <- c(
  "High Rise",
  "Low Rise",
  "Detention",
  "Group Home",
  "Group Home (VO)",
  "Hospital",
  "Hotel & Motel",
  "Nursing Home",
  "Residential Care",
  "Rooming House"
)

# Violation indicator
violation <- c(0,1)


#### Simulate data ####
simulated_data <- tibble(
  #Randomly select from a set of property types
  property_type = sample(property_type, n, replace = TRUE), 
  #Randomly selected dates from 2019-07-09 to 2024-11-20 as open date
  inspections_opendate = sample(seq(as.Date("2019-07-09"), 
                                    as.Date("2024-11-20"), by = "day"), 
                                n, replace = TRUE),
  #Randomly selected dates from 2024-01-02 to 2024-11-28 as closed date
  inspections_closeddate = sample(seq(as.Date("2024-01-02"), 
                                    as.Date("2024-11-28"), by = "day"), 
                                n, replace = TRUE),
  # Randomly select integers from 0 to 1679
  date_num = sample(0:1679, n, replace = TRUE),
  #Randomly select from 1 and 0 for violation indicator
  violation = sample(violation, n, replace = TRUE)
)


#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/fire_simulated_data.csv")