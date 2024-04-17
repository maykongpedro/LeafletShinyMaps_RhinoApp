
# font: https://appsilon.com/leaflet-geomaps/

# Load modules/import data -----------------------------------------------------

box::use(
  readr[read_rds],
  leaflet
)


# Transform and visualize data --------------------------------------------

# read data
#' @export
dataset <- read_rds("data/strong_earthquakes")



# define latitude and longitude
#' @export
japan_lgn <- 138.129731

#' @export
japan_lat <- 38.0615855


# define a custom formula to calculate a radius for earthquakes magnitudes
# only to leaflet know the difference in each magnitude scale
#' @export
radius_earthquakes <- function(magnitude) {
  
  # random constant: the larger it is, the easier it is to spot stronger earthquakes
  constant <- 2
  
  # formula
  sqrt(10^magnitude) * constant
}


# plotmap
leaflet$leaflet() |> 
  leaflet$setView(
    lng = japan_lgn,
    lat = japan_lat,
    zoom = 6
  ) |> 
  leaflet$addProviderTiles("Esri.WorldStreetMap") |> 
  leaflet$addCircles(
    data = dataset,
    radius = radius_earthquakes(dataset$mag),
    color = "#F60D1D",
    fillColor = "#400202",
    fillOpacity = 0.25,
    popup = paste0(
      "<strong>Time: </strong>", dataset$time, "<br>",
      "<strong>Magnitude: </strong>", dataset$mag, "<br>",
      "<strong>Depth (km): </strong>", dataset$depth, "<br>",
      "<strong>Place: </strong>", dataset$place, "<br>"
    )
  )

