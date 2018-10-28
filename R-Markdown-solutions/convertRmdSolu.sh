#!/usr/bin/env bash

# 
# convert to html and ipynb formats
#

Rscript -e "library(knitr); knit('R1-Introduction-solutions.Rmd')"
pandoc R1-Introduction-solutions.md > R1-Introduction-solutions.html
Rscript -e "library(rmd2jupyter); rmd2jupyter('R1-Introduction-solutions.Rmd')"
htmldoc -f R1-Introduction-solutions.pdf R1-Introduction-solutions.html

#git rm ../R1-Introduction.ipynb
mv R1-Introduction-solutions.ipynb ../solutions/R1-Introduction-solutions.ipynb
