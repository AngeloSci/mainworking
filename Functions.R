
standardize_fx <- function(rep_ccy,mkt_data){
  
  
  
}


fx_rate <- function(ccy1,rep_ccy,date,mkt_data){
  date = today
  #ccy1 = "EUR"
  rep_ccy = "GBP"
  ccy1 = pos_data[,3]
  
  avlbl_rates = colnames(mkt_data)
  current_rates = mkt_data[match(as.Date(date),as.Date(mkt_data[,1])),]
  
  r_ccy <-0
  ccy1 <- data.frame(ccy1)
  ccyno <- dim(ccy1)[1]
  
  
  
  r_ccy <- data.frame()
  for (zz in 1:ccyno){
    tmp_col <- match(paste(ccy1[zz,1],rep_ccy,sep=""),colnames(current_rates))
    
    if(is.na(tmp_col)){
      tmp_col = 2}
    
    r_ccy[zz,1] <- current_rates[1,tmp_col]
    }
  
  
  return(r_ccy)
}