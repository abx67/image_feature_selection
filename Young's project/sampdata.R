sampdata <- function(data,n)
{
  nn=sample(1:nrow(data),n)
  return(data[nn,])
}
  