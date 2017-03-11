library(quantmod)
library(xlsx)
library(ggplot2)

rm(list = ls())


# ------------------------------- INPUTS -----------------------------------------------
# General & Market Data
today <- "2017-02-23"
dayslag <- 360*5
main_loc <- "D:/GithubLocal/mainworking/"
filenm <- "pos_data.csv"
mkt_sym = c("EUR/GBP","EUR/USD","USD/JPY","XAU/USD","USD/CHF","USD/GBP")
source(paste(main_loc,"Functions.R",sep = ""))

# Simulation
rep_ccy <- "GBP"
sim_st <- as.character(as.Date(today)-dayslag)
sim_e <- today
value <- today
simlen <- 5000
# ------------------------------- DATA LOADING -----------------------------------------------
prvdate <- as.character(as.Date(today)-dayslag)
pos_loc <- paste(main_loc,filenm, sep="")

pos_data <- data.frame(read.table(pos_loc, header = TRUE, sep = ","))
colnames(pos_data)[1] <- "Instrument"

instr <- getFX(mkt_sym,from=prvdate)

# ------------------------------- DATA HANDLING AND MANIPULATION -----------------------------------------------

# Storing all market data in a list as data frames
mkt_list <- list()

for (ii in 1:length(mkt_sym)){
  mkt_list[[ii]] <- get(gsub("/","",mkt_sym[ii]))
  mkt_list[[ii]] <- data.frame(dates = index(mkt_list[[ii]]),mkt_list[[ii]])
}


# Creating a data frame with synchronous data
mkt_data <- data.frame(mkt_list[[1]])
row.names(mkt_data) <- NULL

for (ii in 3:(length(mkt_sym)+1)){
  mkt_data[,ii] <- mkt_list[[ii-1]][match(mkt_data$dates,mkt_list[[ii-1]]$dates),2]
}

colnames(mkt_data) <-c("dates",gsub("/","",mkt_sym))


# Cleaning workspace
for (ii in 1:length(instr)){
  rm(list = instr[[ii]])
}
rm(mkt_list)

# ------------------------------- SIMULATION -----------------------------------------------

fx_crate = fx_rate("EUR","GBP",today,mkt_data=mkt_data)

pos_data[,4] <- fx_rate(pos_data[,3],rep_ccy,today,mkt_data=mkt_data)
colnames(pos_data)[4] <- paste("CCY",rep_ccy,sep="")

mkt_ret <- log(mkt_data[2:nrow(mkt_data),2:ncol(mkt_data)])-log(mkt_data[1:nrow(mkt_data)-1,2:ncol(mkt_data)])
mkt_ret <- mkt_ret *100
unifextr <- runif(simlen,min=1, max = nrow(mkt_data))

test <- mkt_data[unifextr,]