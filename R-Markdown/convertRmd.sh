#!/usr/bin/env bash

# 
# convert to html and ipynb formats
#

Rscript -e "library(knitr); knit('R1-Introduction.Rmd')"
pandoc R1-Introduction.md > R1-Introduction.html
Rscript -e "library(rmd2jupyter); rmd2jupyter('R1-Introduction.Rmd')"
htmldoc -f R1-Introduction.pdf R1-Introduction.html

git rm ../R1-Introduction.ipynb
git mv R1-Introduction.ipynb ../R1-Introduction.ipynb
