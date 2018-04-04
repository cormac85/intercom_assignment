context("Customers")

test_that("customer distance returnedis in correct_format",{
  mockery::stub(get_customers_within_distance, # Where
                "readLines", # What
                readRDS("./mocked_data/customers_json_lines.rds"),
                depth = 2) # How

  actual <- get_customers_within_distance("./customer_data/customers.txt")

  testthat::expect_is(actual, "data.frame")
  testthat::expect_true("customer_distance" %in% names(actual))

})
