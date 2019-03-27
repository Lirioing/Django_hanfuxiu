from django.shortcuts import render
from django.http import JsonResponse
import json,time,random,datetime

from . import models

# Create your views here.
def addOrder(request):
    # 判断请求的方法是不是POST
    if request.method == 'POST':
        try:
            # 格式{"user_id":"18","goods_id":"5","quantity":"2","goods_size":"S"}
            body = request.body
            info= body and json.loads(body)
            # print(info)
            if info['user_id'] and info['goods_id'] and info['quantity'] and info['goods_size']:
                # order_num是我按照下面的规则生成的一串数字,年月日在里面,但是没有这个规则,有看不出来的年月日
                # order_status_id订单状态默认为1,待付款状态
                # 年1位,时间戳5位,月2位,微秒数5位,随机数5位,日2位
                # x = datetime.now()
                # print(str(x).split('-')[0][:1])  # 年
                # print(str(time.mktime(time.strptime(str(x).split('.')[0], "%Y-%m-%d %H:%M:%S")))[:5])  # 时间戳
                # print(str(x).split('-')[1])  # 月
                # print(str(x).split('-')[2][-5:])  # 微秒数
                # print(str(random.random())[-5:])  # 随机数
                # print(str(x).split('-')[2][:2])  # 日
                order_num=str(datetime.now()).split('-')[0][:1]+\
                             str(time.mktime(time.strptime(str(datetime.now()).split('.')[0], "%Y-%m-%d %H:%M:%S")))[:5]+\
                            str(datetime.now()).split('-')[1]+str(datetime.now()).split('-')[2][-5:]+\
                             str(random.random())[-5:]+str(datetime.now()).split('-')[2][:2]
                info['order_num']=order_num
                info['order_status_id']="1"
                ord_obj=models.order.objects.create(**info)
                return JsonResponse({"status_code":"X237","status_text":"创建订单成功"})
            else:
                return JsonResponse({"status_code": "X405", "status_text": "数据格式不合法"})
        except Exception as ex:
            print(ex)
            return JsonResponse({"message": "抛出异常", "status_code": "X401", "status_text": "系统错误"})
    return JsonResponse({"status_code": "X401", "status_text": "系统错误"})


def getOrder(request):
    if request.method=="POST":
        try:
            # 格式{"user_id":"18","order_status":"1"}
            # order_status 1-待付款,2-已付款,3-待发货,4-待收货,5-待评价
            body = request.body
            info = body and json.loads(body)
            if info['user_id'] and info['order_status']:
                # 获取order表的信息,然后在goods表中取到goods_name,style表中的main_img
                order = list(models.order.objects.filter(user_id=info['user_id'],order_status_id=info['order_status']).values())
                print(order)
                for i in range(len(order)):
                    # 这里goods表和style表示在models里面导入进来的
                    order_status=models.order_status.objects.filter(id=info['order_status']).values("status_text")
                    goods = list(models.goods.objects.filter(id=order[i]['goods_id']).values('name'))
                    img=list(models.style.objects.filter(id=order[i]['goods_id']).values('main_img'))
                    order[i]['create_date'] = str(order[i]['create_date']).split(' ')[0]
                    order[i]['order_status_id']=order_status[0]['status_text']
                    order[i]['main_img']=img[0]['main_img']
                    order[i]['goods_name']=goods[0]['name']
                # print(order)
                return JsonResponse(order, safe=False)
            return JsonResponse({"status_code":"X224","status_text":"查询失败"})
        except Exception as ex:
            print(ex)
            return JsonResponse({"message": "抛出异常", "status_code": "X401", "status_text": "系统错误"})
    return JsonResponse({"status_code": "X401", "status_text": "系统错误"})