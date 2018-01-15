TRandTE <- function(data) {
  r=nrow(data)
  pos=sample(c(1:r),size=round(r/4))
  test=data[pos,]
  train=data[-pos,]
  output <- list(train = train, test = test)
  return(output)
}


# sample:
#   dim(diabetes)   we will get 767  9
#   diabetes_train=TRandTE(diabetes)$train  we get trainning set
#   diabetes_test=TRandTE(diabetes)$test    we get testing set
