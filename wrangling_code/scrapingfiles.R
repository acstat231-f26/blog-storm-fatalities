# ------------------------------------------------------------------------------
# Scrape CSV files from NOAA website
# Author: Max Sugarman
# Date modified: 11/3/26
# ------------------------------------------------------------------------------

library(tidyverse)
library(rvest)
library(robotstxt)


#url we are using
storm_url <- "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/"

#collecting all links from the page
file_hrefs <- storm_url |>
  read_html() |> 
  html_elements("tbody > tr > td > a") |>
  html_attr("href")

#formatting files names as a tibble for wrangling
files_df <- tibble(url = file_hrefs) 


#filtering for just the "details" files 
#also adding the "https..." part to the url so download.file() works
details_df <- files_df |>
  filter(str_detect(url, "StormEvents_details-ftp_v1.0")) |>
  mutate(url = paste0(storm_url, url))

#formatting as character string for download.file()
details <- details_df$url


#same thing for "fatalities"
fatalities_df <- files_df |>
  filter(str_detect(url, "StormEvents_fatalities-ftp_v1.0")) |>
  mutate(url = paste0(storm_url, url))

fatalities <- fatalities_df$url


#setting destination file names
#data is from 1950 to 2026
year <- 1950:2026
filenames_details <- paste0("raw_data/details", year, ".csv.gz")
filenames_fatal <- paste0("raw_data/fatalities", year, ".csv.gz")


#download and unzip all csv files
n=length(year)

download.file(url = details, destfile = filenames_details)
for(i in 1:n) {
  R.utils::gunzip(filenames_details[i])
}

download.file(url = fatalities, destfile = filenames_fatal)
for(i in 1:n) {
  R.utils::gunzip(filenames_fatal[i])
}


