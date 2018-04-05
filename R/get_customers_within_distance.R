get_customers_within_distance <- function(customers_path){
  customers <- import_customer_list(customers_path)

  campus_location <- get_campus_location("Indeed Dublin HQ")
  customers_df$long_2 = campus_location$longitude
  customers_df$lat_2 = campus_location$latitude


  customers_df$distance_to_hq <- calculate_gcd(deg2rad(customers_df$longitude),
                                               deg2rad(customers_df$latitude),
                                               deg2rad(customers_df$long_2),
                                               deg2rad(customers_df$lat_2))

  customers_df %>%
    filter(distance_to_hq < 100) %>%
    arrange(user_id) %>%
    select(name, user_id)
}
