box::use(
  shiny[moduleServer, NS, tagList, div],
  leaflet
)


#' @export
ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    leaflet$leafletOutput(ns("map"))
  )

}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {

    output$map <- leaflet$renderLeaflet({

      # import constants
      box::use(app/logic/earthquakes_leaflet_map[japan_lgn, japan_lat])

      # import customized formula
      box::use(app/logic/earthquakes_leaflet_map[radius_earthquakes])

      # import data
      box::use(app/logic/earthquakes_leaflet_map[dataset])

      # plot map
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

    })

  })
}
