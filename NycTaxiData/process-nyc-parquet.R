library(arrow, warn.conflicts = FALSE)
library(dplyr, warn.conflicts = FALSE)

system.time(ds <- open_dataset("/Volumes/SanDiskSSD/TestData/nyc-taxi-parquet/", partitioning = c("year", "month")))
system.time(write_dataset(ds, "/Volumes/SanDiskSSD/TestData/nyc-taxi-arrow/feather", format = "feather"))

if (FALSE) {
  
  system.time(ds %>%
                filter(total_amount > 100) %>% # , year == 2018
                select(tip_amount, total_amount, passenger_count) %>%
                group_by(passenger_count) %>%
                collect() %>%
                summarize(
                  tip_pct = median(100 * tip_amount / total_amount),
                  n = n()
                ) %>%
                print())
  
  
  system.time(ds %>%
                select(trip_distance) %>%
                summarize(
                  min_distance = min(trip_distance),
                  max_distance = max(trip_distance)
                ) %>%
                print())
  
}
