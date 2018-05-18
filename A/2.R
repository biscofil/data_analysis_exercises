library("ggplot2")

aux <- function(y,i,n){
  f <- (i / n) - ((i - 1) / n)
  q <- ( sum(y[1:i]) + sum(y[1:(i - 1)]) ) / sum(y)
  return ((f * q) / 2)
}

gini <- function(y) {
  
  y <- y[!is.na(y)]
  n <- length(y)
  s <- 0
  p <- c()
  
  for (i in 1:n) {
    v <- aux(y,i,n)
    p <- append(p,s)
    s <- s + v
  }
  
  dd <- data.frame((1:n)/n,p)
  
  ggplot(data=dd) +
    #geom_point(aes(x=p, y=L)) +
    geom_line(aes(x=p, y=L), color="#990000") +
    scale_x_continuous(name="Cumulative share of X", limits=c(0,1)) + 
    scale_y_continuous(name="Cumulative share of Y", limits=c(0,1)) +
    geom_abline()
  
  return((1 / 2) - s)
}

l <- c(1, 2, 3, 10, 15, 15, NA, 30, 50)
l2 <- gini(l)
l2



