#!/usr/bin/env bash

# 
# convert to html and ipynb formats
#

fn='R6-times-and-timeseries'

Rscript -e "library(knitr); knit('$fn.Rmd')"
pandoc $fn.md > $fn.html
Rscript -e "library(rmd2jupyter); rmd2jupyter('$fn.Rmd')"
htmldoc -f $fn.pdf $fn.html

#git rm ../R1-databasics.ipynb
mv $fn.ipynb ../solutions/$fn.ipynb
