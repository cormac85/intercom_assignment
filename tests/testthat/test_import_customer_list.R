context("Data IO")
requireNamespace("mockery", quietly = TRUE)

test_that(
  "customer (given data) import returns correct df when given file path", {
  mockery::stub(import_customer_list, # Where
                "readLines", # What
                readRDS("./mocked_data/customers_json_lines.rds")) # How

  actual <- import_customer_list("./customer_data/customers.txt")

  expect_is(actual, "data.frame")
  expect_equal(nrow(actual), 32)
  expect_equal(names(actual), c("latitude", "user_id", "name", "longitude"))
  expect_equal(purrr::map(actual, class),
               list(latitude = "numeric", user_id = "numeric",
                    name = "character", longitude = "numeric"))


})

test_that(
  "customer (bad data) import returns correct df when given file path", {
    mockery::stub(import_customer_list, # Where
                  "readLines", # What
                  readRDS("./mocked_data/customers_bad_data.rds")) # How

    expect_warning(
      actual <-
        import_customer_list("./customer_data/customers_bad_data.txt"))

    expect_is(actual, "data.frame")
    expect_equal(nrow(actual), 2)
    expect_equal(names(actual), c("latitude", "user_id", "name", "longitude"))
    expect_equal(purrr::map(actual, class),
                 list(latitude = "numeric", user_id = "numeric",
                      name = "character", longitude = "numeric"))


})


