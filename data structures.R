# Data Structures
#vectors----
v1 = 1:100 #create vector from 1 to 100
v2 = c(1,4,7) #specific set of numbers
class(v1)
class(v2)
v3 = c('Swap','rev')
v3 #print values
v4 = c(TRUE, FALSE, T, F)
class(v4)
mean(v1)
median(v1)
sd(v1) # Standard deviation
hist(women$height)
v2[v2>=5]# to find values more than 5
x = rnorm(60, mean = 60, sd = 10)
x
plot(x)
hist(x)
plot #draw line along the curve
abline(v=60)
#rectangles and density lines together
hist(x, freq = F)
lines(density(x))
hist(x, breaks = 10, col = 1:10)
#length of data
length(x)
?sample
x1 = LETTERS[5:20]
x1











set.seed(124) #when you want same pattern to be repeated , execute this line before executing y1, put in line 42 only
y1 = sample(x1) #random letters picked from x1
y1

(gender = sample(c('M','F'), size = 60, replace=TRUE, prob = c(6,4))) # given set is of size 2 so cant pick 60 hence replace is True

(t1=table(gender)) #number of male and female
#to show in percentage form

prop.table(t1)
pie(t1)
barplot(t1.col=1:2, horiz = T)

#matrix----
(m1 = matrix(1:24, nrow = 4)) #create a matrix
(m2 = matrix(1:24, ncol = 4, byrow = T)) #create by row
(x=runif(60,60,100))
x
# round, trunc, ceiling, floor
x = trunc(runif(60,60,100)) #removes decimal
plot(density(x))
(m4 = matrix(x, ncol = 6)) # data shown in columns of 6
colSums(m4)
rowSums(m4)
rowMeans(m4)
colMeans(m4)
# values which are more than a specific number
m4[m4>67]
m4[10,] # 10th row of all the columns
m4[1:3] #print col 1 to 3
m4[8:10, c(3:5)] #print 8 to 10 col of 3 to 5 rows
rowSums(m4[8:10, c(3:5)]) 
m4[ ,c(1,5)] #use c when dont want to print sequence
#array----

# data frame
# roll no, name, gender, course, marks1, marks2
(rollno = 1:60)
(name=paste('student1',1:60, sep = '-'))
name[1:10] #print specific names
name[15:20] 
name[c(15,20,37)] #positions of names
name[-c(1:10)] #use '-' to remove some names
rev(name) #reverse
name[60:1] #print from position 60 to 1
name[-c(1:10,35:40)] #want to remove certain ranges

(gender=sample(c('Male','Female'), size=60, prob = c(.3,.7), replace=T))

(course=sample(c('BBA','MBA','FPM'), size=60, replace=T, prob=c(.4,.3,.3)))
(marks1 = ceiling(rnorm(60, mean=65, sd=7)))
(marks2 = ceiling(rnorm(60, mean=60, sd=11)))
(grades = sample(c('A','B','C'), size=60, replace=T))
(students = data.frame(rollno, name, gender, course, marks1, marks2, grades))
#display particular record
class(students)
summary(students)
students[,c('name')] 
students[students$gender=='Male', c('rollno','gender','marks1')]
students[students$gender=='Male' & students$grades=='C',c('rollno','gender','marks1')]
students[students$marks1>55 | students$marks1<75, c('name','marks1')]
students$gender
t1=table(students$gender) #number of female and male
t1 
barplot(table(students$course), ylim = c(0,50),col = 1:3)
names(students)
head(students) #diplay first 6 records
tail(students) #display last 6 records by default
# avg marks scored by each gender in marks1
#gender, marks1
aggregate(students$marks1, by=list(students$gender), FUN=mean)
# same for marks2 according to course
aggregate(students$marks2, by=list(students$course), FUN=max)
# max marks scored in each course by every gender in marks2
aggregate(students$marks2, by=list(students$course, students$gender), FUN=max)

 #deployer
library(dplyr) #load a library
students %>% group_by(gender) %>% summarise(mean(marks1))
students %>% group_by(course,gender) %>% summarise(mean(marks1), min(marks2), max(marks2))
# to arrange in asc order of marks1
students %>% arrange(marks1)
# top five students in marks1
students %>% arrange(desc(marks1)) %>% top_n(5)
#select on random basis 10 percent of the rows (6 rows)
sample_frac(students,size = 0.1)
#or select and arrange
students %>% sample_frac(.1) %>% arrange(course) %>% select(name, gender)
#select randomly 5 rows
students %>% sample_n(5)
