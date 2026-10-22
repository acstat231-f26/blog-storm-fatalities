#download.file("https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d1950_c20260323.csv.gz",
#              destfile = paste0("details", 1950, ".csv.gz"))
#R.utils::gunzip("raw_data/StormEvents_details-ftp_v1.0_d1950_c20260323.csv.gz")
#details1950 <- read.csv("raw_data/StormEvents_details-ftp_v1.0_d1950_c20260323.csv", header = TRUE)



#*ask about the irregular ending dates*

year <- 1950:2026
filenames_dest <- paste0("raw_data/details", year, ".csv.gz")
urlnames_dest <- paste0("https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d", year, "_c20260323.csv.gz") |>
  replace(35, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d1984_c20260527.csv.gz") |>
  replace(68, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2017_c20260519.csv.gz") |>
  replace(73, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2022_c20260625.csv.gz") |>
  replace(75, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2024_c20260728.csv.gz") |>
  replace(76, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2025_c20260819.csv.gz") |>
  replace(77, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2026_c20260918.csv.gz")

filenames_fatal <- paste0("raw_data/fatalities", year, ".csv.gz")
urlnames_fatal <- paste0("https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_fatalities-ftp_v1.0_d", year, "_c20260323.csv.gz") |>
  replace(35, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_fatalities-ftp_v1.0_d1984_c20260527.csv.gz") |>
  replace(68, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_fatalities-ftp_v1.0_d2017_c20260519.csv.gz") |>
  replace(73, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_fatalities-ftp_v1.0_d2022_c20260625.csv.gz") |>
  replace(75, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_fatalities-ftp_v1.0_d2024_c20260728.csv.gz") |>
  replace(76, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_fatalities-ftp_v1.0_d2025_c20260819.csv.gz") |>
  replace(77, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_fatalities-ftp_v1.0_d2026_c20260918.csv.gz")


#as_tibble(filenames_dest) |>
#print(n=77)
#as_tibble(urlname_dest)

#filenames10 <- filenames_dest[c(1:10)]
#urlnames10 <- urlnames_dest[c(1:10)]

n=length(year)

download.file(url = urlnames_dest, destfile = filenames_dest)
for(i in 1:n) {
  R.utils::gunzip(filenames_dest[i])
}

download.file(url = urlnames_fatal, destfile = filenames_fatal)
for(i in 1:n) {
  R.utils::gunzip(filenames_fatal[i])
}


