# Load modules ------------------------------------------------------------
box::use(
  readr[read_csv, write_rds],
  dplyr[filter]
)


# Data transformation -----------------------------------------------------

# read data
earthquakes <- read_csv("data-raw/Japan earthquakes 2001 - 2018.csv")


# filter only the strongs earthquakes
strong_earthquakes <- earthquakes |> 
  filter(mag >= 6)



# Export ------------------------------------------------------------------

strong_earthquakes |>
  write_rds(
    file = "data/strong_earthquakes",
    compress = "xz"
  )
  





