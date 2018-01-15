loc=[];    
for i=1:10
    temp=find(labels==i-1);
    loc(i,1:length(temp))=temp;
end
temp_loc1=loc(1,:);
temp_loc2=loc(2,:);
temp_loc1=temp_loc1(find(temp_loc1~=0));
temp_loc2=temp_loc2(find(temp_loc2~=0));
temp_loc=[temp_loc1,temp_loc2];

train=data(temp_loc,:);
trainlabel=labels(temp_loc);

M=150;                 %M是特征全集的容量
for m=1:M           %i表示本次循环特征子集的容量
    midfea(m,1:m)=mrmr_mid_d(train,trainlabel,m);
    miqfea(m,1:m)=mrmr_miq_d(train,trainlabel,m);
end
save ('batch1.mat','midfea','miqfea');


