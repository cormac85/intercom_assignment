context("Distance Calcs")

float_tolerance <- 1e-6

test_that("degrees converted to radians for typical numbers", {
  expect_equal(deg2rad(85), 1.48353, tolerance = float_tolerance)
})

test_that("degrees converted to radians for a vector of numbers", {
  expect_equal(deg2rad(c(1, 2)), c(0.01745329, 0.03490659),
               tolerance = float_tolerance)
})

test_that("degrees converted to radians for edge cases", {
  expect_equal(deg2rad(0), 0, tolerance = float_tolerance)
  expect_equal(deg2rad(90), pi / 2, tolerance = float_tolerance)
  expect_equal(deg2rad(180), pi, tolerance = float_tolerance)
  expect_equal(deg2rad(360), 2 * pi, tolerance = float_tolerance)
})

test_that("degrees converted to radians fails appropriately", {
  expect_error(deg2rad("a"))
})
