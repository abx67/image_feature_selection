% % clear;
% % clc;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fid10=fopen('norb-5x46789x9x18x6x2x108x108-training-01-dat.mat','r');
% training_01_dat=fread(fid10,'uchar');
% %fidcat10=fopen('norb-5x46789x9x18x6x2x108x108-training-10-cat.mat','r');
% %training_10_cat=fread(fidcat10,'uchar');
% training_01=transpose(reshape(training_01_dat(25:680244504),108*108,29160*2));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% datanow=training_01(:,1:108*108);
% %%%%%%%%%%%comment tilll here%%%%%%%%%%%%%%%%%%%%%%%%%%

dimdata=108*108;
istart=1001;
iend=1010;
if exist('gooddata')&&exist('baddata')&&exist('ifdata');
    fprintf('do not need to claim good/bad/ifdata \n');
else
    fprintf('this must be the first time to run the code \n');
    gooddata=zeros(1,dimdata);
    goodlabel=[];
    baddata=zeros(1,dimdata);
    badlabel=[];
    ifdata=zeros(1,dimdata);
    iflabel=[];
end
for i=istart:iend
    cifardisp(datanow(i,:)');
    A=input('Enter the A:','s');
    if A=='y';
        if ismember(datanow(i,:),gooddata,'rows')
            fprintf('already have this picture\n');
        else
            gooddata=[gooddata;datanow(i,:)];
            goodlabel=getlabel(goodlabel,i);
        end
        %continue;
    elseif A=='n'
        if ismember(datanow(i,:),baddata,'rows')
            fprintf('already have this picture\n');
        else
            baddata=[baddata;datanow(i,:)];
            badlabel=getlabel(badlabel,i);
        end
        %continue;
    elseif A=='w'
        if ismember(datanow(i,:),ifdata,'rows')
            fprintf('already have this picture\n');
        else
            ifdata=[ifdata;datanow(i,:)];
            iflabel=getlabel(iflabel,i);
        end
        %continue;
    elseif A=='a'
        fprintf('do nothing this time');
    else
        fprintf('wrong input,now come to next loop\n');
        ifdata=[ifdata;datanow(i,:)];
    end
    fprintf('this is %i time\n',i);
end