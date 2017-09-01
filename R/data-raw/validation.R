valid_datatypes <- c("json", "csv")
valid_outputsizes <- c("compact", "full")
valid_function <- c(
  "TIME_SERIES_INTRADAY", "TIME_SERIES_DAILY", "TIME_SERIES_DAILY_ADJUSTED", "TIME_SERIES_WEEKLY", "TIME_SERIES_MONTHLY", "SMA",
  "EMA", "WMA", "DEMA", "TEMA", "TRIMA", "KAMA", "MAMA", "T3", "MACD", "MACDEXT", "STOCH",
  "STOCHF", "RSI", "STOCHRSI", "WILLR", "ADX", "ADXR", "APO", "PPO", "MOM", "BOP", "CCI", "CMO",
  "ROC", "ROCR", "AROON", "AROONOSC", "MFI", "TRIX", "ULTOSC", "DX", "MINUS_DI", "PLUS_DI", "BBANDS",
  "MIDPOINT", "MIDPRICE", "SAR", "TRANGE", "ATR", "NATR", "AD", "ADOSC", "OBV", 
  "HT_TRENDLINE", "HT_SINE", "HT_TRENDMODE", "HT_DCPERIOD", "HT_DCPHASE", "HT_PHASOR", "SECTOR"
  )
valid_intervals <- c("1min", "5min", "15min", "30min", "60min", "daily", "weekly", "monthly")
valid_series_types <- c("close", "open", "high", "low")
validation_list <- list(
  datatype = valid_datatypes,
  "function" = valid_function,
  outputsize = valid_outputsizes,
  series_type = valid_series_types,
  interval = valid_intervals
)
