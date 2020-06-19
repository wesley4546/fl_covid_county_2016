# Import libraries --------------------------------------------------------

library(janitor)
library(ggplot2)
library(dplyr)
library(tidyverse)

# Reading Data ------------------------------------------------------------

#Florida election results
data <- read.csv(
  here::here("data","florida_county_election_results_2016.csv", stringsAsFactors = FALSE)
  )


#WHO COVID Date
covid_cases_url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv"
covid_deaths_url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_US.csv"


deaths <- read.csv(url(covid_deaths_url), stringsAsFactors = FALSE)
cases <- read.csv(url(covid_cases_url), stringsAsFactors = FALSE)


# Cleaning Cases Data -----------------------------------------------------

cases <-
  cases %>% 
  filter(Country_Region == "US" & Province_State =="Florida") %>%
  select(Admin2, X1.22.20:ncol(cases))

cases <-
  cases %>%
  rename(County = Admin2)

str(cases)

# Cleaning Deaths Data ----------------------------------------------------

deaths <- 
  deaths %>%
  filter(Country_Region == "US" & Province_State == "Florida") %>%
  select(Admin2, X1.22.20:ncol(deaths)) 

deaths <- 
  deaths %>%
  rename(County = Admin2)


# Joining Election Data with COVID Data -----------------------------------



# tutorial on joins in R https://r4ds.had.co.nz/relational-data.html#mutating-joins
# Use sometype of joining 

# GitHub to my previous cleaning of the same data : https://github.com/wesley4546/covidstate/tree/master/R



# Graphing Data -----------------------------------------------------------

# ggplot; color by party





