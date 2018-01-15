####experiment for diabetes dataset######################################################
diabetes<-read.table(file="pima-indians-diabetes.data",sep=",",header=TRUE)
dim(diabetes)
diabetes=data.frame(diabetes)

names(diabetes)<-c("pregnant","Plasma glucose","blood pressure","Triceps",
                   "insulin","mass","pedigree","Age","Class")
diabetes$Class<-factor(diabetes$Class)
class(diabetes$Class)
diabetes_train=TRandTE(diabetes)$train
diabetes_test=TRandTE(diabetes)$test
model <- svm (Class~., data=diabetes_train,gamma=1e-04,cost=100)
svmpred = predict(model,diabetes_test)
mean(svmpred==diabetes_test$Class)
table(svmpred,truth=diabetes_test$Class)
# tune parameters
tuned <- tune.svm (Class~., data=diabetes_train,gamma = 10^(-6:-1), cost = 10^(1:2))
summary(tuned)
######################################################################################
#####experiment for wine dateset######################################################
wine<-read.table(file="wine.data",sep=",",header=TRUE)
dim(wine)
wine=data.frame(wine)

names(wine)<-c("Class","Malic acid","Ash","Alcalinity of ash","Magnesium","Total phenols",
              "Flavanoids","Nonflavanoid phenols","Proanthocyanins","Color intensity","Hue",
              "OD280/OD315","Proline")
wine$Class<-factor(wine$Class)

class(wine$Class)
wine_train=TRandTE(wine)$train
wine_test=TRandTE(wine)$test
wine_model <- svm (Class~., data=wine_train)
wine_pred = predict(wine_model,wine_test)
mean(wine_pred==wine_test$Class)
table(wine_pred,truth=wine_test$Class)
# tune parameters
tuned <- tune.svm (Class~., data=wine_train,gamma = 10^(-6:-1), cost = 10^(1:2))
summary(tuned)
#####################################################################################
#####experiment for glass dateset#####################################################
glass<-read.table(file="glass.data",sep=",",header=TRUE)
dim(glass)
glass=data.frame(glass)

names(glass)<-c("Id","RI","Na","Mg","Al","Si",
               "K","Ca","Ba","Fe","Class")
glass$Class<-factor(glass$Class)

class(glass$Class)
glass_train=TRandTE(glass)$train
glass_test=TRandTE(glass)$test
glass_model <- svm (Class~., data=glass_train,gamma=1e-01,cost=100)
glass_pred = predict(glass_model,glass_test)
mean(glass_pred==glass_test$Class)
table(glass_pred,truth=glass_test$Class)
# tune parameters
tuned <- tune.svm (Class~., data=glass_train,gamma = 10^(-6:-1), cost = 10^(1:2))
summary(tuned)
#####################################################################################
#####experiment for Hepatitis dateset################################################
Hepatitis<-read.table(file="Hepatitis.data",sep=",",header=TRUE)
dim(Hepatitis)
Hepatitis=data.frame(Hepatitis)

names(Hepatitis)<-c("Class","AGE","SEX","STEROID","ANTIVIRALS","FATIGUE","MALAISE",
                    "ANOREXIA","LIVER BIG","LIVER FIRM","SPLEEN PALPABLE","SPIDERS",
                    "ASCITES","VARICES","BILIRUBIN","ALK PHOSPHATE","SGOT","ALBUMIN",
                    "PROTIME","HISTOLOGY")
Hepatitis$Class<-factor(Hepatitis$Class)

class(Hepatitis$Class)
Hepatitis_train=TRandTE(Hepatitis)$train
Hepatitis_test=TRandTE(Hepatitis)$test
Hepatitis_model <- svm (Class~., data=Hepatitis_train,gamma=1e-01,cost=100)
Hepatitis_pred = predict(Hepatitis_model,Hepatitis_test)
mean(Hepatitis_pred==Hepatitis_test$Class)
table(Hepatitis_pred,truth=Hepatitis_test$Class)
# tune parameters
tuned <- tune.svm (Class~., data=Hepatitis_train,gamma = 10^(-6:-1), cost = 10^(1:2))
summary(tuned)
#####################################################################################
