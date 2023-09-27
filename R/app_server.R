#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny dplyr
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  output$menu <- renderMenu({
    menus <- tibble(tipo = c("Reservaciones", "Operaciones", "Status"),
                    nombre = c("reservaciones", "operaciones", "status"),
                    icono = c("calendar-days", "gears", "clipboard-check")) %>%
      purrr::pmap(function(tipo, nombre, icono){
        menuItem(tipo,selected = F,
                 tabName = nombre,
                 icon = icon(icono)
        )
      })
    sidebarMenu(.list = menus)
  })

  mod_reservaciones_server("reservaciones_1")
  mod_operaciones_server("operaciones_1")
  mod_status_server("status_1")

}
