context("URL")

test_that("Build URL works as expected", {
  params_list <- list("function" = "time_series", "symbol" = "MSFT", "apikey" = "ABC2")
  expect_equal(buildURL(params_list), "https://www.alphavantage.co/query?function=time_series&symbol=MSFT&apikey=ABC2")
})

test_that("Build time series URL works as expected", {
  setAPIKey()
  desired_url <- "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=MSFT&interval=5min&datatype=csv&outputsize=full&apikey=demo"
  url <- buildURLTimeSeries(timeType = "intraday", symbol = "MSFT", interval = "5min", outputsize = "full", datatype = "csv")
  expect_equal(url, desired_url)
})