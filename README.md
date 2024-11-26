# Fire Safety Regulation Violations in Toronto: Analysis by Property Type and Inspection Duration for Inspections Closed in 2024

## Overview

This study employs Bayesian modeling to analyze the detection of violations of fire safety regulations by properties in Toronto, examining how factors pf region, property type, and inspection time intervals influence the likelihood of violations. The original raw data was obtained from Open Data Toronto.


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from Open Data Toronto.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

ChatGPT 4o mini was used to provide assistance on resolving issues occurring in the process of writing scripts for data cleaning and comments for codes. Entire chat history is available in other/llms/usage.txt.