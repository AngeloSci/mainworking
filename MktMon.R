library(quantmod)
library(xlsx)
library(ggplot2)

rm(list = ls())

today <- "2017-02-25"
prvdate <- as.character(as.Date(today)-30)

getFX(c("EUR/GBP","EUR/USD","USD/JPY"),from=prvdate)
getFX("XAU/USD",from=prvdate)

#plotting EURGBP with ggplot2
tmpData = data.frame(dates = index(EURGBP),EURGBP,EURUSD)
ggplot(tmpData, aes(x = dates, y= EUR.GBP))+
  geom_line(aes(y=EUR.GBP))


#plotting EURGBP with quantmod
bx <- layout(matrix(c(1,2,3,4),2,2, byrow = TRUE))
chart_Series(EURGBP)
chart_Series(EURUSD)
chart_Series(XAUUSD)
chart_Series(USDJPY)


