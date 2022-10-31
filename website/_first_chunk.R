library(tidyverse)
library(pander)
library(webex)
library(whisker)
library(vembedr)


# devtools::install_github("benwhalley/psydata")
library(psydata)

knitr::opts_chunk$set(
  echo = TRUE,
  collapse = F,
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


video <- function(yt_id){ 
  whisker.render('
<div class="videowrapper">

<div class="videowrapper-video">
<iframe width="800" height="500" src="//www.youtube-nocookie.com/embed/{{yt_id}}?rel=0"
frameborder="0" allow="autoplay; encrypted-media" allowfullscreen data-external="1"></iframe>

</div>
</div>
')
}