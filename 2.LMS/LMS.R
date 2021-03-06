library(ggplot2)

x1=c()
x2=c()
d=c()


x1[1]=1; x2[1]=-1; d[1]=1
x1[2]=-1; x2[2]=-1; d[2]=1
x1[3]=0; x2[3]=0; d[3]=0
x1[4]=1; x2[4]=0; d[4]=0
qplot(x1,x2,color=factor(d))#visulization

# Create matrix
p = as.matrix(data.frame(x1,x2))

W = c(0,0) #Weight Matrix
b = 0 #bias
eta = 0.5 #learning rate
n = 5000       #Iteration

MSE = c()    #Mean Square error


for(i in 1:n){
  k = (i-1) %% 4 + 1

  y = W[1]*x1[k] + W[2]*x2[k] + b
  e = d[k] - y          
  MSE[i] = e**2 
  
  W[1] = W[1] + 2 * eta * e * x1[k]
  W[2] = W[2] + 2 * eta * e * x2[k]
  b = b + 2 * eta * e
}

plot(MSE,type='l',xlab='iteration') #Plot

y = sign(p %*% W)
cols=c()
cols[1]='red'
cols[2]='blue'
plot(x1,x2,type='p',col=cols[d+1],pch=20) #Plot
abline(-b/W[2],-W[1]/W[2])
print(W);print(b)

