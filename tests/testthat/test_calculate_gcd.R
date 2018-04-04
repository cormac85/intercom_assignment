context("Distance Calcs")



test_that("GCD calc is in correct format",{
  geospatial_coordinates <- readRDS("./other_test_data/customers_data_frame.rds")

  actual_distance <-
    calculate_gcd(geospatial_coordinates$longitude[1] %>% deg2rad,
                  geospatial_coordinates$latitude[1] %>% deg2rad,
                  53.339428 %>% deg2rad,
                  -6.257664 %>% deg2rad)
  expect_equal(actual_distance, 40)
})
