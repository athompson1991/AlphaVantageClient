source("./data-raw/required-args.R")
source("./data-raw/validation.R")
source("./data-raw/responses.R")
source("./data-raw/fetch.R")

devtools::use_data(
  technical_indicator_specification,
  validation_list,
  response_list,
  fetch_list,
  overwrite = T, internal = T
)

rm(list = ls())
