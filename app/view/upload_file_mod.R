box::use(
  shiny[moduleServer, NS, tagList],
  shiny.semantic[fileInput],
)

#' @export
ui <- function(id) {
  ns <- NS(id)

  tagList(
    fileInput(
      inputId = ns("uploaded_file"),
      label = "Carregue o arquivo para conversão",
      multiple = TRUE
    )
  )
  
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {

  })
}
