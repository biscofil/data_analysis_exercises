de_bilt <- read.table(file = "KNMI_20160831.txt", header = FALSE, skip = 12, sep = ',')

names(de_bilt)<-c("station", "yyyymmdd", "rainfall")

head(de_bilt)
month<-substr(de_bilt$yyyymmdd, 5, 6)
sel<-month=="04"
y<-de_bilt$rainfall[sel]
summary(y)
y[y < 0]<-0

summary(y)
boxplot(y)
hist(y, freq = FALSE)
x<-y[y>0]

library(fitdistrplus)
fitmle<-fitdist(as.numeric(na.omit(x)), distr = "exp")
plot(fitmle)
fitmlg<-fitdist(as.numeric(na.omit(x)), distr = "gamma")
plot(fitmlg)