box::use(
  shiny[moduleServer, NS, a, div, tagList],
  leaflet
)

#' @export
ui <- function(id) {
  ns <- NS(id)

  tagList(
    leaflet$leafletOutput(ns("map")))
  # div(leaflet$leafletOutput(NS("map"))) # ESSE DA ERRO PRO CONTA DO NS
  
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {

  })
}
