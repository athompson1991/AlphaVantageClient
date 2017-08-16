success_response <- httr::GET(buildURL("sma", symbol = "msft", interval = "daily", time_period = 60, series_type = "close"))
error_response <- httr::GET(buildURL("time_series_intraday", symbol = "msft", interval = "daily", outputsize = "full", datatype = "json"))
empty_response <- httr::GET(buildURL("sma", symbol = "msfsdft", interval = "30min", time_period = 60, series_type = "close"))

response_list <- list(success = success_response, error = error_response, empty = empty_response)