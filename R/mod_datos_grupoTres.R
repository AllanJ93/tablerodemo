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
          actionButton(inputId = ns("capturar_datosTercerGrupo"), label = "Capturar")
        )
      ),
      fluidRow(
        column(
          width = 12,
          hr(),
          tableOutput(outputId = ns("datosTercerGrupo_output"))
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

    # Rutas -------------------------------------------------------------------

    observeEvent(input$capturar_datosTercerGrupo, {
    })

    ruta <- eventReactive(input$capturar_datosTercerGrupo, {
      input$ruta_input
    })

    output$ruta_output <- renderPrint({ruta()})

    observaciones <- eventReactive(input$capturar_datosTercerGrupo, {
      input$observaciones_input
    })

    output$observaciones_output <- renderPrint({observaciones()})

    plan <- eventReactive(input$capturar_datosTercerGrupo, {
      input$plan_input
    })

    output$plan_output <- renderPrint({plan()})

    # Servicios ---------------------------------------------------------------

    costo <- eventReactive(input$capturar_datosTercerGrupo, {
      input$costo_input
    })

    output$costo_output <- renderPrint({costo()})

    pago <- eventReactive(input$capturar_datosTercerGrupo, {
      input$pago_input
    })

    output$pago_output <- renderPrint({pago()})

    pagoConfirmacion <- eventReactive(input$capturar_datosTercerGrupo, {
      input$pagoConfirmacion_input
    })

    output$pagoConfirmacion_output <- renderPrint({pagoConfirmacion()})

    datosTercerGrupo_aux <- eventReactive(input$capturar_datosTercerGrupo, {

      datos_tercerGrupo <- tibble("ruta" = input$ruta_input,
                                  "observaciones" = input$observaciones_input,
                                  "plan" = input$plan_input,
                                  "costo" = input$costo_input,
                                  "pago" = input$pago_input,
                                  "pago_confirmacion" = input$pagoConfirmacion_input)
    })

    output$datosTercerGrupo_output <- renderTable({

      datosTercerGrupo_aux()

    })

  })
}

## To be copied in the UI
# mod_datos_grupoTres_ui("datos_grupoTres_1")

## To be copied in the server
# mod_datos_grupoTres_server("datos_grupoTres_1")
