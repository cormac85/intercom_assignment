#' Calculate Great Circle Distance
#'
#' @param long_1 Longitude of first coordinate, in radians.
#' @param lat_1 Latitude of first coordinate, in radians.
#' @param long_2 Longitude of second coordinate, in radians.
#' @param lat_2 Latitude of second coordinate, in radians.
#'
#' @return A numeric vector of distance between the two given coordinates in km.
#' @export
#'
#' @examples
#' calculate_gcd <- function(deg2rad(-6), deg2rad(55),
#'                           deg2rad(-7), deg2rad(56))
calculate_gcd <- function(long_1, lat_1, long_2, lat_2){

  earth_radius <- 6371 # mean earth radius in km
  arc_length <-
    acos(
      pmin(pmax( # need to account for rounding errors
        sin(lat_1) * sin(lat_2) +
          cos(lat_1) * cos(lat_2) * cos(long_2 - long_1), -1.0), 1.0)
    ) *
    earth_radius

  arc_length
}
