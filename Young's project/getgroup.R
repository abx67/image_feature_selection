getgroup <- function(groupcol,grouprow=groupcol, startcol=floor(sqrt(col*row)/2-groupcol/2),
                     startrow=floor(sqrt(col*row)/2-grouprow/2),col=108,row=108)
{
  cr=col*row
  origin=t(matrix(1:cr,row,col))
  temprow=startrow+grouprow-1
  tempcol=startcol+groupcol-1
  # feaorigin=matrix(0,grouprow,groupcol)
  feaorigin=origin[startrow:temprow,startcol:tempcol]
  return(c(t(feaorigin)))
}