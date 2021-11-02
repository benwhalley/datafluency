library(tidyverse)
library(pander)
library(webex)

# devtools::install_github("benwhalley/psydata")
library(psydata)

knitr::opts_chunk$set(
  echo = TRUE,
  collapse = TRUE,
  comment = NA,
  cache = FALSE,
  message = FALSE
)
options(dplyr.summarise.inform = FALSE)


makermds <- function(video_data){
  identifier <- video_data$identifier
  fs::file_create(paste0("_content/", identifier, "_code.rmd"))
  fs::file_create(paste0("_content/", identifier, "_transcript.rmd"))
  fs::file_create(paste0("_content/", identifier, "_summary.rmd"))

  rstudioapi::navigateToFile(paste0("_content/", identifier, "_summary.rmd"))
}
