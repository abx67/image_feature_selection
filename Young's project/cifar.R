path <- ("C:/Users/Administrator/Desktop/毕业设计/cifar-10-batches-mat")
path0<- ("C:/Users/Administrator/Desktop/毕业设计")
pathname <- file.path(path, "data_batch_1.mat")
data_batch1 <- readMat(pathname)
pathname1 <- file.path(path, "test_batch.mat")
test_batch <- readMat(pathname1)
pathname0 <- file.path(path0, "batch1.mat")
batch1 <- readMat(pathname0)
############################################

train_alldata<-data_batch1$data
train_alllabel<-data_batch1$labels
test_alldata<-data_batch1$data
test_alllabel<-test_batch$labels
loc_train<-c(which(train_alllabel==2),which(train_alllabel==1))
train=train_alldata[loc_train,]
trainlabel=as.character(train_alllabel[loc_train,])
loc_test<-c(which(test_alllabel==2),which(test_alllabel==1))
test=test_alldata[loc_test,]
testlabel=as.character(test_alllabel[loc_test,])

fea_set=batch1$midfea
##########################################################

K=150
accuracymid<-vector(mode="numeric",length=0)
for (i in 1:K){
  model <- ksvm(train[,fea_set[i,]],trainlabel)
  svmpred = predict(model,test[,fea_set[i,]])
  accuracymid[i]=mean(svmpred==testlabel)
}
plot(c(1:150),accuracymid)

write.csv(accuracymid,file="cifar_batch1.csv")

datacifar=read.csv("D:/Young's project/cifar_batch1.csv",header=TRUE)
datamnist=read.csv("D:/Young's project/mnist.csv",header=TRUE)


plot(c(1:100),datamnist$V1,'l')
plot(c(1:150),datacifar$x)

# model <- ksvm(train[,fea_set[50,]],trainlabel)
# svmpred = predict(model,train[,fea_set[50,]])
# table(predict=svmpred,truth=trainlabel)
# mean(svmpred==trainlabel)

as.character(trainlabel)
as.character(testlabel)

model <- ksvm(train,trainlabel)
svmpred = predict(model,test)
mean(svmpred==testlabel)
