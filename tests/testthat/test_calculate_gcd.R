context("Distance Calcs")

indeed_hq_coordinates <- readRDS("./other_test_data/indeed_hq_coordinates.rds")

test_that("GCD calc is correct to about 100m",{
  geospatial_coordinates <- readRDS("./other_test_data/customers_data_frame.rds")

  long_1 <- deg2rad(geospatial_coordinates$longitude[1])
  lat_1 <- deg2rad(geospatial_coordinates$latitude[1])
  long_2 <- deg2rad(indeed_hq_coordinates$longitude)
  lat_2 <- deg2rad(indeed_hq_coordinates$latitude)

  actual_distance <-calculate_gcd(long_1, lat_1, long_2, lat_2)
  expect_equal(actual_distance, 41.816, tolerance = 1e-1)

  # http://www.gpsvisualizer.com/map?format=google&units=metric&lat1=52.986375&lon1=-6.043701&lat2=53.339428&lon2=-6.257664&convert_format=&gc_segments=&gc_altitude=&tickmark_interval=&show_wpt=3&add_elevation=&trk_colorize=
  # Link above shows distance calculated using the more accurate Vincenty formula.
})

test_that("GCD calc is correct when given identical coordinates",{
  long_1 <- deg2rad(indeed_hq_coordinates$longitude)
  lat_1 <- deg2rad(indeed_hq_coordinates$latitude)
  long_2 <- deg2rad(indeed_hq_coordinates$longitude)
  lat_2 <- deg2rad(indeed_hq_coordinates$latitude)

  actual_distance <- calculate_gcd(long_1, lat_1, long_2, lat_2)
  expect_equal(actual_distance, 0)
})

test_that("GCD calc fails appropriately with garbage data",{
  long_1 <- deg2rad(indeed_hq_coordinates$longitude)
  lat_1 <- "a"
  long_2 <- deg2rad(indeed_hq_coordinates$longitude)
  lat_2 <- "b"

  expect_error(calculate_gcd(long_1, lat_1, long_2, lat_2))
})

test_that("GCD calc gives 0 distance with at 0 edge case",{
  long_1 <- 0
  lat_1 <- 0
  long_2 <- 0
  lat_2 <- 0

  expect_equal(calculate_gcd(long_1, lat_1, long_2, lat_2), 0)
})

test_that("GCD calc works for large angles",{
  long_1 <- deg2rad(721)
  lat_1 <- deg2rad(361)
  long_2 <- deg2rad(722)
  lat_2 <- deg2rad(362)

  expect_equal(calculate_gcd(long_1, lat_1, long_2, lat_2), 157,
               tolerance = 1)
})
