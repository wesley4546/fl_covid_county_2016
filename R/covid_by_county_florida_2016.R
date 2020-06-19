library(janitor)
library(ggplot2)
library(dplyr)
library(tidyverse)
install.packages("tidyverse")

updateR()

# Reading Data ------------------------------------------------------------
#Florida election results
data <- read.csv(
  here::here("data","florida_county_election_results_2016.csv", stringsAsFactors = FALSE)
  )

#
covid_cases_url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv"
covid_deaths_url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_US.csv"

cases <- read.csv(url(covid_cases_url))
# Cleaning Data -----------------------------------------------------------

str(cases)


cases_data <- 
  cases %>%
  filter(Country_Region == "US") %>%
  select(Province_State, X1.22.20:ncol(cases)) %>% 
  rename(state= Province_State)
  


str(cases_data)  





# tutorial on joins in R https://r4ds.had.co.nz/relational-data.html#mutating-joins
# Use sometype of joining 

# GitHub to my previous cleaning of the same data : https://github.com/wesley4546/covidstate/tree/master/R



# Graphing Data -----------------------------------------------------------

# ggplot; color by party





