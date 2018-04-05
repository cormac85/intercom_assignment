context("Data IO")

test_that("a valid Indeed location can be retrieved from file", {
  mockery::stub(get_campus_location,
                "readr::read_csv",
                readRDS("./mocked_data/indeed_locations.rds"),
                depth = 2)

  actual <- get_campus_location("Indeed Dublin HQ")

  expect_equal(c(actual$longitude[1], actual$latitude[1]),
               c(-6.26, 53.3),
               tolerance = 1e-3)
})

