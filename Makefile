# Build the Data Fluency site into docs/ (published by GitHub Pages).
#
#   make                       build every page
#   make visualisation1.html   build one page
#   make clean                 remove knitr leftovers from website/
#
# Pages are rendered next to their source and then moved into docs/: rendering with
# output_dir makes pandoc miss gganimate's GIFs, which are silently left out of the page.
# Uses the token from `gh auth login` so GitHub package installs work.

PAGES := index visualisation1 data-wrangling1 how-to-use-worksheets

export GITHUB_PAT := $(shell gh auth token 2>/dev/null)

.PHONY: all clean $(PAGES:=.html)

all: $(PAGES:=.html)
	@echo "Built into docs/. Check 'git status docs/' before pushing."

$(PAGES:=.html):
	cd website && Rscript -e "out <- rmarkdown::render('$(basename $@).rmd'); stopifnot(file.rename(out, file.path('../docs', basename(out))))"

clean:
	rm -rf website/*_cache website/*_files
