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
  
  other_arg_names <- names(other_args)
  required_args <- technical_indicator_specification[[tolower(indicator)]][["required"]]
  optional_args <- technical_indicator_specification[[tolower(indicator)]][["optional"]]
  
  has_requirements <- NULL
  has_optional_args <- NULL
  if(length(required_args) > 0)
    has_requirements <- all(required_args %in% other_arg_names)
  if(length(optional_args) > 0)
    has_optional_args <- all(optional_args %in% other_arg_names)
  
  if(!(is.null(has_requirements)))
    if(!(has_requirements))
      stop(paste0("All required arguments not met, this still missing: ", paste0(required_args[!(required_args %in% other_arg_names)], sep = ",", collapse = "")))

  if(!(is.null(has_optional_args)))
    if(!(has_optional_args))
      warning(paste0("All optional arguments not met, this still missing: ", paste0(optional_args[!(optional_args %in% other_arg_names)], sep = ",", collapse = "")))
  
  
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

