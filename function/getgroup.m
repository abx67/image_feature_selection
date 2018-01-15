function [fea] = getgroup(groupcol,grouprow,startcol,startrow,col,row);
%groupcol,grouprow=groupcol,startcol=sqrt(col)-groupcol/2,startrow=sqrt(row)-grouprow/2,col=108,row=108
if nargin<5
    col=108;
    row=col;
%             if nargin<4
%                 startrow=startcol;
                 if nargin<3
                     startcol=floor(sqrt(col*row)/2-groupcol/2);
                     startrow=floor(sqrt(col*row)/2-grouprow/2);
                 end
%             end
end
origin=reshape(1:col*row,row,col)';
temprow=startrow+grouprow-1;tempcol=startcol+groupcol-1;
feaorigin(1:grouprow,1:groupcol)=origin(startrow:temprow,startcol:tempcol);
fea=reshape(feaorigin',1,grouprow*groupcol);
end

