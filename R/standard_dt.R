

#' Standard DT Table
#'
#' @param x a data table
#'
#' @return A DT table with vertical and horizontal scrolling enabled.
#' @export


standard_dt <- function(x) {
  DT::datatable(x,
                options = list(
                  columnDefs = list(list(className = 'dt-center')),
                  scrollY = 300,
                  scroller = TRUE,
                  scrollX = TRUE
                ))
}
