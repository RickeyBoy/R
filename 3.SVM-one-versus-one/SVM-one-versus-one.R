# 加载相应包
library('ggplot2') # 可视化
library('e1071') # SVM
library(readr) # 读入数据
library('dplyr') # 数据处理

train <- read_delim("~/Desktop/R Language/SVM/train.txt", 
                    " ", escape_double = FALSE, col_names = FALSE, 
                    trim_ws = TRUE)
test <- read_delim("~/Desktop/R Language/SVM/test.txt", 
                   " ", escape_double = FALSE, col_names = FALSE, 
                   trim_ws = TRUE)


# 从train中提取有效数值
{
  train$X2 <- as.numeric(gsub('1:','',train$X2))
  train$X3 <- as.numeric(gsub('2:','',train$X3))
  train$X4 <- as.numeric(gsub('3:','',train$X4))
  train$X5 <- as.numeric(gsub('4:','',train$X5))
  train$X6 <- as.numeric(gsub('5:','',train$X6))
  train$X7 <- as.numeric(gsub('6:','',train$X7))
  train$X8 <- as.numeric(gsub('7:','',train$X8))
  train$X9 <- as.numeric(gsub('8:','',train$X9))
  train$X10 <- as.numeric(gsub('9:','',train$X10))
  train$X11 <- as.numeric(gsub('10:','',train$X11))
  train$X12 <- as.numeric(gsub('11:','',train$X12))
  train$X13 <- as.numeric(gsub('12:','',train$X13))
  train$X14 <- as.numeric(gsub('13:','',train$X14))
  train$X15 <- as.numeric(gsub('14:','',train$X15))
  train$X16 <- as.numeric(gsub('15:','',train$X16))
  train$X17 <- as.numeric(gsub('16:','',train$X17))
  train$X18 <- as.numeric(gsub('17:','',train$X18))
  train$X19 <- as.numeric(gsub('18:','',train$X19))
  train$X20 <- as.numeric(gsub('19:','',train$X20))
  train$X21 <- as.numeric(gsub('20:','',train$X21))
  
  
  # 从test中提取有效数值
  test$X2 <- as.numeric(gsub('1:','',test$X2))
  test$X3 <- as.numeric(gsub('2:','',test$X3))
  test$X4 <- as.numeric(gsub('3:','',test$X4))
  test$X5 <- as.numeric(gsub('4:','',test$X5))
  test$X6 <- as.numeric(gsub('5:','',test$X6))
  test$X7 <- as.numeric(gsub('6:','',test$X7))
  test$X8 <- as.numeric(gsub('7:','',test$X8))
  test$X9 <- as.numeric(gsub('8:','',test$X9))
  test$X10 <- as.numeric(gsub('9:','',test$X10))
  test$X11 <- as.numeric(gsub('10:','',test$X11))
  test$X12 <- as.numeric(gsub('11:','',test$X12))
  test$X13 <- as.numeric(gsub('12:','',test$X13))
  test$X14 <- as.numeric(gsub('13:','',test$X14))
  test$X15 <- as.numeric(gsub('14:','',test$X15))
  test$X16 <- as.numeric(gsub('15:','',test$X16))
  test$X17 <- as.numeric(gsub('16:','',test$X17))
  test$X18 <- as.numeric(gsub('17:','',test$X18))
  test$X19 <- as.numeric(gsub('18:','',test$X19))
  test$X20 <- as.numeric(gsub('19:','',test$X20))
  test$X21 <- as.numeric(gsub('20:','',test$X21))
}

##### SVM one Versus one #####
# 生成train的输入向量x和label向量y
x = subset(train, select = -X1)
y = train$X1
# 生成model,Linear
model1 = svm(x,y,kernel = "linear",type = "C-classification")
# 生成model,RBF
model2 = svm(x,y,kernel = "radial",type = "C-classification")

# train自测
# 生成预测的label
pred1 = predict(model1,x)
pred1 = as.numeric(as.character(pred1))
pred2 = predict(model2,x)
pred2 = as.numeric(as.character(pred2))
#计算准确率
num1 = sum(pred1==y)
rate1 = num1/(num1+sum(pred1!=y))
print('1v1,linear,rate:');print(rate1)
num2 = sum(pred2==y)
rate2 = num2/(num2+sum(pred2!=y))
print('1v1,RBF,rate:');print(rate2)

# test预测
newx = subset(test,select = -X1)
label = test$X1
newpred1 = predict(model1,newx)
newpred2 = predict(model2,newx)
#计算准确率
newnum1 = sum(newpred1==label)
newrate1 = newnum1/(newnum1+sum(newpred1!=label))
print('1v1,linear,newrate:');print(newrate1)
newnum2 = sum(newpred2==label)
newrate2 = newnum2/(newnum2+sum(newpred2!=label))
print('1v1,RBF,newrate:');print(newrate2)