NPV <- function(x, y) {
  sum(map2_dbl(x, y, ~(.y+1)^.x))
}
