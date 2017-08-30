context("Fetch")

test_that("fetchSeries works as expected", {
  expect_equal(names(fetch_list$good), c("xts_object", "httr_response"))
  expect_equal(names(fetch_list$bad), c("xts_object", "httr_response"))
  expect_equal(fetch_list$bad$xts_object, "Bad response, error")
})