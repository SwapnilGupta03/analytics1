#Basic stats

x = ceiling(rnorm(10000, mean = 60, sd = 20)) #n=10000
mean(x)
median(x)
#there no mode function for mode stats
table(x)
sort(table(x), decreasing = T)

install.packages('modeest') #calculate mode
library(modeest) 
mlv(x,method='shorth')

quantile(x)
quantile(x, seq(.1,1,by=.1)) #decile (divide into 10 parts)
quantile(x,seq(.01,1,by=.01)) #percentile

install.packages('e1071')
library(e1071)

plot(density(x))
e1071::skewness(x)
kurtosis(x)

sd(x)
var(x)
cov(women$weight, women$height)
cov(women$height, women$height)

stem(x)

#frequency table
install.packages('fdth')
library(fdth)
