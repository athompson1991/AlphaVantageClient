valid_times <- c("INTRADAY", "DAILY", "DAILY_ADJUSTED", "WEEKLY", "MONTHLY")
valid_ts_intervals <- paste(c(1,5,15,30,60), "min", sep="")
valid_datatypes <- c("json", "csv")
valid_outputsizes <- c("compact", "full")
valid_indicators <- c("SMA", "EMA", "WMA", "DEMA", "TEMA", "TRIMA", "KAMA", "MAMA", "T3", "MACD", "MACDEXT", "STOCH",
                      "STOCHF", "RSI", "STOCHRSI", "WILLR", "ADX", "ADXR", "APO", "PPO", "MOM", "BOP", "CCI", "CMO",
                      "ROC", "ROCR", "AROON", "AROONOSC", "MFI", "TRIX", "ULTOSC", "DX", "MINUS_DI", "PLUS_DI", "BBANDS",
                      "MIDPOINT", "MIDPRICE", "SAR", "TRANGE", "ATR", "NATR", "AD", "ADOSC", "OBV", 
                      "HT_TRENDLINE", "HT_SINE", "HT_TRENDMODE", "HT_DCPERIOD", "HT_DCPHASE", "HT_PHASOR")
valid_tech_intervals <- c("1min", "5min", "15min", "30min", "60min", "daily", "weekly", "monthly")
valid_series_types <- c("close", "open", "high", "low")
validation_list <- list(
  datatype = valid_datatypes,
  indicator = valid_indicators,
  outputsize = valid_outputsizes,
  series_type = valid_series_types,
  ti_interval = valid_tech_intervals,
  ts_interval = valid_ts_intervals,
  time = valid_times
)
