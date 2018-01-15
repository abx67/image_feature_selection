function [err] = mydisp(origdigits,fea,col);
[dd,N] = size(origdigits);
if nargin<3
    col=sqrt(dd);
    if nargin<2
        fea=1:dd;
    end
end
row=col;
digits=zeros(dd,N);
digits(fea,:)=origdigits(fea,:);
% display a group of MNIST images 
imdisp=zeros(2*col,ceil(N/2)*row);

for nn=1:N
  ii=rem(nn,2); if(ii==0) ii=2; end
  jj=ceil(nn/2);

  img1 = reshape(digits(:,nn),row,col);
  img2(((ii-1)*row+1):(ii*row),((jj-1)*col+1):(jj*col))=img1';
end
if col==28    
    imagesc(img2,[0 1]); colormap gray; axis equal; axis off;
    drawnow;
else
    imagesc(img2,[0 255]); colormap gray; axis equal; axis off;
    drawnow;
end
err=0; 