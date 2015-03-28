sep_mod <- function(Response){
  load('mydata.Rdata')
  attach(mydata)
  subdata <- subset(mydata,select = -c(Pt.No))
  sep_logit <- function(y,x){
    logit <- glm(y ~ x,data = subdata,family = binomial)
    summary(logit)
  }
  sep_conf <- function(y,x){
    logit <- glm(y ~ x,data = subdata,family = binomial)
    confint(logit)    
  }  
  for(i in 1:14){
    print(colnames(subdata)[i])
    print(sep_logit(Response,subdata[,i]))
    print(sep_conf(Response,subdata[,i]))
  }
}


