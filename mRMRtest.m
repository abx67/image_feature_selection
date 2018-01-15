% ��ɾmodel=svmtrain(train_data_labels,train_data);
% ��ɾ[predictlabel,accuracy]=svmpredict(test_data_labels,test_data,model);

%%%%%%%%%��ȡ����%%%%%%%%%%%%
% %%%load('C:\Users\Administrator\Desktop\��ҵ���\digit.mat');
% load digit;
% digit=[digit0;digit1;digit2;digit3;digit4;digit5;
%     digit6;digit7;digit8;digit9];
% d=[5923,6742,5958,6131,5842,5421,5918,6265,5851,5949];
% digit(:,find(sum(abs(digit),1)==0))=[];
% label=[ones(d(1),1)*0;ones(d(2),1)*1;ones(d(3),1)*2;ones(d(4),1)*3;
%     ones(d(5),1)*4;ones(d(6),1)*5;ones(d(7),1)*6;ones(d(8),1)*7;
%     ones(d(9),1)*8;ones(d(10),1)*9];
% 
% rand('state',0)  %�����������
% % r2=randnorepeat(100,717);          %ɾȥȫ0����
% % digit=digit(:,r2);
for i=1:4
    if i==1
        digittemp=[digit3;digit4];            %ѡȡ���
        labeltemp=[ones(d(4),1)*3;ones(d(5),1)*4];
        % %%%%%%%%%ѡ�����Լ���ѵ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %rand('state',0)  %�����������
        r_all=d(4)+d(5); %��������
    else if i==2
        digittemp=[digit5;digit6];            %ѡȡ���
        labeltemp=[ones(d(6),1)*5;ones(d(7),1)*6];
        % %%%%%%%%%ѡ�����Լ���ѵ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %rand('state',0)  %�����������
        r_all=d(6)+d(7); %��������
    else if i==3
        digittemp=[digit7;digit8];            %ѡȡ���
        labeltemp=[ones(d(8),1)*7;ones(d(9),1)*8];
        % %%%%%%%%%ѡ�����Լ���ѵ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %rand('state',0)  %�����������
        r_all=d(8)+d(9); %��������
     else if i==4
        digittemp=[digit9;digit0];            %ѡȡ���
        labeltemp=[ones(d(10),1)*9;ones(d(1),1)*0];
        % %%%%%%%%%ѡ�����Լ���ѵ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %rand('state',0)  %�����������
        r_all=d(10)+d(1); %��������
     else if i==5
        digittemp=[digit3;digit4;digit6];            %ѡȡ���
        labeltemp=[ones(d(4),1)*3;ones(d(5),1)*4;ones(d(7),1)*6];
        % %%%%%%%%%ѡ�����Լ���ѵ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %rand('state',0)  %�����������
        r_all=d(4)+d(5)+d(7); %��������
     else if i==6
        digittemp=[digit0;digit7;digit9];            %ѡȡ���
        labeltemp=[ones(d(1),1)*0;ones(d(8),1)*7;ones(d(10),1)*9];
        % %%%%%%%%%ѡ�����Լ���ѵ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %rand('state',0)  %�����������
        r_all=d(1)+d(8)+d(10); %��������
         end
         end
         end
        end
        end
    end

r1=randnorepeat(round(r_all/4),r_all);    %���ѡȡ1/4������Ϊ���Լ�
test=digittemp(r1,:);      %testΪ���Լ�
train=digittemp; train(r1,:)=[];         %trainΪѵ����
testlabel=labeltemp(r1,:); %���Լ��ı�ǩ
trainlabel=labeltemp; trainlabel(r1,:)=[];%ѵ�����ı�ǩ
%%%%%%%�������ݾ�����mRMR.mat�ļ���%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load mRMR;
M=100;                 %M������ȫ��������
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

eval(['save data',num2str(i)])
end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %����һ����[1,n]��Χ�ڵ�m�����ظ�������
% function d=randnorepeat(m,n)
% p=randperm(n);
% d=p(1:m);
% end

