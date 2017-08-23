#' Fetch time series data
#' 
#' This is the main function that pulls data directly from Alpha Vantage into a convenient \code{xts} object. This is a general function
#' that reflects exactly the documentation listed \href{https://www.alphavantage.co/documentation/}{online}.
#' 
#' @param function_nm The function name. While case insensitive, this argument needs to be exactly as listed in the documentation. Examples include \code{time_series_daily}, \code{sma}, and \code{bbands}.
#' @param ... Other arguments. If a required argument is missing then an error will be thrown. If an optional argument is missing then a warning will be thrown.
#' @return A two element list: the first element is the \code{xts} object named \code{xts_object} and the second is the raw http response named \code{httr_response} (see \code{httr} package for details on this class)
#' @export
fetchSeries <- function(function_nm, ...) {
  url <- buildURL(function_nm, ...)
  response <- httr::GET(url)
  out <- parseResponse(response)
  return(out)
}