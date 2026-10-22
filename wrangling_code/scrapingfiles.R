download.file("https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d1950_c20260323.csv.gz",
              destfile = "raw_data/StormEvents_details-ftp_v1.0_d1950_c20260323.csv.gz")
R.utils::gunzip("raw_data/StormEvents_details-ftp_v1.0_d1950_c20260323.csv.gz")
details1950 <- read.csv("raw_data/StormEvents_details-ftp_v1.0_d1950_c20260323.csv", header = TRUE)


year <- 1950:2026
filenames <- paste0("raw_data/StormEvents_details-ftp_v1.0_d", year, "_c20260323.csv.gz")
urlnames <- paste0("https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d", year, "_c20260323.csv.gz")


#as_tibble(filenames)
#as_tibble(urlnames)

#filenames10 <- filenames[c(1:10)]
#urlnames10 <- urlnames[c(1:10)]

n=length(year)

download.file(url = urlnames, destfile = filenames)
for(i in 1:n) {
  R.utils::gunzip(filename[i])
}




