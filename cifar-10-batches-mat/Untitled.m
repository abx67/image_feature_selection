A=zeros(6131,784);
tempA=midfea(100,:);
A(:,tempA)=digit3(:,tempA);
mnistdisp(digit4(1:10,:)')
hold on
B=zeros(5842,784);
tempB=midfea(100,:);
B(:,tempB)=digit4(:,tempB);
mnistdisp(B(1:10,:)')
hold off


rgbdisp(data(1:10,:))

%%%%%%%%%%%%%%%%%%%%%%%
loc=[];    
for i=1:10
    temp=find(labels==i-1);
    loc(i,1:length(temp))=temp;
end

test=data(temp_loc,:);
testlabel=labels(temp_loc);
trainlabel=double(trainlabel);
trainlabel=num2str(trainlabel);
class(trainlabel)
testlabel=double(testlabel);
testlabel=num2str(testlabel);
class(testlabel)
model_miq=svmtrain(trainlabel,train);
[predictlabel_miq,accuracy_miq]=svmpredict(testlabel,test,model_miq);

train=double(train);
test=double(test);
trainlabel=double(trainlabel);
testlabel=double(testlabel);


