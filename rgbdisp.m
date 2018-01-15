function [err] = rgbdisp(digit);
% display a group of MNIST images 
digit1=digit(:,1:1024)';digit2=digit(:,1025:2048)';digit3=digit(:,2049:3072)';

col=32;
row=32;
[dd,N] = size(digit1);
imdisp=zeros(2*32,ceil(N/2)*32);

for nn=1:N
  ii=rem(nn,2); if(ii==0) ii=2; end
  jj=ceil(nn/2);
  img1_1 = reshape(digit1(:,nn),row,col);
  img1_2(((ii-1)*row+1):(ii*row),((jj-1)*col+1):(jj*col))=img1_1';
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for nn=1:N
  ii=rem(nn,2); if(ii==0) ii=2; end
  jj=ceil(nn/2);
  img2_1 = reshape(digit2(:,nn),row,col);
  img2_2(((ii-1)*row+1):(ii*row),((jj-1)*col+1):(jj*col))=img2_1';
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for nn=1:N
  ii=rem(nn,2); if(ii==0) ii=2; end
  jj=ceil(nn/2);

  img3_1 = reshape(digit3(:,nn),row,col);
  img3_2(((ii-1)*row+1):(ii*row),((jj-1)*col+1):(jj*col))=img3_1';
end


img(:,:,1)=img1_2;img(:,:,2)=img2_2;img(:,:,3)=img3_2;
imshow(img); axis equal; axis off;
%drawnow;
hold off;

err=0; 