# ##set.seed (1)
# x= matrix (rnorm (20*2) , ncol =2)
# y=c(rep ( -1 ,10) , rep (1 ,10) )
# x[y==1 ,]= x[y==1 ,] + 1
# plot(x, col =(3-y))
# dat =data.frame (x=x, y=as.factor (y))
# library ( e1071 )
# svmfit =svm (y~., data=dat , kernel ="linear", cost =10,
#              scale = FALSE )
# plot(svmfit , dat )

library("R.matlab")
?readMat()

path <- ("C:/Users/Administrator/Desktop")
pathname <- file.path(path, "data1.mat")
data <- readMat(pathname)
print(data)


##############################################
data(iris)
attach(iris)

## classification mode
# default with factor response:
model <- svm(Species ~ ., data = iris)

# alternatively the traditional interface:
x <- subset(iris, select = -Species)
y <- Species
model <- svm(x, y) 
print(model)

dim(x)
length(y)
?subset()


