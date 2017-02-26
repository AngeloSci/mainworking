
standardize_fx <- function(rep_ccy,mkt_data){
  
  
  
}


fx_rate <- function(ccy1,rep_ccy,date,mkt_data){
  #date = today
  #ccy1 = "EUR"
  #rep_ccy = "GBP"
  #ccy1 = pos_data[,3]
  
  
  current_rates = mkt_data[match(as.Date(date),as.Date(mkt_data[,1])),]
  avlbl_pairs = colnames(current_rates)
  
  r_ccy <-0
  ccy1 <- data.frame(ccy1)
  ccyno <- dim(ccy1)[1]
  
  
  
  r_ccy <- data.frame()
  for (zz in 1:ccyno){
    tmp_col <- match(paste(ccy1[zz,1],rep_ccy,sep=""),avlbl_pairs)
    
    
    if(is.na(tmp_col)){
      
      test1 <- match(paste(rep_ccy,ccy1[zz,1],sep=""),avlbl_pairs)
      
      tmp_a_ccy1 <- substr(avlbl_pairs,1,3)
      tmp_a_ccy2 <- substr(avlbl_pairs,4,6)
      findccy1 <- match(ccy1[zz,1],tmp_a_ccy1)
      findccy2 <- match(ccy1[zz,1],tmp_a_ccy2)
      
      findx1 <- tmp_a_ccy2[findccy1]
      findx2 <- tmp_a_ccy1[findccy2]
      


      
      
      if (!is.na(test1)){
        r_ccy[zz,1] <- 1/current_rates[1,test1]       
      }else if (!is.na(findx1)){
        try1 <- paste(findx1,rep_ccy,sep="")
        try2 <- paste(rep_ccy,sep="",findx1)
        
        test2 <- match(try1,avlbl_pairs)
        test3 <- match(try2,avlbl_pairs)
        
        if(!is.na(test2)) r_ccy[zz,1] <- current_rates[1,findccy1]*current_rates[1,test2] 
        if(!is.na(test3)) r_ccy[zz,1] <- current_rates[1,findccy1]/current_rates[1,test3] 
        
      }else if (!is.na(findx2)){
      
        try3 <- paste(findx2,rep_ccy,sep="")
        try4 <- paste(rep_ccy,sep="",findx2)
        
        test4 <- match(try3,avlbl_pairs)
        test5 <- match(try4,avlbl_pairs)
        
        if(!is.na(test4)) r_ccy[zz,1] <- (1/current_rates[1,findccy2])*(current_rates[1,test4])
        if(!is.na(test5)) r_ccy[zz,1] <- (1/current_rates[1,findccy2])*(1/current_rates[1,test5])
      }
      }else{
        r_ccy[zz,1] <- current_rates[1,tmp_col]
      }
    
    
    }
  
  
  return(r_ccy)
}