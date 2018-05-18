### 1. Considerate il lancio di due dati e considerate la somma delle due facce.
### Sia Y la v.c. ‘somma delle due facce’

## (a) Individuate lo spazio campionario.

# Lo spazio campionario della v.c. "somma delle due facce" concide con l'insieme


## (b) Costruite un programma in R che estragga un campione bernoulliano di
## numerosità n dalla v.c. somma delle due facce.


# (c) Calcolate la distribuzione di probabilità di Y.

s <- 2:12
# La funzione di densità della v.c è
p <- c(1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1) / 36

plot(p, xlim = c(2, 12))


# (d) Calcolate la distribuzione di probabilità empirica di Y, con n = 50.
n1 <- 50
y1 <- sample(s,
             size = n1,
             replace = TRUE,
             prob = p)
table(y1)

# (e) Confrontate le due distribuzioni.

# (f) Calcolate la funzione di ripartizione e la funzione di ripartizione
# empirica e sovrapponetele in un’unico grafico.

plot(sort(y1))
plot(cumsum(p), xlim = c(2, 12))

# (g) Commentate quanto accade se n = 500.
n2 <- 500
y2 <- sample(s,
             size = n2,
             replace = TRUE,
             prob = p)
table(y2)

plot(sort(y2))
