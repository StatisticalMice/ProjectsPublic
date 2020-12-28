require(arrow)

bucket <- "https://ursa-labs-taxi-data.s3.us-east-2.amazonaws.com"
dir.create("nyc-taxi")

options(timeout=300)
getOption('timeout')

for (year in 2011:2019) {
  dir.create(file.path("nyc-taxi", year))
  if (year == 2019) {
    # We only have through June 2019 there
    months <- 1:6
  } else {
    months <- 1:12
  }
  for (month in months) {
    if (month < 10) {
      month <- paste0("0", month)
    }
    dir.create(file.path("nyc-taxi", year, month))
    download.file(
      paste(bucket, year, month, "data.parquet", sep = "/"),
      file.path("nyc-taxi", year, month, "data.parquet"),
      mode = 'wb'
    )
  }
}


