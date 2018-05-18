library(Lock5Data)

### (a) Carica in R il dataframe SleepStudy

data("SleepStudy")
help(SleepStudy)

### (b) Crea una tabella delle variabili Stress e AlcoholUse

n <- nrow(SleepStudy)

## i. Qual è la proporzione di studenti in ciascuna categoria di uso di alcol?

## frequenze relative
table(SleepStudy$AlcoholUse)
## frequenze assolute
round(table(SleepStudy$AlcoholUse) / n, 2)

## ii. Qual è la proporzione di studenti nel gruppo ad alto stress 
## che presentano un consumo
## elevato di alcol?
round(sum ((SleepStudy$Stress == "high") &
             (SleepStudy$AlcoholUse == "Heavy")
) / n , 2)

## iii. Visualizza i dati di questa tabella in un grafico a barre che
## confronta in modo efficace la distribuzione dell’uso di alcol
## per ciascun gruppo di stress.

## iv. Scrivi il codice R che hai usato per creare questo grafico.

tab <- table(SleepStudy$Stress, SleepStudy$AlcoholUse)
colours <- c("red", "green")

barplot(tab, 
        ylim = c(0,100),
        ylab = "Numero di studenti",
        xlab = "Alcohol Use",
        beside=TRUE, col=colours,
        density=c(25,25,100,100,50,50,75,75))

legend("top",
       legend = c("High Stress","Normal Stress"),
       text.col = colours,
       fill=colours)

## v. Commenta i risultati che ricavi dall’analisi.

# Si nota che la maggioranza degli studenti si concentra nell'utilizzo basso e
# moderato dell'alcohol. 

### (c) Considera le variabili Drinks e LarkOwl

## i. Trova la media, la mediana e lo scarto quadratico medio del numero 
## di bevande alcoliche a settimana per l’intero gruppo di studenti.

mean(SleepStudy$Drinks)
quantile(SleepStudy$Drinks,probs =.5)

c <- quantile(SleepStudy$Drinks,probs =c(.25,.75))
c[2] - c[1]

## ii. Ripeti l’analisi ma separatamente per ogni gruppo di studenti 
## che si classificano come mattinieri (larks), nottambuli o nessuno dei due

k <- tapply(SleepStudy$Drinks,SleepStudy$LarkOwl,summary)
k

## iii. Crea un’efficace visualizzazione della variabile Bevande che mostra 
## come la distribuzione del numero di drinks a settimana varia tra 
## mattinieri, nottambuli e nessuno dei due.

boxplot(k)

## iv. Commenta i risultati che ricavi dall’analisi.

