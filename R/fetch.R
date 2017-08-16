#' Fetch time series data
#' 
#' This function allows the user to pull data of the five different time series types offered using Alpha Vantage: Intraday, Daily, Daily (Adj. Close),
#' Weekly, and Monthly. 
#' 
#' @param function_nm
#' @param ... 
#' @return An \code{xts} object with the time series data.
#' @export
fetchSeries <- function(function_nm, ...) {
  url <- buildURL(function_nm, ...)
  response <- httr::GET(url)
  return(response)
}