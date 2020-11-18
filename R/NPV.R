#' Calculate total NPV
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
NPV <- function(x, y) {
  sum(purrr::map2_dbl(x, y, ~(.y+1)^.x))
}

