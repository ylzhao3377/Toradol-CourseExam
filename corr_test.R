corr.test <- function(x){
  setwd('~/Documents/stat426/exam2')
  library(aod)
  library(Deducer)
  load('mydata.Rdata')
  attach(mydata)
  factor.md <- mydata[,c(2,5,7,8,9,10,11,12,13,14)]
  a <- list()
  mymatrix <- matrix(0,nrow=10,ncol=2,byrow=TRUE,dimnames = list(colnames(factor.md), c('Chisq','Likelihood')))
  for(i in 1:10){
    print(colnames(factor.md[i]))
    a[[i]] <- xtabs(~x+factor.md[,i])
    print(a[[i]])
    chi <- chisq.test(a[[i]],simulate.p.value = TRUE)
    likli <- likelihood.test(a[[i]])
    mymatrix[i,1] <- chi$p.value
    mymatrix[i,2] <- likli$p.value
  }
  mymatrix
}

