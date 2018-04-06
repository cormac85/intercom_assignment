#' Get Campus Location
#'
#' @param campus_name Name of campus that is to be returned.
#' @param campus_file_path Path to file containing all campuses and locations, must be .csv.
#'
#' @return A data frame with one row and values \code{latitude} and \code{longitude}.
#'
#' @examples
#' get_campus_location("Intercom Dublin HQ", "./path_to_campus_file.csv")
get_campus_location <- function(campus_name, campus_file_path){

  tryCatch({
  campus_location <-
    readr::read_csv(campus_file_path) %>%
    dplyr::filter(name == campus_name) %>%
    dplyr::select(longitude, latitude)
  },
  error = function(e){
    stop("Campus file cannot be found or campus file format is incorrect.")
  })


  if(nrow(campus_location) == 0){
    stop("Campus location cannot be found.")
  }

  campus_location

}
