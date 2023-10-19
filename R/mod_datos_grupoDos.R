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
      ),
      fluidRow(
        column(
          width = 12,
          hr(),
          actionButton(inputId = ns("capturar_datosSegundoGrupo"), label = "Capturar")
        )
      ),
      fluidRow(
        column(
          width = 12,
          hr(),
          tableOutput(outputId = ns("datosSegundoGrupo_output"))
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

    # Principal ---------------------------------------------------------------

    observeEvent(input$capturar_datosSegundoGrupo, {
    })

    hotelNombre <- eventReactive(input$capturar_datosSegundoGrupo, {
      input$hotelNombre_input
    })

    output$hotelNombre_output <- renderPrint({hotelNombre()})

    hotelFechaLlegada <- eventReactive(input$capturar_datosSegundoGrupo, {
      input$hotelFechaLlegada_input
    })

    output$hotelFechaLlegada_output <- renderPrint({hotelFechaLlegada()})

    hotelFechaSalida <- eventReactive(input$capturar_datosSegundoGrupo, {
      input$hotelFechaSalida_input
    })

    output$hotelFechaSalida_output <- renderPrint({hotelFechaSalida()})

    hotelConfirmacion <- eventReactive(input$capturar_datosSegundoGrupo, {
      input$hotelConfirmacion_input
    })

    output$hotelConfirmacion_output <- renderPrint({hotelConfirmacion()})

    # Adicionales -------------------------------------------------------------

    hotelFechaAdicional <- eventReactive(input$capturar_datosSegundoGrupo, {
      input$hotelFechaAdicional_input
    })

    output$hotelFechaAdicional_output <- renderPrint({hotelFechaAdicional()})

    hotelAdicional <- eventReactive(input$capturar_datosSegundoGrupo, {
      input$hotelAdicional_input
    })

    output$hotelAdicional_output <- renderPrint({hotelAdicional()})

    # Habitaciones ------------------------------------------------------------

    hotelSgl <- eventReactive(input$capturar_datosSegundoGrupo, {
      input$hotelSgl_input
    })

    output$hotelSgl_output <- renderPrint({hotelSgl()})

    hotelDbl <- eventReactive(input$capturar_datosSegundoGrupo, {
      input$hotelDbl_input
    })

    output$hotelDbl_output <- renderPrint({hotelDbl()})

    hotelTpl <- eventReactive(input$capturar_datosSegundoGrupo, {
      input$hotelTpl_input
    })

    output$hotelTpl_output <- renderPrint({hotelTpl()})

    hotelChd <- eventReactive(input$capturar_datosSegundoGrupo, {
      input$hotelChd_input
    })

    output$hotelChd_output <- renderPrint({hotelChd()})

    datosSegundoGrupo_aux <- eventReactive(input$capturar_datosSegundoGrupo, {

      datos_segundoGrupo <- tibble("hotel" = input$hotelNombre_input,
                                  "hotel_fecha_llegada" = input$hotelFechaLlegada_input,
                                  "hotel_fecha_salida" = input$hotelFechaSalida_input,
                                  "hotel_confirmacion" = input$hotelConfirmacion_input,
                                  "hotel_habSgl" = input$hotelSgl_input,
                                  "hotel_habDbl" = input$hotelDbl_input,
                                  "hotel_habChd" = input$hotelChd_input)
    })

    output$datosSegundoGrupo_output <- renderTable({

      datosSegundoGrupo_aux()

    })

  })
}

## To be copied in the UI
# mod_datos_grupoDos_ui("datos_grupoDos_1")

## To be copied in the server
# mod_datos_grupoDos_server("datos_grupoDos_1")
