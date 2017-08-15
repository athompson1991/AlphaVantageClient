context("Fetch")

setAPIKey("KZFRGTQMS328Q5KP")

test_that("Timeseries works as expected", {
  intraday_msft <- fetchTimeSeries(timeType = "intraday", symbol = "msft", interval = "1min", outputsize = "compact", datatype = "csv")
  expect_equal(class(intraday_msft)[1], "xts")
  expect_length(colnames(intraday_msft), 5)
  expect_equal(colnames(intraday_msft), c("open", "high", "low", "close", "volume"))
})