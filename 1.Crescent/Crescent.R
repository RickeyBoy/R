library(ggplot2)

R = 10 #Radius
wid = 6 #Width
dis = 1 #Distance between red and blue

N = 2000 #Numbers
i = 0
x1=c()
x2=c()
d=c()

# Randomly Create
while(i < N/2){
  xi = runif(1,-R-wid/2,R+wid/2); xj = runif(1,0,R+wid/2)
  r = sqrt(xi*xi+xj*xj)
  if(R+wid/2 >= r && R-wid/2 <= r){
    i=i+1
    x1[i]=xi; x2[i]=xj; d[i]=-1
  }
}#Red
while(i < N){
  xi = runif(1,-wid/2,2*R+wid/2); xj = runif(1,-dis-R-wid,-dis)
  r = sqrt((xi-R)*(xi-R)+(xj+dis)*(xj+dis))
  if(R+wid/2 >= r && R-wid/2 <= r){
    i=i+1
    x1[i]=xi; x2[i]=xj; d[i]=1
  }
}#Blue

# Mix Data
rndodr = order(runif(N))
x1=x1[rndodr]
x2=x2[rndodr]
d=d[rndodr]

qplot(x1,x2,color=factor(d))#visulization

# Create matrix
dat = as.matrix(data.frame(x1,x2))
