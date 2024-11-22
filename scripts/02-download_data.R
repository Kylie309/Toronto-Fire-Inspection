#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto (https://open.toronto.ca/dataset/highrise-residential-fire-inspection-results/)
# Author: Yunkai Gu
# Date: 21 November 2024
# Contact: kylie.gu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Installed `tidyverse` package
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Download data ####
raw_data <- read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/f816b362-778a-4480-b9ed-9b240e0fe9c2/resource/98fddf20-5c46-49fc-a1b4-eadd1877acec/download/Highrise%20Inspections%20Data.csv")


#### Save data ####
write_csv(raw_data, "data/01-raw_data/fire_raw_data.csv") 

         
