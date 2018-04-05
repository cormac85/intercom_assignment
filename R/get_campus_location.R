get_campus_location <- function(campus_name){

  readr::read_csv("./customer_data/indeed_locations.csv") %>%
    dplyr::filter(name == campus_name) %>%
    dplyr::select(longitude, latitude)
}
