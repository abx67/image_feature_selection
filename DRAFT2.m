I1=eye(10);R1=rand(10);T1=[I1,R1];
I2=eye(10);R2=rand(10);T2=[I2,R2];
I3=eye(10);R3=rand(10);T3=[I3,R3];
I4=eye(10);R4=rand(10);T4=[I4,R4];
I5=eye(10);R5=rand(10);T5=[I5,R5];
L=1:10;trainlabel=[L';L';L';L'];testlabel=L';
train=[T1;T2;T3;T4];test=T5;
M=20;                 %M是特征全集的容量
for m=1:M           %i表示本次循环特征子集的容量
    midfea(m,1:m)=mrmr_mid_d(train,trainlabel,m);
    miqfea(m,1:m)=mrmr_miq_d(train,trainlabel,m);
end
for m=1:M
    model_mid=svmtrain(trainlabel,train(:,midfea(m,1:m)));
    [predictlabel_mid,accuracy_mid]=svmpredict(testlabel,test(:,midfea(m,1:m)),model_mid);
    accuracymid(m)=accuracy_mid(1);
    model_miq=svmtrain(trainlabel,train(:,miqfea(m,1:m)));
    [predictlabel_miq,accuracy_miq]=svmpredict(testlabel,test(:,miqfea(m,1:m)),model_miq);
    accuracymiq(m)=accuracy_miq(1);
end
plot(1:M,accuracymid,'*')
figure
plot(1:M,accuracymiq,'*')