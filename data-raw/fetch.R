bad_fetch <- fetchSeries(function_nm = "time_series_daily", symbol = "mr_potato_head")
good_fetch <- fetchSeries(function_nm = "time_series_daily", symbol = "amzn")

fetch_list <- list(good = good_fetch, bad = bad_fetch)
