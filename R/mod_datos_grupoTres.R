#' datos_grupoTres UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_datos_grupoTres_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidPage(
      fluidRow(
        column(
          width = 12,
          h2("Rutas y servicios"),
          fluidRow(
            column(
              width = 4,
              textInput(inputId = ns("ruta_input"), label = h3("Ruta"), value = ""),
              hr(),
              verbatimTextOutput(outputId = ns("ruta_output")
              )
            ),
            column(
              width = 4,
              textInput(inputId = ns("observaciones_input"), label = h3("Observaciones"), value = ""),
              hr(),
              verbatimTextOutput(outputId = ns("observaciones_output")
              )
            ),
            column(
              width = 4,
              textInput(inputId = ns("plan_input"), label = h3("Plan"), value = ""),
              hr(),
              verbatimTextOutput(outputId = ns("plan_output")
              )
            )
          )
        )
      ),
      fluidRow(
        column(
          width = 12,
          fluidRow(
            column(
              width = 4,
              textInput(inputId = ns("costo_input"), label = h3("Costo"), value = ""),
              hr(),
              verbatimTextOutput(outputId = ns("costo_output")
              )
            ),
            column(
              width = 4,
              textInput(inputId = ns("pago_input"), label = h3("Pago"), value = ""),
              hr(),
              verbatimTextOutput(outputId = ns("pago_output")
              )
            ),
            column(
              width = 4,
              selectInput(inputId = ns("pagoConfirmacion_input"), label = h3("Pago confirmación"), choices = c("Confirmado", "Sin Confirmar"), selected = "", multiple = F),
              hr(),
              verbatimTextOutput(outputId = ns("pagoConfirmacion_output")
              )
            )
          )
        )
      ),
      fluidRow(
        column(
          width = 12,
          hr(),
          downloadButton(outputId = ns("boucher"), label = "Generar voucher", class = "leftAlign")
        )
      )
    )
  )
}

#' datos_grupoTres Server Functions
#'
#' @noRd
mod_datos_grupoTres_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    ## Rutas ------------------------------------------------------------------

    output$ruta_output <- renderPrint({input$ruta_input})

    output$observaciones_output <- renderPrint({input$observaciones_input})

    output$plan_output <- renderPrint({input$plan_input})

    ## Servicios --------------------------------------------------------------

    output$costo_output <- renderPrint({input$costo_input})

    output$pago_output <- renderPrint({input$pago_input})

    output$pagoConfirmacion_output <- renderPrint({input$pagoConfirmacion_input})

  })
}

## To be copied in the UI
# mod_datos_grupoTres_ui("datos_grupoTres_1")

## To be copied in the server
# mod_datos_grupoTres_server("datos_grupoTres_1")
