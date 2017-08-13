#
#' Assign API key to global environment.
#' 
#' @param key The API key from AlphaVantage
#' @export
setAPIKey <- function(key){
  api_key <<- key
}

buildURL <- function(named_list){
  outURL <- paste0("https://www.alphavantage.co/query?")
  for(i in 1:length(named_list)){
    k <- names(named_list)[i]
    v <- named_list[i]
    outURL <- paste0(outURL, k, "=", v, "&")
  }
  outURL <- substr(outURL, 1, nchar(outURL)-1)
  return(outURL)
}

buildURLTimeSeries <- function(timeType, symbol, interval, outputsize="full", datatype="csv"){
  valid_times <- c("INTRADAY", "DAILY", "DAILY_ADJUSTED", "WEEKLY", "MONTHLY")
  valid_intervals <- paste(c(1,5,15,30,60), "min", sep="")
  valid_datatype <- c("json", "csv")
  valid_outputsize <- c("compact", "full")
  
  params_list <- list(
    "function" = paste0("TIME_SERIES_", toupper(timeType))
    ,"symbol" = symbol
    ,"interval" = interval
    ,"apikey" = api_key
  )
  url <- buildURL(params_list)
  return(url)
}



