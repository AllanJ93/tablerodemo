#' datos_grupoDos UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_datos_grupoDos_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidPage(
      fluidRow(
        column(
          width = 12,
          h2("Datos del Hotel"),
          fluidRow(
            column(
              width = 3,
              textInput(inputId = ns("hotelNombre_input"), label = h3("Hotel"), value = ""),
              hr(),
              verbatimTextOutput(outputId = ns("hotelNombre_output"))
            ),
            column(
              width = 3,
              dateInput(inputId = ns("hotelFechaLlegada_input"), label = h3("Fecha llegada"), value = lubridate::today()),
              hr(),
              verbatimTextOutput(outputId = ns("hotelFechaLlegada_output"))
            ),
            column(
              width = 3,
              dateInput(inputId = ns("hotelFechaSalida_input"), label = h3("Fecha salida"), value = lubridate::today()),
              hr(),
              verbatimTextOutput(outputId = ns("hotelFechaSalida_output"))
            ),
            column(
              width = 3,
              textInput(inputId = ns("hotelConfirmacion_input"), label = h3("Confirmación"), value = ""),
              hr(),
              verbatimTextOutput(outputId = ns("hotelConfirmacion_output"))
            )
          )
        )
      ),
      fluidRow(
        column(
          width = 12,
          h2("Habitaciones"),
          fluidRow(
            column(
              width = 3,
              numericInput(inputId = ns("hotelSgl_input"), label = h3("Single"), value = 0, min = 0),
              hr(),
              verbatimTextOutput(outputId = ns("hotelSgl_output"))
            ),
            column(
              width = 3,
              numericInput(inputId = ns("hotelDbl_input"), label = h3("Double"), value = 0, min = 0),
              hr(),
              verbatimTextOutput(outputId = ns("hotelDbl_output"))
            ),
            column(
              width = 3,
              numericInput(inputId = ns("hotelTpl_input"), label = h3("Triple"), value = 0, min = 0),
              hr(),
              verbatimTextOutput(outputId = ns("hotelTpl_output"))
            ),
            column(
              width = 3,
              numericInput(inputId = ns("hotelChd_input"), label = h3("Child"), value = 0, min = 0),
              hr(),
              verbatimTextOutput(outputId = ns("hotelChd_output"))
            )
          )
        )
      )
    )
  )
}

#' datos_grupoDos Server Functions
#'
#' @noRd
mod_datos_grupoDos_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    ## Principal --------------------------------------------------------------

    output$hotelNombre_output <- renderPrint({input$hotelNombre_input})

    output$hotelFechaLlegada_output <- renderPrint({input$hotelFechaLlegada_input})

    output$hotelFechaSalida_output <- renderPrint({input$hotelFechaSalida_input})

    output$hotelConfirmacion_output <- renderPrint({input$hotelConfirmacion_input})

    ## Adicionales ------------------------------------------------------------

    output$hotelFechaAdicional_output <- renderPrint({input$hotelFechaAdicional_input})

    output$hotelAdicional_output <- renderPrint({input$hotelAdicional_input})

    ## Habitaciones ------------------------------------------------------------

    output$hotelSgl_output <- renderPrint({input$hotelSgl_input})

    output$hotelDbl_output <- renderPrint({input$hotelDbl_input})

    output$hotelTpl_output <- renderPrint({input$hotelTpl_input})

    output$hotelChd_output <- renderPrint({input$hotelChd_input})

  })
}

## To be copied in the UI
# mod_datos_grupoDos_ui("datos_grupoDos_1")

## To be copied in the server
# mod_datos_grupoDos_server("datos_grupoDos_1")
