import numpy
import time
from sklearn.externals import joblib
from sklearn.feature_extraction import DictVectorizer
import csv

clf = joblib.load("train_model.m")

# Read in the csv File and put feature in a list of class label
# toPredictedData = open(r"D:\pycharmprojects\test\Resources\to_predicted_dataset.csv", "rb")
toPredictedData = open(r"D:\pycharmprojects\test\Resources\test9.csv", "rb")
reader = csv.reader(toPredictedData)
headers = reader.next()
# print headers

featureList = []
for row in reader:
    rowDic = {}
    for i in range(1, len(row)):
        rowDic[headers[i]] = row[i]
    featureList.append(rowDic)
# print featureList
# k=0
# for j in featureList:
#     k+=1
#     if not j['TL'] == '1' and  not j['TL'] == '2' and  not j['TL'] == '3':
#         print k, j['TL']

# Vector Feature
vec = DictVectorizer()
dummyX = vec.fit_transform(featureList).toarray()
# print "dummyX:", dummyX
# print vec.get_feature_names()
# print "labelList:"+str(labelList)
result = open('result.txt', 'w')
for row in dummyX:
    i += 1
    predictedY = clf.predict(row.reshape(1, -1))

    result.write(str(predictedY[0]) + '\n')
    # print i, "predictedY:" + str(predictedY)
result.close()
