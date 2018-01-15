%%%%%%%%%��ȡ����%%%%%%%%%%%%
load('C:\Users\Administrator\Desktop\��ҵ���\digit.mat');
digit=[digit0;digit1;digit2;digit3;digit4;digit5;
    digit6;digit7;digit8;digit9];
digit(:,find(sum(abs(digit),1)==0))=[]; %ɾȥȫ��0����
label=[ones(5923,1)*0;ones(6742,1)*1;ones(5958,1)*2;ones(6131,1)*3;
    ones(5842,1)*4;ones(5421,1)*5;ones(5918,1)*6;ones(6265,1)*7;
    ones(5851,1)*8;ones(5949,1)*9];
rand('state',0)  %�����������
r2=randnorepeat(100,717);
digit=digit(:,r2);
r0=randnorepeat(200,12665);
digit_data=digit(r0,:);
label_data=label(r0,:);
%%%%%%%%%ѡ�����Լ���ѵ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%rand('state',0)  %�����������
r1=randnorepeat(50,200);    %���ѡȡ15000��������Ϊ���Լ�
test=digit_data(r1,:);      %testΪ���Լ�
train=digit_data; train(r1,:)=[];         %trainΪѵ����
testlabel=label_data(r1,:); %���Լ��ı�ǩ
trainlabel=label_data; trainlabel(r1,:)=[];%ѵ�����ı�ǩ
%%%%%%%�������ݾ�����mRMR.mat�ļ���%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load mRMR;
M=50;                 %M������ȫ��������
for m=1:M           %i��ʾ����ѭ�������Ӽ�������
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
%����һ����[1,n]��Χ�ڵ�m�����ظ�������
function d=randnorepeat(m,n)
p=randperm(n);
d=p(1:m);
end

