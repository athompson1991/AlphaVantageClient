buildURL <- function(named_list){
  outURL <- paste0(Sys.getenv("AV_BASE_URL"), "?")
  for(i in 1:length(named_list)){
    k <- names(named_list)[i]
    v <- named_list[i]
    outURL <- paste0(outURL, k, "=", v, "&")
  }
  outURL <- substr(outURL, 1, nchar(outURL)-1)
  return(outURL)
}

buildURLTimeSeries <- function(timeType, symbol, interval, outputsize, datatype){
  timeType <- toupper(timeType)
  symbol <- toupper(symbol)
  
  valid_times <- c("INTRADAY", "DAILY", "DAILY_ADJUSTED", "WEEKLY", "MONTHLY")
  valid_intervals <- paste(c(1,5,15,30,60), "min", sep="")
  valid_datatypes <- c("json", "csv")
  valid_outputsizes <- c("compact", "full")
  
  valid_list <- list(time = valid_times, interval = valid_intervals, datatype = valid_datatypes, outputsize = valid_outputsizes)
  given_list <- list(time = timeType, interval = interval, datatype = datatype, outputsize = outputsize)
  validated_logic <- validateArguments(valid_list, given_list)
  
  if(!(all(validated_logic))){
    bad_args <- names(validated_logic[!(validated_logic)])
    print_this <- paste0(bad_args, sep = ", ", collapse="")
    print_this <- substr(print_this, 1, nchar(print_this) - 2)
    stop(paste0("Invalid arguments: ", print_this))
  }
  
  params_list <- list(
    "function" = paste0("TIME_SERIES_", timeType)
    ,"symbol" = symbol
    ,"interval" = interval
    ,"datatype" = datatype
    ,"outputsize" = outputsize
    ,"apikey" = Sys.getenv("AV_API_KEY")
  )
  
  url <- buildURL(params_list)
  return(url)
}



