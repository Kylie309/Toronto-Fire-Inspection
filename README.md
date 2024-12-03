# Fire Safety Regulation Violations in Toronto Residential Properties: Analysis by Property Type and Inspection Duration

## Overview

This paper analyzes fire safety regulation violations in residential properties across Toronto, predicting the likelihood of violations based on the inspection duration and property type, using data from fire safety inspections ended during 2024. By using a Bayesian logistic regression model, the study finds that property type plays a significant role in predicting violations, with high-rise buildings, rooming houses, and group homes at higher risk, and predicts with high confidence that most properties in the city would have a high probability of being observed to have a violation of fire safety regulations. These findings are important for improving fire safety protocols, as they suggest that targeting inspections towards high-risk property types could lead to more effective resource allocation and better safety outcomes. Findings in the study would motivate targeted inspections and interventions concentrated on properties that present the greatest risk, enhancing the effectiveness of fire safety efforts and helping to reduce potential fire accidents more efficiently.


## File Structure

The repo is structured as:

-   `data/00-simulated_data` contains the simulated dataset that was constructed.
-   `data/01-raw_data` contains the raw data as obtained from Open Data Toronto.
-   `data/02-analysis_data` contains the cleaned dataset that was constructed.
-   `models` contains fitted models. 
-   `other` contains datasheet, relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, clean and test data, as well as script used to construct model.


## Statement on LLM usage

ChatGPT 4o mini was used to provide assistance on resolving issues occurring in the process of constructing the model and relevant interpretation, creating graphs and tables, as well as writing scripts for data cleaning, comments for code and citations. Entire chat history is available in other/llms/usage.txt.