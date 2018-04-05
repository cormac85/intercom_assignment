#' Degrees To Radians
#'
#' @param deg numeric degrees (0-360)
#'
#' @return numeric radians
#'
#' @examples
#' deg2rad(90)
#' deg2rad(45)
#'
deg2rad <- function(deg){
  deg * pi / 180
}
