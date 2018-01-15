# getone<- function(x,y){
#   if(length(x)==0){
#     y=y
#     x=x}
#   else{
#     findloc=sample(c(1:length(x)), size = 1)
#     y=c(y,data[findloc])
#     x=x[-findloc]
#   }
# }
# 
# winornot<-function(x){
#   if(length(x)==0){
#     return (0)
#   }
#   findloc=sample(c(1:length(x)), size = 1)
#   if(x[findloc]==25){
#     return (1)
#   }
#   else return (0)
# }
#########################################

win<-rep(0,10000)
#win<-vector(mode="numeric",length=0)
for (k in 1:10000){
data=c(rep(0,25),5,5,6,25,25)

handsloc=sample(c(1:30), size = 3)
hands=data[handsloc]
data=data[-handsloc]
findloc=sample(c(1:27), size = 6)
hands=c(hands,data[findloc])
data=data[-findloc]

  if(6 %in% hands)
  {
    data=data[-which(data==0)]
    getone(data,hands)    #6费打出6，7费抽一张
    if(5 %in% hands){
      win[k]=winornot(data)
      next
    }
    ###################
    getone(data,hands) #8费抽一张
    if(5 %in% hands){
      win[k]=winornot(data)
      next
    }
    getone(data,hands) #9费
    if(5 %in% hands){
      win[k]=winornot(data)
      next
    }
    getone(data,hands) #10费
    if(5 %in% hands){
      win[k]=winornot(data)
      next
    }
  }
  
#################################
  getone(data,hands)  #7费抽一张
  if(6 %in% hands)
  {
    data=data[-which(data==0)]
    ###################
    getone(data,hands) #8费抽一张
    if(5 %in% hands){
      win[k]=winornot(data)
      next
    }
    getone(data,hands) #9费
    if(5 %in% hands){
      win[k]=winornot(data)
      next
    }
    getone(data,hands) #10费
    if(5 %in% hands){
      win[k]=winornot(data)
      next
    }
  }
##########################
getone(data,hands)  #8费抽一张
if(6 %in% hands)
{
  data=data[-which(data==0)]
  ###################
  getone(data,hands) #9费
  if(5 %in% hands){
    win[k]=winornot(data)
    next
  }
  getone(data,hands) #10费
  if(5 %in% hands){
    win[k]=winornot(data)
    next
  }
}
############################
getone(data,hands)  #9费抽一张
if(6 %in% hands)
{
  data=data[-which(data==0)]
  ###################
  getone(data,hands) #10费
  if(5 %in% hands){
    win[k]=winornot(data)
    next
  }
}
else win[k]=0
}

mean(win==1)
