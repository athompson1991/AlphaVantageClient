urlHelper <- function(named_list){
  outURL <- paste0(Sys.getenv("AV_BASE_URL"), "?")
  for(i in 1:length(named_list)){
    k <- names(named_list)[i]
    v <- named_list[i]
    outURL <- paste0(outURL, k, "=", v, "&")
  }
  outURL <- substr(outURL, 1, nchar(outURL)-1)
  return(outURL)
}

buildURL <- function(function_nm, ...) {
  function_nm <- toupper(function_nm)
  
  if(!(tolower(function_nm) %in% names(technical_indicator_specification)))
    stop("Invalid function_nm, must be in the list of available functions from Alpha Vantage documentation")
  
  given_list <- list(...)
  if(length(given_list) == 0){
    required_args <- technical_indicator_specification[[tolower(function_nm)]][["required"]]
    print_this <- good_print(required_args, "No additional arguments to function_nm, invalid query. Required args")
    stop(print_this)
  }
  if("symbol" %in% names(given_list))
    given_list[["symbol"]] <- toupper(given_list[["symbol"]])
  
  check_these_args <- given_list[names(given_list) %in% names(validation_list)]
  validation_logic <- validateArguments(valid_args = validation_list, given_args = check_these_args)
  validationEasyPrint(validation_logic)
  
  checkForRequiredAndOptionalArgs(given_list, function_nm)
  params_list <- c(list("function" = function_nm), given_list, list("apikey" = Sys.getenv("AV_API_KEY")))
  
  url <- urlHelper(params_list)
  return(url)
}
