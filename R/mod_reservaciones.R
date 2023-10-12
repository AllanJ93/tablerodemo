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
                   mainPanel(
                     tabsetPanel(
                       tabPanel(
                         title = "Primer Hotel",
                         hr(),
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
                   )
          ),
          tabPanel(
            title = "Datos (tercer grupo)",
            hr(),
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
                downloadButton(outputId = ns("boucher"), label = "Generar boucher", class = "leftAlign")
              )
            )
          )
        )
      )
    )
  )
}

#' reservaciones Server Functions
#'
#' @noRd
mod_reservaciones_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    # Reservaciones -----------------------------------------------------------

    ## Datos del pasajero -----------------------------------------------------

    output$nombre_salida <- renderPrint({input$nombre_entrada})

    output$apellidoPa_salida <- renderPrint({input$apellidoPa_entrada})

    output$apellidoMa_salida <- renderPrint({input$apellidoMa_entrada})

    output$pasajerosAdultos_salida <- renderPrint({input$pasajerosAdultos_entrada})

    output$pasajerosMenores_salida <- renderPrint({input$pasajerosMenores_entrada})

    output$pasajerosInfantes_salida <- renderPrint({input$pasajerosInfantes_entrada})

    output$pasajerosTotales_salida <- renderPrint({input$pasajerosAdultos_entrada +
        input$pasajerosMenores_entrada +
        input$pasajerosInfantes_entrada })

    ## Datos de la agencia ----------------------------------------------------

    output$agencia_salida <- renderPrint({input$agencia_entrada})

    output$agente_salida <- renderPrint({input$agente_entrada})

    ## Fechas de entrada y salida ---------------------------------------------

    output$fechaIn_salida <- renderPrint({input$fechaIn_entrada})

    output$fechaOut_salida <- renderPrint({input$fechaOut_entrada})

    ## Vuelos -----------------------------------------------------------------

    output$vueloFechaIn_salida <- renderPrint({input$vueloFechaIn_entrada})

    output$vueloHorarioIn_salida <- renderPrint({input$vueloHorarioIn_entrada})

    output$vueloClaveIn_salida <- renderPrint({input$vueloClaveIn_entrada})

    output$vueloFechaOut_salida <- renderPrint({input$vueloFechaOut_entrada})

    output$vueloHorarioOut_salida <- renderPrint({input$vueloHorarioOut_entrada})

    output$vueloClaveOut_salida <- renderPrint({input$vueloClaveOut_entrada})

    output$prueba_output <- renderPrint({input$prueba_input})


    # Hotel -------------------------------------------------------------------

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

    # Rutas y servicios -------------------------------------------------------

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
# mod_reservaciones_ui("reservaciones_1")

## To be copied in the server
# mod_reservaciones_server("reservaciones_1")
