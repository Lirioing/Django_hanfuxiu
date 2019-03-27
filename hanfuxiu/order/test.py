import time,random,datetime

# 年1位,时间戳5位,月2位,微秒数5位,随机数5位,日2位
print(str(datetime.now()).split('-')[0][:1]+str(time.mktime(time.strptime(str(datetime.now()).split('.')[0], "%Y-%m-%d %H:%M:%S")))[:5]
      +str(datetime.now()).split('-')[1]+str(datetime.now()).split('-')[2][-5:]+str(random.random())[-5:]+str(datetime.now()).split('-')[2][:2])
# print(str(datetime.now()).split(" ")[0].replace("-","")+str(datetime.now()).split(".")[1])
x=datetime.now()
print(str(x).split('-')[0][:1]) #年
print(str(time.mktime(time.strptime(str(x).split('.')[0], "%Y-%m-%d %H:%M:%S")))[:5]) #时间戳
print(str(x).split('-')[1]) #月
print(str(x).split('-')[2][-5:])#微妙数
print(str(random.random())[-5:])#随机数
print(str(x).split('-')[2][:2]) #日

print(str(x).split('-')[0][:1]+str(time.mktime(time.strptime(str(x).split('.')[0], "%Y-%m-%d %H:%M:%S")))[:5]+str(x).split('-')[1]
      +str(x).split('-')[2][-5:]+str(random.random())[-5:]+str(x).split('-')[2][:2])