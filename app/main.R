box::use(
  shiny[bootstrapPage, div, moduleServer, NS, h1, tags, fluidRow],
  shiny.semantic[
    semanticPage, tabset
  ]
)

box::use(app/view/earthquake_map)
box::use(app/view/rhino_test_module)
box::use(app/view/upload_file_mod)


#' @export
ui <- function(id) {
  ns <- NS(id)
  
  semanticPage(
    
    title = "Leaflet Examples - Rhino App",
    tabset(
      tabs = list(
        list(
          menu = "Primeira página", 
          content = earthquake_map$ui(ns("map_earthquake")),
          id = "first_tab"
        ),
        list(
          menu = "Segunda página", 
          content = upload_file_mod$ui(ns("upload_page")) , 
          id = "second_tab"
        )
      )
    )
    
    
  )
  
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    earthquake_map$server("map_earthquake")
    
  })
}
