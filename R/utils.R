#
#' Assign API key to environment.
#' 
#' @param key The API key from AlphaVantage
#' @export
setAPIKey <- function(key="demo"){
  Sys.setenv(AV_API_KEY=key)
  Sys.setenv(AV_BASE_URL="https://www.alphavantage.co/query")
}
