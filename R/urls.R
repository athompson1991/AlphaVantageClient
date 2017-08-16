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
  
  given_list <- list(time = timeType, ts_interval = interval, datatype = datatype, outputsize = outputsize)
  validated_logic <- validateArguments(validation_list, given_list)
  
  validationEasyPrint(validated_logic)
  
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

buildURLTechnicalIndicator <- function(indicator, symbol, interval, other_args = list()){
  indicator <- toupper(indicator)
  symbol <- toupper(symbol)
  key <- Sys.getenv("AV_API_KEY")
  
  given_list <- c(list(indicator = indicator, ti_interval = interval))
  validation_logic <- validateArguments(valid_args = validation_list, given_args = given_list)
  
  validationEasyPrint(validation_logic)
  checkForRequiredAndOptionalArgs(other_args = other_args, indicator = indicator)
  
  params_list <- c(
    list(
      "function" = indicator,
      "symbol" = symbol,
      "interval" = interval
    ),
    other_args,
    list("apikey" = key)
  )
  
  url <- buildURL(params_list)
  return(url)
}

