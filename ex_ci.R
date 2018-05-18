y<-scan("ex-ci.txt")
y

mean(y) #stima
#4.21...


mean(y) + c(-1,1)*0.8



n<-length(y)
n

alpha<-0.01 #1%

limite_inferiore <- (n-1)*var(y)/qchisq(1-alpha/2,n-1)
limite_superiore <- (n-1)*var(y)/qchisq(alpha/2,n-1)
c(limite_inferiore,limite_superiore)

curve(dchisq(x,df=n-1),from=0,to=2*(n-1))
abline(v = limite_inferiore)
abline(v = limite_superiore)
c(1-alpha/2,alpha/2)
