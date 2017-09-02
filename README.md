# AlphaVantageClient #

[![Build Status](https://travis-ci.org/athompson1991/AlphaVantageClient.svg?branch=master)](https://travis-ci.org/athompson1991/AlphaVantageClient)
[![codecov.io](https://codecov.io/github/athompson1991/AlphaVantageClient/coverage.svg?branch=master)](https://codecov.io/github/athompson1991/AlphaVantageClient?branch=master)
[![Dependency Status](https://dependencyci.com/github/athompson1991/AlphaVantageClient/badge)](https://dependencyci.com/github/athompson1991/AlphaVantageClient)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/AlphaVantageClient)](https://cran.r-project.org/package=AlphaVantageClient) ![](http://cranlogs.r-pkg.org/badges/AlphaVantageClient?color=brightgreen) ![](http://cranlogs.r-pkg.org/badges/grand-total/AlphaVantageClient?color=brightgreen)

## Introduction

[Alpha Vantage](https://www.alphavantage.co/) is a free API which provides both real time and historical stock market data. It is easy to get an API key, intraday data is available, and many technical indicators are included in the service. This package is a simple wrapper client to get data from the API into easy-to-use R objects, namely `xts`.

## Installation

This package is available on CRAN and can be installed with `install.packages("AlphaVantageClient")`. To install this Github version, use `devtools::install_github("athompson1991/AlphaVantageClient")`./

## Usage

### Step One: Set API Key

First, set your API key:

```{r}
setAPIKey("ABCD")
```

### Step Two: Download data.

Here is how to get daily time series loaded directly into an `xts` object:

```{r}
amzn <- fetchSeries(function_nm = "time_series_daily", symbol = "amzn", outputsize = "full", datatype = "json")
```

The function returns a list with two elements - the `xts` object that is interpreted from the response, and the response from the `httr` package request. Now the data can be plotted, analyzed, manipulated into returns, etc.:

```{r}
head(amzn$xts_object)
plot(amzn$xts_object[ ,1])
amzn_returns <- diff(log(amzn$xts_object[ ,1]))
```

Similarly, the other Alpha Vantage data offerings are available using the same function:

```{r}
amzn_sma <- fetchSeries(function_nm = "sma", symbol = "amzn", interval = "daily", time_period = 60, series_type = "close")
amzn_bbands <- fetchSeries(function_nm = "bbands", symbol = "amzn", interval = "daily", time_period = 60, series_type = "close")
```
