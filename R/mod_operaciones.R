#' operaciones UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_operaciones_ui <- function(id){
  ns <- NS(id)
  tagList(
    # fluidPage(
    #   shinyjs::useShinyjs(),
    #   titlePanel("Reservaciones"),
    #   # sidebarLayout(
    #   #   sidebarPanel(
    #   #     # Inputs excluded for brevity
    #   #   ),
    #   mainPanel(
    #     tabsetPanel(
    #       tabPanel("Datos (primer grupo)",
    #                plotOutput("plot")),
    #       tabPanel("Datos (segundo grupo)", verbatimTextOutput("summary")),
    #       tabPanel("Datos (tercer grupo)", tableOutput("table"))
    #     )
    #   )
    #   # )
    # )
  )
}

#' operaciones Server Functions
#'
#' @noRd
mod_operaciones_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_operaciones_ui("operaciones_1")

## To be copied in the server
# mod_operaciones_server("operaciones_1")
