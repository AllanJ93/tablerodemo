#' datos_grupoUno UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_datos_grupoUno_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidPage(
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
        )
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
      ),
      fluidRow(
        column(
          width = 12,
          hr(),
          tableOutput(outputId = ns("datosPrimerGrupo_output"))
        )
      )
    )
  )
}

#' datos_grupoUno Server Functions
#'
#' @noRd
mod_datos_grupoUno_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    # Datos del pasajero ------------------------------------------------------

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

    # Datos de la agencia -----------------------------------------------------

    agencia <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$agencia_input
    })

    output$agencia_output <- renderPrint({agencia()})

    agente <- eventReactive(input$capturar_datosPrimerGrupo, {
      input$agente_input
    })

    output$agente_output <- renderPrint({agente()})

    # Fechas de entrada y salida ----------------------------------------------

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

    # Vuelos ------------------------------------------------------------------

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

    datosPrimerGrupo_aux <- eventReactive(input$capturar_datosPrimerGrupo, {

      datos_primerGrupo <- tibble("nombre" = input$nombre_input,
                                  "apellido_pa" = input$apellidoPa_input,
                                  "apellido_ma" = input$apellidoMa_input,
                                  "pasajeros_adultos" = input$pasajerosAdultos_input,
                                  "pasajeros_menores" = input$pasajerosMenores_input,
                                  "pasajeros_infantes" = input$pasajerosInfantes_input,
                                  "pasajeros_totales" = input$pasajerosAdultos_input + input$pasajerosMenores_input + input$pasajerosInfantes_input,
                                  "agencia" = input$agencia_input,
                                  "agente" = input$agente_input,
                                  "fecha_in" = input$fechaIn_input,
                                  "fecha_out" = input$fechaOut_input,
                                  "vuelo_in" = input$vueloFechaIn_input,
                                  "vuelo_in_horario" = input$vueloHorarioIn_input,
                                  "vuelo_in_clave" = input$vueloClaveIn_input,
                                  "vuelo_out" = input$vueloFechaOut_input,
                                  "vuelo_out_horario" = input$vueloHorarioOut_input,
                                  "vuelo_out_clave" = input$vueloClaveOut_input)
    })

    output$datosPrimerGrupo_output <- renderTable({

      datosPrimerGrupo_aux()

    })

  })
}

## To be copied in the UI
# mod_datos_grupoUno_ui("datos_grupoUno_1")

## To be copied in the server
# mod_datos_grupoUno_server("datos_grupoUno_1")
