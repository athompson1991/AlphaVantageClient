#
#' Assign API key to environment.
#' 
#' @param key The API key from AlphaVantage
#' @export
setAPIKey <- function(key="demo"){
  Sys.setenv(AV_API_KEY=key)
  Sys.setenv(AV_BASE_URL="https://www.alphavantage.co/query")
}

validateArguments <- function(valid_args, given_args){
  valid_names <- names(valid_args)
  given_names <- names(given_args)
  
  if(class(valid_args) != "list" || class(given_args) != "list")
    stop("Invalid arguments. Both the args to be checked and the valid args to check against must be of class list")
  if(is.null(valid_names) | is.null(given_names))
    stop("Invalid arguments. Lists must be named")
  if(any(nchar(valid_names) == 0) || any(nchar(given_names) == 0))
    stop("Invalid arguments. Names must have length greater than 0")
  if(!all(given_names %in% valid_names))
    stop("Arguments are missing from valid list")
  
  out_logic <- sapply(given_names, function(nm){
    check_this <- valid_args[[nm]]
    given_args[nm] %in% check_this
  })
  
  return(out_logic)
}