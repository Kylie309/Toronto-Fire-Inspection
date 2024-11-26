#### Preamble ####
# Purpose: Construct Bayesian Model for fire inspection outcome
# Author: Yunkai Gu
# Date: 24 November 2024
# Contact: kylie.gu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Downloaded and cleaned data.
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(janitor)
library(lubridate)
library(broom)
library(modelsummary)
library(rstanarm)
library(splines)

#### Read data ####
cleaned_data <- read_csv("data/02-analysis_data/fire_cleaned_data.csv")


### Model data ####
cleaned_data <- cleaned_data |>
  mutate(
    address_name = factor(address_name),
    property_type = factor(property_type)
  )

priors <- normal(0, 2.5, autoscale = TRUE)

bayesian_model_1 <- stan_glm(
  formula = violation ~ date_num + property_type,
  data = cleaned_data,
  family = binomial(link = "logit"),
  prior = priors,
  prior_intercept = priors,
  seed = 123,
  cores = 4,
  adapt_delta = 0.95,
  iter = 2000
)

saveRDS(
  bayesian_model_1,
  file = "models/model_1.rds"
)

