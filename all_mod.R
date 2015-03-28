source('corr_test.R')
source('sep_mod.R')
corr.test(LongStay)
corr.test(BadPain)
corr.test(TOR)
sep_mod(LongStay)
sep_mod(BadPain)


load('mydata.Rdata')
mydata <- na.omit(mydata)
all_mod_L <- glm(LongStay ~ TOR+BadPain+duration+LNS+Comps+HYS+Stage+AddPro+
                   Diagnosis+OV+LNS+Age+Morphine, data = mydata, family = binomial)
summary(all_mod_L)
fin_all_mod_L <- step(all_mod_L)
summary(fin_all_mod_L)
confint(fin_all_mod_L)
png(file='myplot4.png')
par(mfrow= c(2,2),cex=0.75,mar=c(6,4,4,4),bg='cornsilk')
plot(fin_all_mod_L)
dev.off()

png(file='myplot5.png')
par(mfrow= c(2,2),cex=0.75,mar=c(6,4,4,4),bg='cornsilk')
mydata <- subset(mydata,!Pt.No %in% c(80,70,8))
all_mod_L <- glm(LongStay ~ TOR+BadPain+duration+LNS+Comps+HYS+Stage+AddPro+
                   Diagnosis+OV+LNS+Age+Morphine, data = mydata, family = binomial)
summary(all_mod_L)
fin_all_mod_L <- step(all_mod_L)
summary(fin_all_mod_L)
plot(fin_all_mod_L)
dev.off()



#load('mydata_L.Rdata')
#all_mod_L <- glm(LongStay ~ TOR+BadPain+duration+LNS+Comps+HYS+Stage+AddPro+
#                   Diagnosis+OV+LNS+Age+Morphine, data = mydata_L, family = binomial)
#summary(all_mod_L)
#fin_all_mod_L <- step(all_mod_L)
#summary(fin_all_mod_L)
#par(mfrow= c(2,2),cex=0.75,mar=c(5,4,4,4))
#plot(fin_all_mod_L)
#mydata_L <- subset(mydata_L,!Pt.No %in% c(80,70))
#all_mod_L <- glm(LongStay ~ TOR+BadPain+duration+LNS+Comps+HYS+Stage+AddPro+
#                   Diagnosis+OV+LNS+Age+Morphine, data = mydata_L, family = binomial)
#summary(all_mod_L)
#fin_all_mod_L <- step(all_mod_L)
#summary(fin_all_mod_L)
#plot(fin_all_mod_L)

load('mydata.Rdata')
mydata <- na.omit(mydata)
all_mod_B <- glm(BadPain ~ TOR+LongStay+duration+LNS+Comps+HYS+Stage+AddPro+
                   Diagnosis+OV+LNS, data = mydata, family = binomial)
summary(all_mod_B)
fin_all_mod_B <- step(all_mod_B)
summary(fin_all_mod_B)
plot(fin_all_mod_B)
mydata <- subset(mydata,!Pt.No %in% c(124,38))
all_mod_B <- glm(BadPain ~ TOR+LongStay+duration+LNS+Comps+HYS+Stage+AddPro+
                   Diagnosis+OV+LNS, data = mydata, family = binomial)
summary(all_mod_B)
fin_all_mod_B <- step(all_mod_B)
summary(fin_all_mod_B)
plot(fin_all_mod_B)


