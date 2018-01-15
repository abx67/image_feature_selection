path <- ("D:/Yang Fan")
pathname <- file.path(path, "training_10.mat")
training_10 <- readMat(pathname)
pathname0 <- file.path(path, "testing_01.mat")
testing_01 <- readMat(pathname0)
pathname1 <- file.path(path, "NORB_10.mat")
NORB_10 <- readMat(pathname1)

############################################

train_alldata<-training_10$data
train_alllabel<-training_10$label
test_alldata<-testing_01$data
test_alllabel<-testing_01$label
loc_train<-c(which(train_alllabel==2),which(train_alllabel==4))
train=train_alldata[loc_train,]
trainlabel=as.character(train_alllabel[loc_train])
loc_test<-c(which(test_alllabel==2),which(test_alllabel==4))
test=test_alldata[loc_test,]
testlabel=as.character(test_alllabel[loc_test])

fea_set=NORB_10$midfea
##########################################################
train=data.frame(cbind(trainlabel,train))
names(train)[1]<-c("Class")
train$Class<-factor(train$Class)
test=data.frame(cbind(testlabel,test))
names(test)[1]<-c("Class")
test$Class<-factor(test$Class)

temp_train=data.frame(cbind(trainlabel,train[,fea_set[150,]]))
names(temp_train)[1]<-c("Class")
temp_train$Class<-factor(temp_train$Class)
temp_test=data.frame(cbind(testlabel,test[,fea_set[150,]]))
names(temp_test)[1]<-c("Class")
temp_test$Class<-factor(temp_test$Class)

model <- svm (Class~., data=temp_train)
svmpred = predict(model,test)
mean(svmpred==temp_test$Class)
table(svmpred,truth=temp_test$Class)

train=data.frame(train)
names()


# model <- ksvm(train[,fea_set[50,]],trainlabel)
# svmpred = predict(model,train[,fea_set[50,]])
# table(predict=svmpred,truth=trainlabel)
# mean(svmpred==trainlabel)

as.character(trainlabel)
as.character(testlabel)

model <- ksvm(train,trainlabel)
svmpred = predict(model,test)
mean(svmpred==testlabel)
