#' Fetch time series data
#' 
#' This function allows the user to pull data of the five different time series types offered from Alpha Vantage: Intraday, Daily, Daily (Adj. Close),
#' Weekly, and Monthly. 
#' 
#' @param timeType This parameter specifies the time series type. Valid character string input: \code{intraday}, \code{daily}, \code{daily_adjusted}, \code{weekly}, \code{monthly}.
#' @param symbol Stock symbol, such as MSFT for Microsoft.
#' @param interval Required argument for intraday trading. Valid character string input: \code{1min}, \code{5min}, \code{15min}, \code{60min}.
#' @param outputsize Either \code{compact} or \code{full}. Returns only 100 data points versus full-length time series.
#' @param datatype Either \code{csv} or \code{json}.
#' @return An \code{xts} object with the time series data.
#' @export
fetchTimeSeries <- function(timeType = "intraday", symbol = "spy", interval = "5min", outputsize="full", datatype="csv"){
  out = NULL
  url <- buildURLTimeSeries(timeType = timeType, symbol = symbol, interval = interval, outputsize = outputsize, datatype = datatype)
  print(url)
  resp <- httr::GET(url)
  if(httr::http_status(resp)$category == "Success") {
    string_val <- httr::content(resp, "text", encoding = "UTF-8")
    string_vector <- strsplit(string_val, "\\n")[[1]]
    raw_table <- do.call(rbind, sapply(string_vector, strsplit, ","))
    raw_table <- gsub("\r", "", raw_table)
    col_names <- raw_table[1, ]
    times <- raw_table[ ,1]
    df <- as.data.frame(raw_table[-1, ])
    colnames(df) <- col_names
    out <- xts::xts(df[ ,-1], order.by = as.POSIXct(df$timestamp))
  }
  return(out)
}