#' Import Customer Data From File To Data Frame
#'
#' @param customers_path String containing path to json file
#' @return A data frame with
#'
#' @examples
#' \dontrun{import_customer_list("./customer_data/customers.txt")}

import_customer_list <- function(customers_path){

  tryCatch({customers <- readLines(customers_path)},
           error = function(e){
             stop("Cannot read customers file.")
           }
  )

  customers <-
    customers %>%
    paste(collapse = ',') %>% # correct to proper json format
    sprintf("[%s]", .) %>%
    jsonlite::fromJSON() %>%
    dplyr::mutate(latitude = as.numeric(latitude),
                  longitude = as.numeric(longitude),
                  user_id = as.numeric(user_id)) %>%
    na.omit()

  customers
}

