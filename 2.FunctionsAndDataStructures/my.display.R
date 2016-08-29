my.display<-function(x, display, type, frequency = TRUE){
  if(display){
    if(type == "hist"){
      hist(x, freq = frequency)
    }
    else if(type == "density"){
      plot(density(x))
      
    }
    else if(display == TRUE & !type == "hist" & !type == "density"){
      return("Please specify type as either hist or density!")
    }
      
  }
  cat("Summary of input: \n")
  return(summary(x))
}