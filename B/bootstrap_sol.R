set.seed(12)

speed<-scan("speed-of-light.txt")
y<-speed[speed > 0] #elimina valori mancanti

# fissiamo un valore di B
B<-1000

# determiniamo il numero delle osservazioni
n<-length(y)

# calcoliamo la stima (fun)
theta.hat<-mean(y)

# calcoliamo la matrice dei valori ricampionati
boot.values<-matrix(sample(y,B*n,replace=TRUE),B,n)

# calcoliamo le stime bootstrap
theta.hat.boot<-apply(boot.values,1,mean)

# calcoliamo la media delle stime bootstrap
m.boot<-mean(theta.hat.boot)

# calcoliamo la varianza delle stime bootstrap
v.boot<-mean(theta.hat.boot^2)-m.boot^2
v.boot

# Confrontiamo la varianza con la varianza ideale
var.id<-(mean(y^2)-(mean(y))^2)/n
var.id

# correzione bootstrap della distorsione
m.boot-theta.hat

# plot(sort(theta.hat.boot))
library(ggplot2)
bootdata<-data.frame(boot=theta.hat.boot)
g<-ggplot(bootdata,aes(x=boot))
g+stat_ecdf()
g+abline(h=28)

# probabilità che 
p <- mean(theta.hat.boot <= 27)
p
quantile(theta.hat.boot,p)


quantile(theta.hat.boot,.95)


# eroore
bootdata.err<-data.frame(error=theta.hat.boot-theta.hat)
g<-ggplot(bootdata.err,aes(error))
g+stat_density()
