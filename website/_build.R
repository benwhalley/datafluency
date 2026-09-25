## This file is for staff to use to re-build the web pages to support the teaching sessions.
##
## Pushing docs/ triggers github to publish changes to https://benwhalley.github.io/datafluency/
## In RStudio use 'Run' not 'Source' to execute this script
##
## WARNING: Requires a TeX environment suitable for rendering some special characters as HTML
## WARNING: Check console warnings and docs/*.html for potential breakage of teaching materials before pushing


# set current path to where this is running from
# do it manually if not running in RStudio
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# rebuild docs into /docs which is where github serves them from
# render next to the source, then move the html into docs/: rendering with output_dir
# makes pandoc miss gganimate's GIFs, which are silently left out of the page
build <- function(f) {
  out <- rmarkdown::render(f)
  file.rename(out, file.path("../docs", basename(out)))
}

build('index.rmd')
build('visualisation1.rmd')
build('visualisation-extensions.rmd')

build('data-wrangling1.rmd')
build('data-wrangling-extensions.rmd')
build('data-wrangling2.rmd')


#build('visualisation2.rmd')
build('real-data-practical.rmd')

build('teacher-notes.rmd')
build('how-to-use-worksheets.rmd')


