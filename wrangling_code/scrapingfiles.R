#download.file("https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d1950_c20260323.csv.gz",
#              destfile = "raw_data/StormEvents_details-ftp_v1.0_d1950_c20260323.csv.gz")
#R.utils::gunzip("raw_data/StormEvents_details-ftp_v1.0_d1950_c20260323.csv.gz")
#details1950 <- read.csv("raw_data/StormEvents_details-ftp_v1.0_d1950_c20260323.csv", header = TRUE)



#*ask about the irregular ending dates*

year <- 1950:2026
filenames <- paste0("raw_data/StormEvents_details-ftp_v1.0_d", year, "_c20260323.csv.gz") |>
  replace(35, "raw_data/StormEvents_details-ftp_v1.0_d1984_c20260527.csv.gz") |>
  replace(68, "raw_data/StormEvents_details-ftp_v1.0_d2017_c20260519.csv.gz") |>
  replace(73, "raw_data/StormEvents_details-ftp_v1.0_d2022_c20260625.csv.gz") |>
  replace(75, "raw_data/StormEvents_details-ftp_v1.0_d2024_c20260728.csv.gz") |>
  replace(76, "raw_data/StormEvents_details-ftp_v1.0_d2025_c20260819.csv.gz") |>
  replace(77, "raw_data/StormEvents_details-ftp_v1.0_d2026_c20260918.csv.gz")
urlnames <- paste0("https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d", year, "_c20260323.csv.gz") |>
  replace(35, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d1984_c20260527.csv.gz") |>
  replace(68, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2017_c20260519.csv.gz") |>
  replace(73, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2022_c20260625.csv.gz") |>
  replace(75, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2024_c20260728.csv.gz") |>
  replace(76, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2025_c20260819.csv.gz") |>
  replace(77, "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2026_c20260918.csv.gz")


#as_tibble(filenames) |>
#print(n=77)
#as_tibble(urlnames)

#filenames10 <- filenames[c(1:10)]
#urlnames10 <- urlnames[c(1:10)]

n=length(year)

download.file(url = urlnames, destfile = filenames)
for(i in 1:n) {
  R.utils::gunzip(filename[i])
}




