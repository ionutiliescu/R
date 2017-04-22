#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution

m <- length(revenue)
p <- 0L #profit
pAt <- 0L #profit after tax
pM <- 0L # profit margin
gm <- 0L #good months
bm <- 0L #bad months
tgm <- 0L #the best month
tbm <- 0L #the worst month

# calculating the profit, profit after tax and profit margin
for(i in 1:m){
  p[i] <- revenue[i] - expenses[i]
  pAt[i] <- (revenue[i] - expenses[i]) * 0.7
  pM[i] <- pAt[i]/revenue[i] * 100
}

pM = paste(round(pM), '%')
p = round(p,0)
pAt = round(pAt,0)

#mean profit after tax for the year
meanY <- mean(pAt)


# classifying good and bad months
for(i in 1:m){
  if(pAt[i] > meanY){
    gm <- gm + 1
  } else {
    bm <- bm + 1
  }
}

tgm <- max(pAt)
tbm <- min(pAt)

# building a matrix with all the data
#leaving the dollar figures in full for better clarity
M <- rbind(
  revenue,
  expenses,
  p,
  pAt,
  pM,
  gm,
  bm,
  tgm,
  tbm
)
M

