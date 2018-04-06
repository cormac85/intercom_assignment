# TODO Fix bug in reading data in this test.

context("Customers")
requireNamespace("mockery", quietly = TRUE)

test_that("customer distance returned is in correct_format",{
  skip("Bug in test code")
  actual <- get_customers_within_distance("./other_test_data/customers.txt", 100,
                                           "./other_test_data/indeed_locations.csv")
  expect_is(actual, "data.frame")
  expect_true("distance_to_hq" %in% names(actual))

})
