library(quantmod)
library(xlsx)
library(ggplot2)

rm(list = ls())

today <- "2017-02-25"
dayslag <- 360*5
main_loc <- "D:/GithubLocal/mainworking/"
filenm <- "pos_data.csv"


prvdate <- as.character(as.Date(today)-dayslag)
pos_loc <- paste(main_loc,filenm, sep="")

pos_data <- read.table(pos_loc, header = TRUE, sep = ",")

getFX(c("EUR/GBP","EUR/USD","USD/JPY","XAU/USD","USD/CHF"),from=prvdate)


