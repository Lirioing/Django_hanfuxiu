from django.shortcuts import render
from django.http import HttpResponse, response, JsonResponse
from werkzeug.security import generate_password_hash, check_password_hash
import json, uuid
from . import models
import hanfuxiu.settings as settings

# Create your views here.
# 获取用户收藏的商品
def getCollectByUserInfo(request):
    if request.method == 'POST':
        try:
            body = request.body
            u = body and json.loads(body)
            # 判断用户id和status是否为空
            # 格式{"user_id":"17","status":"1"}
            # 因为获取收藏店铺比收藏商品简单一点,
            # 所以收藏获取收藏的店铺的方法用收藏商品的,只是status不一样而已
            # status为0,则返回收藏的商品,如果status为1则返回收藏的店铺
            # return回去的id很重要,我们删除要用到这个id
            if u['user_id'] and u['status']:
                # 从collecttion表中取出id,goods_id和shop_id,在通过shop表查询到shopname添加到info字典列表中
                # order_by('-create_date')这里的排序方式是根据时间进行倒序排列
                # 同时把时间格式修改一下,方便传输
                info = list(
                        models.collection.objects.filter(user_id=u['user_id'], status=u['status']).values('id', 'goods_id',
                                'shop_id','create_date').order_by('-create_date'))
                for i in range(len(info)):
                    shopname = list(models.shop.objects.filter(id=info[i]['shop_id']).values('name'))
                    info[i]['create_date'] = str(info[i]['create_date']).split(' ')[0]
                    info[i]['shop_name'] = shopname[0]['name']
                    # print(info)
                return JsonResponse(info, safe=False)
            else:
                return JsonResponse({"status_code": "X405", "status_text": "数据格式不合法"})
        except Exception as ex:
            print(ex)
            return JsonResponse({"massage":"抛出异常","status_code": "X409", "status_text": "数据库维护中"})
    else:
        return JsonResponse({"status_code": "X401", "status_text": "系统错误"})

#用户收藏的商品或者店铺
def InsertCollectByUserInfo(request):
    # 判断请求的方法是不是POST
    if request.method == 'POST':
        # 收藏商品的格式{"user_id":"17","status":"0","goods_id":"20"}
        # 收藏店铺的格式{"user_id":"17","status":"1","goods_id":"1"}
        # 收藏店铺是不需要goods_id的,由于数据库中,goods_id不为空,所以我们传一个默认的goods_id=1
        body = request.body
        u = body and json.loads(body)
        if u['user_id'] and u['status'] and u['goods_id']:
            try:
                if u['status'] == "0":
                    # 插入的是商品
                    if not list(models.collection.objects.filter(user_id=u['user_id'], status=u['status'],
                                                                 goods_id=u['goods_id']).values("id")):
                        shop = list(models.goods.objects.filter(id=u['goods_id']).values("shop_id"))
                        u['shop_id'] = shop[0]["shop_id"]
                        col_obj = models.collection.objects.create(**u)
                        col_obj.save()
                        return JsonResponse({"status_code": "X227", "status_text": "收藏商品成功"})
                    else:
                        return JsonResponse({"status_code": "X228", "status_text": "已经收藏过该商品"})
                else:
                    # 插入的是收藏的店铺
                    if not list(models.collection.objects.filter(user_id=u['user_id'], status=u['status'],
                                                                 goods_id=u['goods_id']).values("id")):
                        shop = list(models.goods.objects.filter(id=u['goods_id']).values("shop_id"))
                        u['shop_id'] = shop[0]["shop_id"]
                        col_obj = models.collection.objects.create(**u)
                        col_obj.save()
                        return JsonResponse({"status_code": "X225", "status_text": "收藏店铺成功"})
                    else:
                        return JsonResponse({"status_code": "X226", "status_text": "已经收藏过该店铺"})
            except Exception as ex:
                print(ex)
                return JsonResponse({"status_code": "X229", "status_text": "收藏失败"})
        else:
            return JsonResponse({"status_code": "X405", "status_text": "数据格式不合法"})
    return JsonResponse({"status_code": "X401", "status_text": "系统错误"})

# 删除收藏的商品或者店铺
def DeleteCollectByUserInfo(request):
    if request.method == 'POST':
        try:
            # {"id":"48","status":"0"}
            # 传入的是收藏表的id,之前在获取收藏信息的时候,已经把收藏表的id一并发给前台了
            # 其实直接传入一个收藏的表的id就能解决问题,但是为了让我们的操作更清楚,加了一个
            # status,这样我们更清楚的了解删除收藏的是商品还是店铺
            # status为0删除的是商品,status为1删除的是店铺
            body = request.body
            u = body and json.loads(body)
            if u['id'] and u['status']:
                if u['status'] == "0":
                    # 删除的是商品
                    col_obj=models.collection.objects.filter(id=u['id'])
                    if col_obj:
                        col_obj.delete()
                        return JsonResponse({"status_code": "X231", "status_text": "删除收藏的商品成功"})
                    else:
                        return JsonResponse({"status_code": "X232", "status_text": "删除收藏的商品失败"})
                else:
                    # 删除的是收藏的店铺
                    col_obj = models.collection.objects.filter(id=u['id'])
                    if col_obj:
                        col_obj.delete()
                        return JsonResponse({"status_code": "X233", "status_text": "删除收藏的店铺成功"})
                    else:
                        return JsonResponse({"status_code": "X234", "status_text": "删除收藏的店铺失败"})
            else:
                return JsonResponse({"status_code": "X405", "status_text": "数据格式不合法"})
        except Exception as ex:
            print(ex)
            return JsonResponse({"status_code": "X229", "status_text": "收藏失败"})
    else:
        return JsonResponse({"status_code": "X401", "status_text": "系统错误"})