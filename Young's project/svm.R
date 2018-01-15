library("R.matlab")
library ("e1071")
library ("kernlab")
#####read data########################################
path <- ("C:/Users/Administrator/Desktop/毕业设计")
pathname0 <- file.path(path, "digit.mat")
digit <- readMat(pathname0)
pathname1 <- file.path(path, "data_1.mat")
data1 <- readMat(pathname1)
pathname2 <- file.path(path, "data_2.mat")
data2 <- readMat(pathname2)
pathname3 <- file.path(path, "data_3.mat")
data3 <- readMat(pathname3)
pathname4 <- file.path(path, "data_4.mat")
data4 <- readMat(pathname4)
#####################################################
set.seed(0)
d=data1$d
# label=c( rep(0,d[1]),rep(1,d[2]),rep(2,d[3]),rep(3,d[4]),rep(4,d[5]),
#          rep(5,d[6]),rep(6,d[7]),rep(7,d[8]),rep(8,d[9]),rep(9,d[10]) )
# rm(label)

temp_alldata = rbind(digit$digit3,digit$digit4)
temp_alllabel = c( rep('3',d[4]),rep('4',d[5]) )
temp_alldim=sum(d[4:5])
testpos=sample(c(1:temp_alldim),size=round(temp_alldim/4))
test=temp_alldata[testpos,]
testlabel=temp_alllabel[testpos]
train=temp_alldata[-testpos,]
trainlabel=temp_alllabel[-testpos]
fea_set=data1$midfea
data1$midfea

#######################################################


#install.packages("e1071")
#install.packages("kernlab")

#model <- ksvm(train[,1:100],trainlabel ,type="C-svc",kernel='rbf',C=1)
K=100
accuracymid<-vector(mode="numeric",length=0)
for (i in 1:K){
  model <- ksvm(train[,fea_set[i,]],trainlabel)
  svmpred = predict(model,test[,fea_set[i,]])
  accuracymid[i]=mean(svmpred==testlabel)
}
#svmfit =svm (label~., data=temp_data , kernel ="linear", cost =10)
sum(svmpred==testlabel)/length(testlabel)

temp<-vector(mode="numeric",length=0)
for (i in 1:5){
  temp[i]=i
}

