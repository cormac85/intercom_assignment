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
