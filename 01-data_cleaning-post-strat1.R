#### Preamble ####
# Purpose: Prepare and clean the survey data downloaded from IPUMS USA
# Author: Xinran Gu
# Data: 22 October 2020
# Contact: xinran.gu@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!

#### Workspace setup ####
library(haven)
library(tidyverse)
# Read in the raw data.
setwd("C:/Users/livia/Desktop/school/sta304/ps3")
raw_data <- read_csv("usa_00004.csv.gz")


# Add the labels
raw_data <- labelled::to_factor(raw_data)

# Just keep some variables that may be of interest (change 
# this depending on your interests)
reduced_data <- 
  raw_data %>% 
  select(AGE,SEX)
         

#### What's next? ####

## Here I am only splitting cells by age, but you 
## can use other variables to split by changing
## count(age) to count(age, sex, ....)

reduced_data <- 
  reduced_data %>%
  count(AGE,SEX) %>%
  group_by(AGE,SEX) 

reduced_data <- 
  reduced_data %>% 
  filter(AGE > 16) 

reduced_data$AGE <- as.integer(reduced_data$AGE)

# Saving the census data as a csv file in my
# working directory
write_csv(reduced_data, "census_data.csv")



         