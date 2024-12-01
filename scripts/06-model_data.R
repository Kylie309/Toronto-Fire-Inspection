#### Preamble ####
# Purpose: Construct Bayesian Model for fire inspection outcome
# Author: Yunkai Gu
# Date: 28 November 2024
# Contact: kylie.gu@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - The `tidyverse` `lubridate` `rstanarm` package must be installed and loaded
# - 02-download_data.R and 03-clean_data.R must have been run
# Any other information needed? Make sure you are in the `Toronto_Fire_Inspection` rproj


#### Workspace setup ####
library(tidyverse)
library(lubridate)
library(rstanarm)


#### Read data ####
cleaned_data <- read_csv("data/02-analysis_data/fire_cleaned_data.csv")


### Model data ####
# Change 'property_type' to factor variables
cleaned_data <- cleaned_data |>
  mutate(
    property_type = factor(property_type)
  )

# Specify priors
priors <- normal(0, 2.5, autoscale = TRUE)

# Fit Bayesian model with date_num and property_type as fixed effect
bayesian_model_1 <- stan_glm(
  formula = violation ~ date_num + property_type,
  data = cleaned_data,
  family = binomial(link = "logit"),
  prior = normal(0, 2.5, autoscale = TRUE),
  prior_intercept = normal(0, 2.5, autoscale = TRUE),
  seed = 123,
  cores = 4,
  adapt_delta = 0.95,
  iter = 4000
)


### Save the model ####
saveRDS(
  bayesian_model_1,
  file = "models/violation_prediction_model.rds"
)

