# AlphaVantageClient #

[![Build Status](https://travis-ci.org/athompson1991/AlphaVantageClient.svg?branch=master)](https://travis-ci.org/athompson1991/AlphaVantageClient)
[![codecov.io](https://codecov.io/github/athompson1991/AlphaVantageClient/coverage.svg?branch=master)](https://codecov.io/github/athompson1991/AlphaVantageClient?branch=master)

## Introduction

Alpha Vantage is a free API which provides both real time and historical stock market data. It is easy to get an API key, intraday data is available, and many technical indicators are included in the service. This package is a simple wrapper client to get data from the API into easy-to-use R objects, namely `xts`.

## Step One: Set API Key

First, set your API key:

```{r}
setAPIKey("ABCD")
```

## Step Two: Download data.

Here is how to get daily time series loaded directly into an `xts` object:

```{r}
amzn <- fetchSeries(function_nm = "time_series_daily", symbol = "amzn", outputsize = "full", datatype = "json")
```

Now it can be plotted, analyzed, manipulated into returns, etc.:

```{r}
head(amzn$xts_object)
plot(amzn$xts_object[ ,1])
```
