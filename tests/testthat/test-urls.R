context("URL")

test_that("Build URL works as expected", {
  params_list <- list("function" = "time_series", "symbol" = "MSFT", "apikey" = "ABC2")
  expect_equal(buildURL(params_list), "https://www.alphavantage.co/query?function=time_series&symbol=MSFT&apikey=ABC2")
})

test_that("Build time series URL works as expected", {
  setAPIKey("ABC2")
  desired_url <- "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=MSFT&interval=5min&apikey=ABC2"
  url <- buildURLTimeSeries(timeType = "intraday", symbol = "MSFT", interval = "5min")
  expect_equal(url, desired_url)
})