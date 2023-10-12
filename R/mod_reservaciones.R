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
                    textInput(inputId = ns("nombre_input"), label = h3("Nombre"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("nombre_output"))
                  ),
                  column(
                    width = 4,
                    textInput(inputId = ns("apellidoPa_input"), label = h3("Apellido Paterno"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("apellidoPa_output")),
                  ),
                  column(
                    width = 4,
                    textInput(inputId = ns("apellidoMa_input"), label = h3("Apellido Materno"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("apellidoMa_output"))
                  )
                )
              ),
            ),
            fluidRow(
              column(
                width = 3,
                numericInput(inputId = ns("pasajerosAdultos_input"), label = h3("Pasajeros adultos"), value = 0, min = 0),
                hr(),
                verbatimTextOutput(outputId = ns("pasajerosAdultos_output")),
              ),
              column(
                width = 3,
                numericInput(inputId = ns("pasajerosMenores_input"), label = h3("Pasajeros menores"), value = 0, min = 0),
                hr(),
                verbatimTextOutput(outputId = ns("pasajerosMenores_output")),
              ),
              column(
                width = 3,
                numericInput(inputId = ns("pasajerosInfantes_input"), label = h3("Pasajeros infantes"), value = 0, min = 0),
                hr(),
                verbatimTextOutput(outputId = ns("pasajerosInfantes_output")),
              ),
              column(
                width = 3,
                h3("Pasajeros totales"),
                verbatimTextOutput(outputId = ns("pasajerosTotales_output")),
              )
            ),
            fluidRow(
              column(
                width = 12,
                h2("Datos de la agencia"),
                fluidRow(
                  column(
                    width = 4,
                    textInput(inputId = ns("agencia_input"), label = h3("Agencia"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("agencia_output"))
                  ),
                  column(
                    width = 4,
                    textInput(inputId = ns("agente_input"), label = h3("Agente"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("agente_output"))
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
                    dateInput(inputId = ns("fechaIn_input"), label = h3("Fecha-In"), value = lubridate::today()),
                    hr(),
                    verbatimTextOutput(outputId = ns("fechaIn_output"))
                  ),
                  column(
                    width = 3,
                    uiOutput(outputId = ns("fechaOutAux_output")),
                    hr(),
                    verbatimTextOutput(outputId = ns("fechaOut_output"))
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
                    dateInput(inputId = ns("vueloFechaIn_input"), label = h3("Vuelo-In Fecha"), value = lubridate::today()),
                    hr(),
                    verbatimTextOutput(outputId = ns("vueloFechaIn_output"))
                  ),
                  column(
                    width = 3,
                    textInput(inputId = ns("vueloHorarioIn_input"), label = h3("Vuelo-In Horario"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("vueloHorarioIn_output"))
                  ),
                  column(
                    width = 3,
                    textInput(inputId = ns("vueloClaveIn_input"), label = h3("Vuelo-In Clave"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("vueloClaveIn_output"))
                  )
                ),
                fluidRow(
                  column(
                    width = 3,
                    uiOutput(outputId = ns("vueloFechaOutAux_output")),
                    hr(),
                    verbatimTextOutput(outputId = ns("vueloFechaOut_output"))
                  ),
                  column(
                    width = 3,
                    textInput(inputId = ns("vueloHorarioOut_input"), label = h3("Vuelo-Out Horario"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("vueloHorarioOut_output"))
                  ),
                  column(
                    width = 3,
                    textInput(inputId = ns("vueloClaveOut_input"), label = h3("Vuelo-Out Clave"), value = ""),
                    hr(),
                    verbatimTextOutput(outputId = ns("vueloClaveOut_output"))
                  )
                )
              )
            ),
            fluidRow(
              column(
                width = 12,
                hr(),
                actionButton(inputId = ns("capturar_datosPrimerGrupo"), label = "Capturar")
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
                downloadButton(outputId = ns("boucher"), label = "Generar voucher", class = "leftAlign")
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

    observeEvent(input$capturar_datosPrimerGrupo, {
      })

    nombre <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$nombre_input
    })

    output$nombre_output <- renderPrint({nombre()})

    apellidoPa <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$apellidoPa_input
    })

    output$apellidoPa_output <- renderPrint({apellidoPa()})

    apellidoMa <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$apellidoMa_input
    })

    output$apellidoMa_output <- renderPrint({apellidoMa()})

    pasajerosAdultos <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$pasajerosAdultos_input
    })

    output$pasajerosAdultos_output <- renderPrint({pasajerosAdultos()})

    pasajerosMenores <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$pasajerosMenores_input
    })

    output$pasajerosMenores_output <- renderPrint({pasajerosMenores()})

    pasajerosInfantes <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$pasajerosInfantes_input
    })

    output$pasajerosInfantes_output <- renderPrint({pasajerosInfantes()})

    output$pasajerosTotales_output <- renderPrint({pasajerosAdultos() +
        pasajerosMenores() +
        pasajerosInfantes()})

    ## Datos de la agencia ----------------------------------------------------

    agencia <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$agencia_input
    })

    output$agencia_output <- renderPrint({agencia()})

    agente <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$agente_input
    })

    output$agente_output <- renderPrint({agente()})

    ## Fechas de entrada y salida ---------------------------------------------

    fechaIn <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$fechaIn_input
    })

    output$fechaIn_output <- renderPrint({fechaIn()})

    fechaIn_aux <- eventReactive(input$fechaIn_input, {
      input$fechaIn_input
    })

    output$fechaOutAux_output <- renderUI({
      dateInput(inputId = ns("fechaOut_input"), label = h3("Fecha-Out"), value = lubridate::as_date(fechaIn_aux()), min = lubridate::as_date(fechaIn_aux()))
    })

    fechaOut <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$fechaOut_input
    })

    output$fechaOut_output <- renderPrint({fechaOut()})

    ## Vuelos -----------------------------------------------------------------

    vueloFechaIn <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$vueloFechaIn_input
    })

    output$vueloFechaIn_output <- renderPrint({vueloFechaIn()})

    vueloHorarioIn <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$vueloHorarioIn_input
    })

    output$vueloHorarioIn_output <- renderPrint({vueloHorarioIn()})

    vueloClaveIn <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$vueloClaveIn_input
    })

    output$vueloClaveIn_output <- renderPrint({vueloClaveIn()})

    vueloFechaIn_aux <- eventReactive(input$vueloFechaIn_input, {
      input$vueloFechaIn_input
    })

    output$vueloFechaOutAux_output <- renderUI({
      dateInput(inputId = ns("vueloFechaOut_input"), label = h3("Vuelo-Out Fecha"), value = lubridate::as_date(vueloFechaIn_aux()), min = lubridate::as_date(vueloFechaIn_aux()))
    })

    vueloFechaOut <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$vueloFechaOut_input
    })

    output$vueloFechaOut_output <- renderPrint({vueloFechaOut()})

    vueloHorarioOut <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$vueloHorarioOut_input
    })

    output$vueloHorarioOut_output <- renderPrint({vueloHorarioOut()})

    vueloClaveOut <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$vueloClaveOut_input
    })

    output$vueloClaveOut_output <- renderPrint({vueloClaveOut()})

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
