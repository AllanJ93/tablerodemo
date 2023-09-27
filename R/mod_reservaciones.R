#' reservaciones UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_reservaciones_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' reservaciones Server Functions
#'
#' @noRd 
mod_reservaciones_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_reservaciones_ui("reservaciones_1")
    
## To be copied in the server
# mod_reservaciones_server("reservaciones_1")
