#' reservaciones UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @import shinycssloaders
#' @importFrom shiny NS tagList
mod_reservaciones_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidPage(
      titlePanel("Reservaciones"),
      # sidebarLayout(
      #   sidebarPanel(
      #     # Inputs excluded for brevity
      #   ),
      mainPanel(
        tabsetPanel(
          tabPanel(
            title = "Datos (primer grupo)",
            hr(),
            fluidRow(
              column(
                width = 3,
                textInput("nombre_entrada", label = h3("Nombre"), value = ""),
                hr(),
                verbatimTextOutput("nombre_salida"),
                textInput("agencia_entrada", label = h3("Agencia"), value = ""),
                hr(),
                verbatimTextOutput("agencia_salida"),
              ),
              column(
                width = 3,
                textInput("apellidoPa_entrada", label = h3("Apellido Paterno"), value = ""),
                hr(),
                verbatimTextOutput("apellidoPa_salida"),
                textInput("agente_entrada", label = h3("Agente"), value = ""),
                hr(),
                verbatimTextOutput("agente_salida"),
              ),
              column(
                width = 3,
                textInput("apellidoMa_entrada", label = h3("Apellido Materno"), value = ""),
                hr(),
                verbatimTextOutput("apellidoMa_salida")
              ),
            )
          ),
          tabPanel("Datos (segundo grupo)", verbatimTextOutput("summary")),
          tabPanel("Datos (tercer grupo)", tableOutput("table"))
        )
      )
      # )
    )
  )
}

#' reservaciones Server Functions
#'
#' @noRd
mod_reservaciones_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    function(input, output) {

      output$nombre_salida <- renderPrint({input$nombre_entrada})

    }

    function(input, output) {

      output$apellidoPa_salida <- renderPrint({input$apellidoPa_entrada})

    }

    function(input, output) {

      output$apellidoMa_salida <- renderPrint({input$apellidoMa_entrada})

    }

    function(input, output) {

      output$agencia_salida <- renderPrint({input$agencia_entrada})

    }

    function(input, output) {

      output$agente_salida <- renderPrint({input$agente_entrada})

    }

  })
}

## To be copied in the UI
# mod_reservaciones_ui("reservaciones_1")

## To be copied in the server
# mod_reservaciones_server("reservaciones_1")
