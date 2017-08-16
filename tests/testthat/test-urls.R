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
  expect_error(buildURLTimeSeries(timeType = "intraday", symbol = "MSFT", interval = "4min", outputsize = "full", datatype = "csv"),
               "Invalid arguments: ts_interval")
})

test_that("Build technical indicator URL works as expected", {
  setAPIKey()
  expect_equal(buildURLTechnicalIndicator(indicator = "bop", symbol = "msft", interval = "daily"), 
               "https://www.alphavantage.co/query?function=BOP&symbol=MSFT&interval=daily&apikey=demo")
  expect_error(buildURLTechnicalIndicator(indicator = "sma", symbol = "msft", interval = "daily"), "All required arguments not met, this still missing: time_period,series_type,")
  expect_warning(buildURLTechnicalIndicator(indicator = "macd", symbol = "msft", interval = "daily", other_args = list(series_type = "open")),
                 "All optional arguments not met, this still missing: fastperiod,slowperiod,signalperiod,")
})