
standardize_fx <- function(rep_ccy,mkt_data){
  
  
  
}


fx_rate <- function(ccy1,ccy2,date,mkt_data){
  #date = today
  #ccy1 = "EUR"
  #ccy2 = "GBP"
  
  avlbl_rates = colnames(mkt_data)
  current_rates = mkt_data[match(as.Date(date),as.Date(mkt_data[,1])),]
  
  r_ccy = current_rates[1,match(paste(ccy1,ccy2,sep=""),colnames(current_rates))]
  
  
  return(r_ccy)
}