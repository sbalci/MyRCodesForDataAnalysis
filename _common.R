knitr::opts_chunk$set(
  comment = "",
  collapse = TRUE,
  cache = TRUE,
  error = FALSE,
  warning = FALSE,
  message = FALSE,
  echo = FALSE,
  dpi = 300,
  cache.lazy = FALSE
  # tidy = "styler",
  # out.width = "90%",
  # fig.align = "center",
  # fig.width = 5,
  # fig.height = 7
)

options(crayon.enabled = FALSE)

suppressPackageStartupMessages(library(tidyverse))
theme_set(theme_light())

library(scales)
library(methods)

source("R/loadLibrary.R")

knitr::write_bib(c(
  .packages(), 'bookdown', 'knitr', 'rmarkdown'
), 'packages.bib')


