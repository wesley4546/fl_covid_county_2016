library(janitor)
library(ggplot2)
library(dplyr)


# Reading Data ------------------------------------------------------------

election_data <- read.csv(
  here::here("data","florida_county_election_results_2016.csv")
  ) %>% 
  clean_names()


covid_cases_url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv"
covid_deaths_url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_US.csv"

# Cleaning Data -----------------------------------------------------------

# tutorial on joins in R https://r4ds.had.co.nz/relational-data.html#mutating-joins
# Use sometype of joining 

# GitHub to my previous cleaning of the same data : https://github.com/wesley4546/covidstate/tree/master/R



# Graphing Data -----------------------------------------------------------

# ggplot; color by party





