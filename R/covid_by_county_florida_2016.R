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
  rename(County = Admin2) %>%
  select(County, X1.22.20:ncol(cases)) %>%
  filter(!County %in% c(
    "Out of FL",
    "Unassigned"
  )) 

cases <- pivot_longer(cases, cols = X1.22.20:ncol(cases), names_to = "Date", values_to = "case_count")


# Remove X from date column
cases$Date <- gsub("X", "", cases$Date)

# set Date column to Date 
cases$Date <- as.Date(cases$Date, format ="%m.%d.%y")


# Cleaning Deaths Data ----------------------------------------------------

deaths <- 
  deaths %>%
  filter(Country_Region == "US" & Province_State == "Florida") %>%
  rename(County = Admin2) %>%
  select(County, X1.22.20:ncol(deaths)) %>%
  filter(!County %in% c(
    "Out of FL",
    "Unassigned"
  ))

#Pivot data 
deaths <- pivot_longer(deaths, cols = X1.22.20:ncol(deaths), names_to = "Date", values_to = "death_count")

#Remove X from date column
deaths$Date <- gsub("X", "", deaths$Date)

#Change data type to Date of Date column
deaths$Date <- as.Date(deaths$Date, format = "%m.%d.%y")


# Joining Election Data with COVID Data -----------------------------------



# tutorial on joins in R https://r4ds.had.co.nz/relational-data.html#mutating-joins
# Use sometype of joining 

# GitHub to my previous cleaning of the same data : https://github.com/wesley4546/covidstate/tree/master/R



# Graphing Data -----------------------------------------------------------

# ggplot; color by party





