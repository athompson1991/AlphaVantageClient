#' Fetch time series data
#' 
#' This function allows the user to pull data of the five different time series types offered using Alpha Vantage: Intraday, Daily, Daily (Adj. Close),
#' Weekly, and Monthly. 
#' 
#' @param timeType This parameter specifies the time series type. Valid character string input: \code{intraday}, \code{daily}, \code{daily_adjusted}, \code{weekly}, \code{monthly}.
#' @param symbol Stock symbol, such as MSFT for Microsoft.
#' @param interval Required argument for intraday trading. Valid character string input: \code{1min}, \code{5min}, \code{15min}, \code{60min}.
#' @param outputsize Either \code{compact} or \code{full}. Returns only 100 data points versus full-length time series.
#' @param datatype Either \code{csv} or \code{json}. Currently only \code{csv} is available, but development of \code{json} is possible in the future.
#' @return An \code{xts} object with the time series data.
#' @export
fetchTimeSeries <- function(timeType = "intraday", symbol = "spy", interval = "5min", outputsize="full", datatype="csv"){
  out <- NULL
  url <- buildURLTimeSeries(timeType = timeType, symbol = symbol, interval = interval, outputsize = outputsize, datatype = datatype)
  cat(paste0("\n", url, "\n"))
  resp <- httr::GET(url)
  
  if(datatype == "csv"){
    
    if(httr::http_status(resp)$category == "Success") {
      
      if(resp$headers$`content-type` == "application/json" && names(httr::content(resp)) == "Error Message")
        base::stop(paste0("Bad API call. This could be because of a bad symbol name. Content of response below:\n\n", httr::content(resp)))
      
      string_val <- httr::content(resp, "text", encoding = "UTF-8")
      string_vector <- base::strsplit(string_val, "\\n")[[1]]
      raw_table <- base::do.call(rbind, base::sapply(string_vector, strsplit, ","))
      raw_table <- base::gsub("\r", "", raw_table)
      col_names <- raw_table[1, ]
      times <- raw_table[ ,1]
      df <- as.data.frame(raw_table[-1, ])
      colnames(df) <- col_names
      xts_table <- xts::xts(apply(df[ ,-1], 2, as.numeric), order.by = base::as.POSIXct(df$timestamp))
      out <- xts_table
    }
  }
  return(out)
}


fetchTechnicalIndicator <- function(indicator = "stoch", symbol = "spy", interval = "daily", other_args = list()){
  url <- buildURLTechnicalIndicator(indicator = indicator, symbol = symbol, interval = interval)
  
}