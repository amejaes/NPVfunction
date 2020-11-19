#' Calculate total NPV
#'
#'Calculate the total NPV from yearly profits and a discount rate
#'
#' @param x Numeric vector or list
#' @param y Numeric vector
#'
#' @return
#' A vector containing the sum of the NPV
#' @export
#'
#' @examples
#' NPV(1:10, 0.05)
#' NPV(c(200, 180, 240), 0.08)
NPV <- function(x, y) {
  if(length(y) > 1) {
    stop('I am so sorry, but this function only works when the number of elements in y is 1.')
  }
  sum(purrr::map2_dbl(x, y, ~(.y+1)^.x))
}


