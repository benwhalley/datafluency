setwd("~/dev/datafluency/")


rmarkdown::render('index.rmd')

rmarkdown::render('00-glossary-and-cheatsheet.rmd')
rmarkdown::render('00-how-to-use-worksheets.html')
rmarkdown::render('00-teacher-notes.rmd')

rmarkdown::render('01-exploring-data.rmd')
rmarkdown::render('01-using-rstudio.rmd')

rmarkdown::render('02-plotting.rmd')
rmarkdown::render('02-plotting-extensions.rmd')

rmarkdown::render('03-data-wrangling.rmd')
rmarkdown::render('03-data-wrangling-extensions.rmd')

rmarkdown::render('04-regression.rmd')
rmarkdown::render('04-regression-extensions.rmd')


rmarkdown::render('05-multiple-regression-contin-by-categ.rmd')
rmarkdown::render('05-multiple-regression-extensions.html')


rmarkdown::render('09-open-science.rmd')
rmarkdown::render('09-open-science-extensions.rmd')
