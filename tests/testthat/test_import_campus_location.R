context("Data IO")
requireNamespace("mockery", quietly = TRUE)

test_that("a valid Indeed location can be retrieved from file", {
  mockery::stub(get_campus_location,
                "readr::read_csv",
                readRDS("./mocked_data/indeed_locations.rds"))

  actual <- get_campus_location("Indeed Dublin HQ",
                                "./customer_data/indeed_locations.csv")

  expect_equal(c(actual$longitude[1], actual$latitude[1]),
               c(-6.26, 53.3),
               tolerance = 1e-3)
})

test_that("an invalid Indeed location will return an error", {
  mockery::stub(get_campus_location,
                "readr::read_csv",
                readRDS("./mocked_data/indeed_locations.rds"))

  expect_error(get_campus_location("foo", "./customer_data/indeed_locations.csv"),
               "Campus location cannot be found.")
})

test_that("error message when campus location file not found makes sense", {
  mockery::stub(get_campus_location,
                "readr::read_csv",
                # Must prevent errors within the test environment or
                # test will spuriously fail.
                try(readr::read_csv("./mocked_data/indeed_locations.csv"),
                    silent = TRUE))

  expect_error(get_campus_location("Indeed Dublin HQ",
                                   "./customer_data/indeed_locations.csv"),
               "Campus file cannot be found or campus file format is incorrect.")
})

