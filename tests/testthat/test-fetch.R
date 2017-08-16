context("Fetch")
cat("\n\nweird printout...\n")

setAPIKey("KZFRGTQMS328Q5KP")

test_that("Timeseries intraday works as expected", {
  intraday_msft <- fetchTimeSeries(timeType = "intraday", symbol = "msft", interval = "1min", outputsize = "compact", datatype = "csv")
  expect_equal(class(intraday_msft)[1], "xts")
  expect_length(colnames(intraday_msft), 5)
  expect_equal(colnames(intraday_msft), c("open", "high", "low", "close", "volume"))
  expect_true(all(apply(intraday_msft, 2, class) == "numeric"))
})

test_that("Timeseries daily adjusted works as expected", {
  daily_msft <- fetchTimeSeries(timeType = "daily_adjusted", symbol = "msft", outputsize = "compact", datatype = "csv")
  expect_equal(class(daily_msft)[1], "xts")
  expect_length(colnames(daily_msft), 8)
  expect_equal(colnames(daily_msft), c("open", "high", "low", "close", "adjusted_close", "volume", "dividend_amount", "split_coefficient"))
  expect_true(all(apply(daily_msft, 2, class) == "numeric"))
})
