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
            mod_datos_grupoUno_ui("datos_grupoUno_1")
          ),
          tabPanel(
            title = "Datos (segundo grupo)",
            hr(),
            mainPanel(
              tabsetPanel(
                tabPanel(
                  title = "Primer Hotel",
                  hr(),
                  mod_datos_grupoDos_ui("datos_grupoDos_1")
                )
              )
            )
          ),
          tabPanel(
            title = "Datos (tercer grupo)",
            hr(),
            mod_datos_grupoTres_ui("datos_grupoTres_1")
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

    mod_datos_grupoUno_server("datos_grupoUno_1")

    # Hotel -------------------------------------------------------------------

    mod_datos_grupoDos_server("datos_grupoDos_1")

    # Rutas y servicios -------------------------------------------------------

    mod_datos_grupoTres_server("datos_grupoTres_1")

  })
}

## To be copied in the UI
# mod_reservaciones_ui("reservaciones_1")

## To be copied in the server
# mod_reservaciones_server("reservaciones_1")
