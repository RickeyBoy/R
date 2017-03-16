# R 语言学习

1. Crescent：双月牙数据分布的生成

    ![-w300](https://github.com/RickeyBoy/R/blob/master/1.Crescent/crescent.png?raw=true)

2. LMS：Widrow-Hoff 学习算法，即 ADALINE 网络和 LMS 算法的简单实现

    ![-w300](https://github.com/RickeyBoy/R/blob/master/2.LMS/lms.png?raw=true)

3. SVM: 调用libsvm，实现svm的one-versus-one算法分类 

- 背景说明：train／test数据用空格隔开，第1列记录蛋白质种类，后面20列记录20种氨基酸所占比例
- 官方手册即简单案例 [LIBSVM](https://www.csie.ntu.edu.tw/~cjlin/libsvm/)
- 本例步骤：
    - 读入数据&清理数据
    - 分别利用linear内核&RBF内核进行训练
    - 分别用训练集、测试集测试，输出准确率
- 说明：
    - LIBSVM处理多分类时，默认使用one-versus-one
    - 若要进行one-versus-rest，需要在predict时将decision.values 更改为 TRUE

