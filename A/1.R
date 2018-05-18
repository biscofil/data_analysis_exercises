set.seed(1)
n<-30
y<-1+rpois(n,3)

y

table(y)

mean(y)

#media armonica
#http://www.youmath.it/domande-a-risposte/view/6332-media-armonica.html
n / sum(1/y)

#media geometrica
#http://www.youmath.it/domande-a-risposte/view/2879-media-geometrica.html
prod(y)^(1/n)
