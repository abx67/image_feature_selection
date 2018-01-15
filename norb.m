% 0 for animal, 1 for human, 2 for plane, 3 for truck, 4 for car, 5 for blank
fid10=fopen('norb-5x46789x9x18x6x2x108x108-training-10-dat.mat','r');
training_10_dat=fread(fid10,'uchar');
%fidcat10=fopen('norb-5x46789x9x18x6x2x108x108-training-10-cat.mat','r');
%training_10_cat=fread(fidcat10,'uchar');
training_10=transpose(reshape(training_10_dat(25:680244504),108*108,29160*2));
%training_10_cat=transpose(reshape(training_10_cat(21:116660),4,29160));

% fid9=fopen('norb-5x46789x9x18x6x2x108x108-training-09-dat.mat','r');
% training_9_dat=fread(fid9,'uchar');
% fidcat9=fopen('norb-5x46789x9x18x6x2x108x108-training-09-cat.mat','r');
% training_9_cat=fread(fidcat9,'uchar'); 
% training_9=transpose(reshape(training_9_dat(25:680244504),108*108,29160*2));
% training_9_cat=transpose(reshape(training_9_cat(21:116660),4,29160));

training_10_cat= repmat([0 1 2 3 4 5],1, 58320/6);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loc=[];    
for i=1:6
    temp=find(training_10_cat==i-1);
    loc(i,1:length(temp))=temp;
end
temp_loc2=loc(3,:);
temp_loc4=loc(5,:);
temp_loc2=temp_loc2(find(temp_loc2~=0));
temp_loc4=temp_loc4(find(temp_loc4~=0));
temp_loc=[temp_loc2,temp_loc4];
train=training_10(temp_loc,:);
trainlabel=training_10_cat(temp_loc);

M=150;                 %M是特征全集的容量
for m=1:M           %i表示本次循环特征子集的容量
    midfea(m,1:m)=mrmr_mid_d(train,trainlabel,m);
    miqfea(m,1:m)=mrmr_miq_d(train,trainlabel,m);
end
save ('NORB_10.mat','midfea','miqfea','-v6');

norbdisp(training_10(5,:)')

