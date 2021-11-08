## This file is for staff to use to re-build the web pages to support the teaching sessions.
##
## Pushing docs/ triggers github to publish changes to https://benwhalley.github.io/lifesavR/
## In RStudio use 'Run' not 'Source' to execute this script
##
## WARNING: Requires a TeX environment suitable for rendering some special characters as HTML
## WARNING: Check console warnings and docs/*.html for potential breakage of teaching materials before pushing


# set current path to where this is running from
# do it manually if not running in RStudio
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# rebuild docs into /docs which is where github serves them from
rmarkdown::render('index.Rmd', output_dir = "../docs")
rmarkdown::render('visualisation1.rmd', output_dir = "../docs")
rmarkdown::render('teacher-notes.rmd', output_dir = "../docs")



