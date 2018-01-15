% 勿删model=svmtrain(train_data_labels,train_data);
% 勿删[predictlabel,accuracy]=svmpredict(test_data_labels,test_data,model);

%%%%%%%%%读取数据%%%%%%%%%%%%
% %%%load('C:\Users\Administrator\Desktop\毕业设计\digit.mat');
% load digit;
% digit=[digit0;digit1;digit2;digit3;digit4;digit5;
%     digit6;digit7;digit8;digit9];
% d=[5923,6742,5958,6131,5842,5421,5918,6265,5851,5949];
% digit(:,find(sum(abs(digit),1)==0))=[];
% label=[ones(d(1),1)*0;ones(d(2),1)*1;ones(d(3),1)*2;ones(d(4),1)*3;
%     ones(d(5),1)*4;ones(d(6),1)*5;ones(d(7),1)*6;ones(d(8),1)*7;
%     ones(d(9),1)*8;ones(d(10),1)*9];
% 
% rand('state',0)  %设置随机种子
% % r2=randnorepeat(100,717);          %删去全0的列
% % digit=digit(:,r2);
for i=1:4
    if i==1
        digittemp=[digit3;digit4];            %选取类别
        labeltemp=[ones(d(4),1)*3;ones(d(5),1)*4];
        % %%%%%%%%%选定测试集和训练集%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %rand('state',0)  %设置随机种子
        r_all=d(4)+d(5); %样本容量
    else if i==2
        digittemp=[digit5;digit6];            %选取类别
        labeltemp=[ones(d(6),1)*5;ones(d(7),1)*6];
        % %%%%%%%%%选定测试集和训练集%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %rand('state',0)  %设置随机种子
        r_all=d(6)+d(7); %样本容量
    else if i==3
        digittemp=[digit7;digit8];            %选取类别
        labeltemp=[ones(d(8),1)*7;ones(d(9),1)*8];
        % %%%%%%%%%选定测试集和训练集%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %rand('state',0)  %设置随机种子
        r_all=d(8)+d(9); %样本容量
     else if i==4
        digittemp=[digit9;digit0];            %选取类别
        labeltemp=[ones(d(10),1)*9;ones(d(1),1)*0];
        % %%%%%%%%%选定测试集和训练集%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %rand('state',0)  %设置随机种子
        r_all=d(10)+d(1); %样本容量
     else if i==5
        digittemp=[digit3;digit4;digit6];            %选取类别
        labeltemp=[ones(d(4),1)*3;ones(d(5),1)*4;ones(d(7),1)*6];
        % %%%%%%%%%选定测试集和训练集%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %rand('state',0)  %设置随机种子
        r_all=d(4)+d(5)+d(7); %样本容量
     else if i==6
        digittemp=[digit0;digit7;digit9];            %选取类别
        labeltemp=[ones(d(1),1)*0;ones(d(8),1)*7;ones(d(10),1)*9];
        % %%%%%%%%%选定测试集和训练集%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %rand('state',0)  %设置随机种子
        r_all=d(1)+d(8)+d(10); %样本容量
         end
         end
         end
        end
        end
    end

r1=randnorepeat(round(r_all/4),r_all);    %随机选取1/4样本作为测试集
test=digittemp(r1,:);      %test为测试集
train=digittemp; train(r1,:)=[];         %train为训练集
testlabel=labeltemp(r1,:); %测试集的标签
trainlabel=labeltemp; trainlabel(r1,:)=[];%训练集的标签
%%%%%%%以上数据均存在mRMR.mat文件中%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load mRMR;
M=100;                 %M是特征全集的容量
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

eval(['save data',num2str(i)])
end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %生成一列在[1,n]范围内的m个不重复的整数
% function d=randnorepeat(m,n)
% p=randperm(n);
% d=p(1:m);
% end

