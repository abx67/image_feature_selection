%%%%%%%%%读取数据%%%%%%%%%%%%
load('C:\Users\Administrator\Desktop\毕业设计\digit.mat');
digit=[digit0;digit1;digit2;digit3;digit4;digit5;
    digit6;digit7;digit8;digit9];
digit(:,find(sum(abs(digit),1)==0))=[]; %删去全是0的列
label=[ones(5923,1)*0;ones(6742,1)*1;ones(5958,1)*2;ones(6131,1)*3;
    ones(5842,1)*4;ones(5421,1)*5;ones(5918,1)*6;ones(6265,1)*7;
    ones(5851,1)*8;ones(5949,1)*9];
rand('state',0)  %设置随机种子
r2=randnorepeat(100,717);
digit=digit(:,r2);
r0=randnorepeat(200,12665);
digit_data=digit(r0,:);
label_data=label(r0,:);
%%%%%%%%%选定测试集和训练集%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%rand('state',0)  %设置随机种子
r1=randnorepeat(50,200);    %随机选取15000个样本作为测试集
test=digit_data(r1,:);      %test为测试集
train=digit_data; train(r1,:)=[];         %train为训练集
testlabel=label_data(r1,:); %测试集的标签
trainlabel=label_data; trainlabel(r1,:)=[];%训练集的标签
%%%%%%%以上数据均存在mRMR.mat文件中%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load mRMR;
M=50;                 %M是特征全集的容量
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
plot(1:M,accuracymid,'.')
axis([0 M+1  0 100]);
figure
plot(1:M,accuracymiq,'.')
axis([0 M+1  0 100]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%生成一列在[1,n]范围内的m个不重复的整数
function d=randnorepeat(m,n)
p=randperm(n);
d=p(1:m);
end

