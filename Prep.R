## Read data and remove General.diet
setwd('~/Documents/stat426/exam2')
mydata <- read.table('Toradol',header = TRUE)
mydata <- subset(mydata, select = -c(General.diet,IntrOp.Comp))
## Change the variable type to factor
str(mydata)
mydata[,c(2,5,7,8,9,10,11,12,13,14)] <- lapply(mydata[,c(2,5,7,8,9,10,11,12,13,14)],as.factor)
## Check outlier for numeric predictors
str(mydata)
attach(mydata)
summary(Morphine)
summary(Age)

par(mfrow=c(1,1),bg = 'cornsilk',cex=0.75,mar=c(5,4,2,2))
png(file='myplot1.png')
hist(Morphine,breaks=20,col='lightblue',main='Morphnie Freq',xaxt='n',yaxt='n')
axis(side=1,seq(0,320,20),labels=TRUE)
axis(side=2,seq(0,30,5),labels=TRUE)
dev.off()
png(file='myplot2.png')
hist(Age,breaks=10,col='lightblue',main='Age Freq',xaxt='n',yaxt='n')
axis(side=1,seq(20,95,5),labels=TRUE)
axis(side=2,seq(0,20,5),labels=TRUE)
dev.off()
png(file='myplot3.png')
hist(as.numeric(Stage),breaks=11,col='lightblue',main='Stage Freq',xaxt='n',yaxt='n')
axis(side=1,seq(1,11,1),labels=TRUE)
axis(side=2,seq(1,120,10),labels=TRUE)
dev.off()
## remove data points with Morphnie>250
mydata <- subset(mydata,Morphine < 250)
## Save data set
save(mydata,file='mydata.Rdata')

load('mydata.Rdata')
mydata_L <- subset(mydata,OV != 2)
save(mydata_L,file='mydata_L.Rdata')

load('mydata.Rdata')
mydata_B <- subset(mydata,OV != 2)
save(mydata_B,file='mydata_B.Rdata')

