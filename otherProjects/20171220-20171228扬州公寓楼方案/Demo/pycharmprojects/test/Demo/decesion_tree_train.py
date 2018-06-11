# -*- coding: UTF-8 -*-
'''''
Created on 2016/4/23

@author: Administrator
'''
from sklearn.externals import joblib
from sklearn.feature_extraction import DictVectorizer
import csv
from sklearn import preprocessing
from sklearn import tree

# Read in the csv File and put feature in a list of class label
# allElectronicsData = open(r"D:\pycharmprojects\test\Resources\decsion_tree_dataset.csv", "rb")
allElectronicsData = open(r"D:\pycharmprojects\test\Resources\sample7.csv", "rb")
reader = csv.reader(allElectronicsData)
headers = reader.next()
# print headers

featureList = []
labelList = []
# 存放在两个元祖中
for row in reader:
    labelList.append(row[len(row) - 1])
    rowDic = {}
    # print row
    for i in range(1, len(row) - 1):
        rowDic[headers[i]] = row[i]
    featureList.append(rowDic)
# for j in featureList:
#     print j

# print featureList
# print labelList

# Vector Feature
vec = DictVectorizer()
dummyX = vec.fit_transform(featureList).toarray()
# print "dummyX:",dummyX
# print vec.get_feature_names()
# print "labelList:"+str(labelList)

lb = preprocessing.LabelBinarizer()
dummyY = lb.fit_transform(labelList)
# print "dummyY:" + str(dummyY)

# using desicionTree for classfication
clf = tree.DecisionTreeClassifier(criterion="entropy")  # 创建一个分类器，entropy决定了用ID3算法
clf = clf.fit(dummyX, dummyY)
print "clf:" + str(clf)
joblib.dump(clf, "train_model.m")
# Visulize model
with open("allEallElectronicInfomationGainori.txt", "w") as f:
    f = tree.export_graphviz(clf, feature_names=vec.get_feature_names(), out_file=f)
# dot -T pdf D:\pycharmprojects\test\Demo\allEallElectronicInfomationGainori.txt -o D:\pycharmprojects\test\Demo\output.pdf
#########################
# # 预测
# # Read in the csv File and put feature in a list of class label
# toPredictedData = open(r"D:\pycharmprojects\test\Resources\to_predicted_dataset.csv", "rb")
# reader = csv.reader(toPredictedData)
# headers = reader.next()
# # print headers
#
# featureList = []
# # 存放在两个元祖中
# for row in reader:
#     rowDic = {}
#     for i in range(1, len(row) - 1):
#         rowDic[headers[i]] = row[i]
#     featureList.append(rowDic)
# # print featureList
#
# # Vector Feature
# vec = DictVectorizer()
# dummyX = vec.fit_transform(featureList).toarray()
# print "dummyX:", dummyX
# # print vec.get_feature_names()
# # print "labelList:"+str(labelList)
# for row in dummyX:
#     predictedY = clf.predict(row.reshape(1, -1))
#     print
#     print "predictedY:" + str(predictedY)
# # 预测
# # oneRowX = dummyX[0, :]
# # print "oneRowX:" +str(oneRowX)
# #
# # newRowX = oneRowX
# # newRowX[0] = 1
# # newRowX[2] = 0
# # print type(newRowX)
# # print "newRowX:" + str(newRowX)
# #
# # predictedY = clf.predict(newRowX.reshape(1,-1))
# # print "predictedY:" + str(predictedY)

# dot -T pdf input.txt -o output.pdf
