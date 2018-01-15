library(stats)

## Computing the GCP p-value based on data of SNPs and case-control outcomes
## obs.outcome: the case-control outcomes; obs.SNPs: A list describing the SNPs data;
## x1,x2: cut points of GCP
## B: iterations

myGCP <- function(obs.outcome, obs.SNPs, x1, x2, B)
{
  ## Observed p-values
  p <- c()
  for(k in 1:ncol(obs.SNPs))
  {
    glm.sim <- glm(obs.outcome~obs.SNPs[,k],data=obs.SNPs,family="binomial")
    if(nrow(summary(glm.sim)$coefficients)<2){
      p[k]=1
    }
    else{
      p[k] <- summary(glm.sim)$coefficients[2,4]
    }
  }
  
  ## Permutation p-values
  
  p_1 <- matrix(rep(0,B*ncol(obs.SNPs)),nrow=ncol(obs.SNPs),ncol=B)
  yp <- matrix(rep(0,B*length(obs.outcome)),nrow=length(obs.outcome),ncol=B)
  for (h in 1:B)
  {
    yp[,h] <- sample(obs.outcome,length(obs.outcome),replace=F)
    
    for(u in 1:ncol(obs.SNPs))
    {
      glm.sim2 <- glm(yp[,h]~obs.SNPs[,u],data=obs.SNPs,family="binomial")
      if(nrow(summary(glm.sim2)$coefficients)<2){
        p_1[u,h]=1
      }
      else{
        p_1[u,h] <- summary(glm.sim2)$coefficients[2,4]
      }
    }
  }
  
  ## Simulate F1,F2 
  t1mc <- c()
  t2mc <- c()
  F1mc <- c()
  F2mc <- c()
  for(i in 1:B)
  {
    t1mc[i] <- sum(-2*log(p_1[which(p_1[,i]<=x1),i]))
    t2mc[i] <- sum(-2*log(p_1[which(p_1[,i]>x1&p_1[,i]<=x2),i]))
  }
  for(j in 1:B)
  {
    F1mc[j] <- length(which(t1mc<t1mc[j]))/B
    F2mc[j] <- length(which(t2mc<t2mc[j]))/B
  }
  
  ## Calculate p-value of GCP
  
  t1 <- sum(-2*log(p[which(p<=x1)]))
  t2 <- sum(-2*log(p[which(p>x1&p<=x2)]))
  gcp <- -2*log(1-length(which(t1mc<t1))/B)-2*log(1-length(which(t2mc<t2))/B)
  gcpmc <- -2*log(1-F1mc)-2*log(1-F2mc)
  
  gcp.pvalue <- length(which(gcpmc>=gcp))/B
  
  
  return(gcp.pvalue) 
}
