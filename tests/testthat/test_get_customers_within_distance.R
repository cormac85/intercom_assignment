context("Customers")

test_that("customer distance returnedis in correct_format",{
  skip("not ready")
  mockery::stub(get_customers_within_distance, # Where
                "readLines", # What
                readRDS("./mocked_data/customers_json_lines.rds"),
                depth = 2) # How

  mockery::stub(get_customers_within_distance,
                "read.csv",
                readRDS("./mocked_data/indeed_locations.rds"),
                depth = 2)

  actual <- get_customers_within_distance("./customer_data/customers.txt")

  testthat::expect_is(actual, "data.frame")
  testthat::expect_true("customer_distance" %in% names(actual))

})
