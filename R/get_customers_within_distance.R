#' Get Sorted List of Customers Within Distance to Campus Location
#'
#' @param customers_path Path to customer list in JSON format.
#' @param cutoff_distance Max distance in km to customers.
#' @param intercom_locations_path Path to list of Intercom locations in .csv format
#'
#' @return A data frame with \code{name} and \code{user_id} of those
#' customers that are within 100 km of the Intercom Dublin Campus, sorted
#' by \code{user_id}
#' @export
#' @importFrom magrittr "%>%"
#'
#' @examples
#' get_customers_within_distance("./path_to_customers.json", cutoff_distance,
#'                               "./path_to_campus_locations.csv")

get_customers_within_distance <- function(customers_path,
                                          cutoff_distance,
                                          intercom_locations_path,
                                          intercom_location_name){

  customers <- import_customer_list(customers_path)
  campus_location <-
    import_campus_location(intercom_location_name, intercom_locations_path)
  customers$long_2 = campus_location$longitude
  customers$lat_2 = campus_location$latitude

  customers$distance_to_hq <-
    calculate_gcd(deg2rad(customers$longitude),
                  deg2rad(customers$latitude),
                  deg2rad(customers$long_2),
                  deg2rad(customers$lat_2))

  customers %>%
    dplyr::filter(distance_to_hq < cutoff_distance) %>%
    dplyr::arrange(user_id) %>%
    dplyr::select(name, user_id)
}
