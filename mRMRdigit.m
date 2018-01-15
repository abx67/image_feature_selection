% %%%%%%%1-17�о�Ϊ����Ԥ����%%%%%%%%%%%%%%%%%%
% %%%%%%%%%��ȡ����%%%%%%%%%%%%
%%%load('C:\Users\Administrator\Desktop\��ҵ���\digit.mat');
load digit;
digit=[digit0;digit1;digit2;digit3;digit4;digit5;
    digit6;digit7;digit8;digit9];
d=[5923,6742,5958,6131,5842,5421,5918,6265,5851,5949];
digit(:,find(sum(abs(digit),1)==0))=[];
label=[ones(d(1),1)*0;ones(d(2),1)*1;ones(d(3),1)*2;ones(d(4),1)*3;
    ones(d(5),1)*4;ones(d(6),1)*5;ones(d(7),1)*6;ones(d(8),1)*7;
    ones(d(9),1)*8;ones(d(10),1)*9];

digittemp=[digit3;digit4];            %ѡȡ���
labeltemp=[ones(d(4),1)*3;ones(d(5),1)*4];

% %%%%%%%%%ѡ�����Լ���ѵ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rand('state',0)  %�����������
r=randnorepeat(15000,60000);    %���ѡȡ15000��������Ϊ���Լ�
test=digittemp(r,:);      %testΪ���Լ�
train=digittemp; train(r,:)=[];         %trainΪѵ����
testlabel=labeltemp(r,:); %���Լ��ı�ǩ
trainlabel=labeltemp; trainlabel(r,:)=[];%ѵ�����ı�ǩ
%%%%%%%%�������ݾ�����mRMR.mat�ļ���%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load mRMR;
M=100;                 %M������ȫ��������
for m=1:M           %i��ʾ����ѭ�������Ӽ�������
    midfea(m,1:m)=mrmr_mid_d(train,trainlabel,m);
    miqfea(m,1:m)=mrmr_miq_d(train,trainlabel,m);
end
for m=1:M
    m
    model_mid=svmtrain(trainlabel,train(:,midfea(m,1:m)));
    [predictlabel_mid,accuracy_mid]=svmpredict(testlabel,test(:,midfea(m,1:m)),model_mid);
    accuracymid(m)=accuracy_mid(1);
    model_miq=svmtrain(trainlabel,train(:,miqfea(m,1:m)));
    [predictlabel_miq,accuracy_miq]=svmpredict(testlabel,test(:,miqfea(m,1:m)),model_miq);
    accuracymiq(m)=accuracy_miq(1);
end
plot(1:M,accuracymid)
figure
plot(1:M,accuracymiq)

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %����һ����[1,n]��Χ�ڵ�m�����ظ�������
% function d=randnorepeat(m,n)
% p=randperm(n);
% d=p(1:m);
% end

