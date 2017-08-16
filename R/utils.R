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
  if(!all(given_names %in% valid_names)){
    bad_names <- names(given_names[!(given_names %in% valid_names)])
    print_this <- paste0("Arguments are missing from valid list: ", bad_names, sep = ",")
    stop(print_this)
  }
  out_logic <- sapply(given_names, function(nm){
    check_this <- valid_args[[nm]]
    given_args[nm] %in% check_this
  })
  
  return(out_logic)
}

validationEasyPrint <- function(logic){
  if(!(all(logic))){
    bad_args <- names(logic[!(logic)])
    print_this <- paste0(bad_args, sep = ", ", collapse="")
    print_this <- substr(print_this, 1, nchar(print_this) - 2)
    stop(paste0("Invalid arguments: ", print_this))
  }
}