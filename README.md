# EnvDataSciNotebooks

#How to convert from R markdown to notebook (.ipynb)

#find it from: 

https://github.com/mkearney/rmd2jupyter

#1. install and load rmd2jupyter package
devtools::install_github("mkearney/rmd2jupyter")

library(rmd2jupyter)

#2. convert using rmd2jpyter

rmd2jupyter('C:/Users/.../test.Rmd')

#3. open via your jupyter notebook method

# rmd2jupyter('Z:/EnvDataSciNotebooks/R-Markdown/R1-Introduction.Rmd')
