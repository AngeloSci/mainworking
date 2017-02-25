library(quantmod)
library(xlsx)
library(ggplot2)

rm(list = ls())

today <- "2017-02-25"
dayslag <- 360*5
main_loc <- "D:/GithubLocal/mainworking/"
filenm <- "pos_data.csv"
mkt_sym = c("EUR/GBP","EUR/USD","USD/JPY","XAU/USD","USD/CHF")

prvdate <- as.character(as.Date(today)-dayslag)
pos_loc <- paste(main_loc,filenm, sep="")

pos_data <- data.frame(read.table(pos_loc, header = TRUE, sep = ","))


instr <- getFX(mkt_sym,from=prvdate)

mkt_list <- list()

for (ii in 1:length(mkt_sym)){
  mkt_list[[ii]] <- get(gsub("/","",mkt_sym[ii]))
  mkt_list[[ii]] <- data.frame(dates = index(mkt_list[[ii]]),mkt_list[[ii]])
}

mkt_data <- data.frame(mkt_list[[1]])
row.names(mkt_data) <- NULL

for (ii in 3:(length(mkt_sym)+1)){
  mkt_data[,ii] <- mkt_list[[ii-1]][match(mkt_data$dates,mkt_list[[ii-1]]$dates),2]
}

colnames(mkt_data) <-c("dates",gsub("/","",mkt_sym))

for (ii in 1:length(instr)){
  rm(list = instr[[ii]])
}




