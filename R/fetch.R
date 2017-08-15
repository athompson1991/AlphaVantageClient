fetchTimeSeries <- function(timeType = "intraday", symbol = "spy", interval = "5min", outputsize="full", datatype="csv"){
  out = NULL
  url <- buildURLTimeSeries(timeType = timeType, symbol = symbol, interval = interval, outputsize = outputsize, datatype = datatype)
  print(url)
  resp <- httr::GET(url)
  if(httr::http_status(resp)$category == "Success") {
    string_val <- httr::content(resp, "text", encoding = "UTF-8")
    string_vector <- strsplit(string_val, "\\n")[[1]]
    raw_table <- do.call(rbind, sapply(string_vector, strsplit, ","))
    raw_table <- gsub("\r", "", raw_table)
    col_names <- raw_table[1, ]
    times <- raw_table[ ,1]
    df <- as.data.frame(raw_table[-1, ])
    colnames(df) <- col_names
    out <- xts::xts(df[ ,-1], order.by = as.POSIXct(df$timestamp))
  }
  return(out)
}