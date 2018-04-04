#' Import Customer Data From File To Data Frame
#'
#' @param customers_path String containing path to json file
#' @return A data frame with
#'
#' @examples
#' \dontrun{import_customer_list("./customer_data/customers.txt")}

import_customer_list <- function(customers_path){

  customers_path %>%
    readLines() %>%
    paste(collapse = ',') %>% # correct to proper json format
    sprintf("[%s]", .) %>%
    rjson::fromJSON() %>%
    purrr::map_df(data.frame, stringsAsFactors = FALSE) %>%
    dplyr::mutate(latitude = as.numeric(latitude),
                  longitude = as.numeric(longitude))
}

