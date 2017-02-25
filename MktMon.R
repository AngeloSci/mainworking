library(quantmod)
library(xlsx)
library(ggplot2)


getFX(c("EUR/GBP","EUR/USD"),from="2015-07-01")

#plotting EURGBP
tmpData = data.frame(dates = index(EURGBP),EURGBP,EURUSD)
ggplot(tmpData, aes(x = dates, y= EUR.GBP))+
  geom_line(aes(y=EUR.GBP))