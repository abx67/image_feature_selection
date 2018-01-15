library('YangFan')
library('R.matlab')
library ("e1071")
library ("kernlab")
path <- ("D:/Yang Fan")
pathname <- file.path(path, "deletebg.mat")
data <- readMat(pathname)
bg<-data.frame(as.factor(data$bglabel),data$bgdata)
NORB10_fea<-data$NORB10.fea
dim(bg)
names(bg)[1]<-"Class"
train<-TRandTE(bg)$train[,c(1,NORB10_fea)]
test<-TRandTE(bg)$test[,c(1,NORB10_fea)]
# train<-TRandTE(bg)$train
# test<-TRandTE(bg)$test
dim(train)

model <- svm (Class~., data=train)
svmpred = predict(model,test)
mean(svmpred==test$Class)
table(svmpred,truth=test$Class)
################################################
path <- ("D:/Yang Fan")
pathname <- file.path(path, "deletenow.mat")
data <- readMat(pathname)
bg<-data.frame(as.factor(data$badlabel),data$baddata)
dim(bg)
NORB10_fea<-data$NORB10.fea
names(bg)[1]<-"Class"
train<-TRandTE(bg)$train[,c(1,NORB10_fea)]
test<-TRandTE(bg)$test[,c(1,NORB10_fea)]
names(train)
badmodel <- ksvm (Class~., data=train)
svmpred = predict(badmodel,test)
mean(svmpred==test$Class)
table(svmpred,truth=test$Class)

