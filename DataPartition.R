mtcars
install.packages('caret') #helps in partiotioning
library(caret)
#index = createDataPartition(y=mtcars$am, p=.7, list = F) #used in classification techniques 
nrow(mtcars)
index = sample(x=1:nrow(mtcars), size=.7 * nrow(mtcars)) # fetch 70% of the rows in mtcars numbers randomly 
index
train = mtcars[index,] #Training set with 70% data 
test = mtcars[-index,] #test set
nrow(train)
nrow(test)
nrow(train) + nrow(test) #total rows=32

install.packages('olsrr') 
library(olsrr)
fit = lm(mpg ~ disp + hp + wt + qsec, data = train) #performing only on training set and using 4 variables
k = ols_step_all_possible(fit) #for every combo of variables it finds k
plot(k) #adding more variable may to improve the efficiency; combo of varaible also matters
k
summary(lm(mpg ~ wt, data = train))
summary(lm(mpg ~ wt + hp, data = train))

install.packages('gvlma') #helps checking the assumptions if they are acceptable or not
library(gvlma)
gvmodel = gvlma(fit)
gvmodel
summary(fit)

finalmodel = lm(mpg ~ wt + hp, data = train)
(predictedvalues = predict(finalmodel, ndata = test))
