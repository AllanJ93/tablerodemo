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
      h1("Reservaciones"),
      hr(),
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
                width = 12,
                h2("Datos del pasajero"),
                fluidRow(
                  column(
                    width = 4,
                    textInput(inputId = ns("nombre_entrada"), label = h3("Nombre"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("nombre_salida"))
                  ),
                  column(
                    width = 4,
                    textInput(inputId = ns("apellidoPa_entrada"), label = h3("Apellido Paterno"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("apellidoPa_salida")),
                  ),
                  column(
                    width = 4,
                    textInput(inputId = ns("apellidoMa_entrada"), label = h3("Apellido Materno"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("apellidoMa_salida"))
                  )
                )
              ),
            ),
            fluidRow(
              column(
                width = 3,
                numericInput(inputId = ns("pasajerosAdultos_entrada"), label = h3("Pasajeros adultos"), value = 0, min = 0),
                hr(),
                verbatimTextOutput(outputId = ns("pasajerosAdultos_salida")),
              ),
              column(
                width = 3,
                numericInput(inputId = ns("pasajerosMenores_entrada"), label = h3("Pasajeros menores"), value = 0, min = 0),
                hr(),
                verbatimTextOutput(outputId = ns("pasajerosMenores_salida")),
              ),
              column(
                width = 3,
                numericInput(inputId = ns("pasajerosInfantes_entrada"), label = h3("Pasajeros infantes"), value = 0, min = 0),
                hr(),
                verbatimTextOutput(outputId = ns("pasajerosInfantes_salida")),
              ),
              column(
                width = 3,
                h3("Pasajeros totales"),
                # textInput(inputId = ns("pasajerosTotales_entrada"), label = h3("Pasajeros totales"), value = ""),
                # hr(),
                verbatimTextOutput(outputId = ns("pasajerosTotales_salida")),
              )
            ),
            fluidRow(
              column(
                width = 12,
                h2("Datos de la agencia"),
                fluidRow(
                  column(
                    width = 4,
                    textInput(inputId = ns("agencia_entrada"), label = h3("Agencia"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("agencia_salida"))
                  ),
                  column(
                    width = 4,
                    textInput(inputId = ns("agente_entrada"), label = h3("Agente"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("agente_salida"))
                  )
                )
              )
            ),
            fluidRow(
              column(
                width = 12,
                h2("Fechas de entrada y salida"),
                fluidRow(
                  # column(
                  #   width = 3,
                  #   dateRangeInput(inputId = ns("fechaIn_entrada"), label = h3("Fecha-In"), min = lubridate::today()),
                  #   hr(),
                  #   verbatimTextOutput(outputId = ns("fechaIn_salida"))
                  # ),
                  column(
                    width = 3,
                    dateInput(inputId = ns("fechaIn_entrada"), label = h3("Fecha-In"), value = lubridate::today()),
                    hr(),
                    verbatimTextOutput(outputId = ns("fechaIn_salida"))
                  ),
                  column(
                    width = 3,
                    dateInput(inputId = ns("fechaOut_entrada"), label = h3("Fecha-Out"), value = lubridate::today() + lubridate::days(1)),
                    hr(),
                    verbatimTextOutput(outputId = ns("fechaOut_salida"))
                  )
                )
              )
            ),
            fluidRow(
              column(
                width = 12,
                h2("Vuelos"),
                fluidRow(
                  column(
                    width = 3,
                    dateInput(inputId = ns("vueloFechaIn_entrada"), label = h3("Vuelo-In Fecha"), value = lubridate::today()),
                    hr(),
                    verbatimTextOutput(outputId = ns("vueloFechaIn_salida"))
                  ),
                  column(
                    width = 3,
                    textInput(inputId = ns("vueloHorarioIn_entrada"), label = h3("Vuelo-In Horario"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("vueloHorarioIn_salida"))
                  ),
                  column(
                    width = 3,
                    textInput(inputId = ns("vueloClaveIn_entrada"), label = h3("Vuelo-In Clave"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("vueloClaveIn_salida"))
                  )
                ),
                fluidRow(
                  column(
                    width = 3,
                    dateInput(inputId = ns("vueloFechaOut_entrada"), label = h3("Vuelo-Out Fecha"), value = lubridate::today()),
                    hr(),
                    verbatimTextOutput(outputId = ns("vueloFechaOut_salida"))
                  ),
                  column(
                    width = 3,
                    textInput(inputId = ns("vueloHorarioOut_entrada"), label = h3("Vuelo-Out Horario"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("vueloHorarioOut_salida"))
                  ),
                  column(
                    width = 3,
                    textInput(inputId = ns("vueloClaveOut_entrada"), label = h3("Vuelo-Out Clave"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("vueloClaveOut_salida"))
                  )
                )
              )
            )
          ),
          tabPanel(title = "Datos (segundo grupo)",
                   hr(),
                   textInput(inputId = ns("prueba_input"), label = h3("Text input"), value = "Enter text..."),
                   fluidRow(
                     column(
                     width = 3,
                     verbatimTextOutput(outputId = ns("prueba_output")))
                   )
                   ),
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

    # Datos del pasajero ------------------------------------------------------

    output$nombre_salida <- renderPrint({input$nombre_entrada})

    output$apellidoPa_salida <- renderPrint({input$apellidoPa_entrada})

    output$apellidoMa_salida <- renderPrint({input$apellidoMa_entrada})

    output$pasajerosAdultos_salida <- renderPrint({input$pasajerosAdultos_entrada})

    output$pasajerosMenores_salida <- renderPrint({input$pasajerosMenores_entrada})

    output$pasajerosInfantes_salida <- renderPrint({input$pasajerosInfantes_entrada})

    output$pasajerosTotales_salida <- renderPrint({input$pasajerosAdultos_entrada +
        input$pasajerosMenores_entrada +
        input$pasajerosInfantes_entrada })

    # Datos de la agencia -----------------------------------------------------

    output$agencia_salida <- renderPrint({input$agencia_entrada})

    output$agente_salida <- renderPrint({input$agente_entrada})

    # Fechas de entrada y salida ----------------------------------------------

    output$fechaIn_salida <- renderPrint({input$fechaIn_entrada})

    output$fechaOut_salida <- renderPrint({input$fechaOut_entrada})

    # Vuelos ------------------------------------------------------------------

    output$vueloFechaIn_salida <- renderPrint({input$vueloFechaIn_entrada})

    output$vueloHorarioIn_salida <- renderPrint({input$vueloHorarioIn_entrada})

    output$vueloClaveIn_salida <- renderPrint({input$vueloClaveIn_entrada})

    output$vueloFechaOut_salida <- renderPrint({input$vueloFechaOut_entrada})

    output$vueloHorarioOut_salida <- renderPrint({input$vueloHorarioOut_entrada})

    output$vueloClaveOut_salida <- renderPrint({input$vueloClaveOut_entrada})

    output$prueba_output <- renderPrint({input$prueba_input})

  })
}

## To be copied in the UI
# mod_reservaciones_ui("reservaciones_1")

## To be copied in the server
# mod_reservaciones_server("reservaciones_1")
