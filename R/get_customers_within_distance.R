#' Get Sorted List of Customers Within Distance to Campus Location
#'
#' @param customers_path Path to customer list in JSON format.
#' @param cutoff_distance Max distance in km to customers.
#' @param indeed_locations_path Path to list of Indeed locations in .csv format
#'
#' @return A data frame with \code{name} and \code{user_id} of those
#' customers that are within 100 km of the Indeed Dublin Campus, sorted
#' by \code{user_id}
#' @export
#'
#' @examples
#' get_customers_within_distance("./path_to_customers.json", cutoff_distance,
#'                               "./path_to_campus_locations.csv")

get_customers_within_distance <- function(customers_path, cutoff_distance,
                                          indeed_locations_path){

  customers <- import_customer_list(customers_path)
  campus_location <-
    get_campus_location("Indeed Dublin HQ", indeed_locations_path)
  customers$long_2 = campus_location$longitude
  customers$lat_2 = campus_location$latitude

  customers$distance_to_hq <-
    calculate_gcd(deg2rad(customers$longitude),
                  deg2rad(customers$latitude),
                  deg2rad(customers$long_2),
                  deg2rad(customers$lat_2))

  customers %>%
    filter(distance_to_hq < cutoff_distance) %>%
    arrange(user_id) %>%
    select(name, user_id)
}
