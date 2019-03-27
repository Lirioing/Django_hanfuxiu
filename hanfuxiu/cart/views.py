from django.shortcuts import render
from django.http import JsonResponse
import json
from . import models
import hanfuxiu.settings as settings
# Create your views here.

#添加到购物车
def addCart(request):
    # 判断请求的方法是不是POST
    if request.method == 'POST':
        try:
            # 格式{"user_id":"18","goods_id":"5","quantity":"2","goods_size":"S"}
            # 原理:判断是否为空,如果不为空,从cart表中去查询有没有该user有没有这条购物车记录
            # 如果有,则只修改购物车记录中的数据,如果没有,则为添加购物车,其中这2中的返回都是
            # 加购成功,为了区别,我在一个里面添加了一个massage信息,用于区分2个加购成功
            body = request.body
            info= body and json.loads(body)
            # print(info)
            if info['user_id'] and info['goods_id'] and info['quantity'] and info['goods_size']:
                cart=list(models.shopping_cart.objects.filter(user_id=info['user_id'],goods_id=info['goods_id'],goods_size=info['goods_size']).values('id','quantity'))
                if not cart:
                    info['checked']='true'
                    cart_obj = models.shopping_cart.objects.create(**info)
                    cart_obj.save()
                    return JsonResponse({"status_code":"X222","status_text":"加购成功"})
                else:
                    info['quantity']=int(info['quantity'])+int(cart[0]['quantity'])
                    xx=models.shopping_cart.objects.filter(id=cart[0]['id']).update(quantity=info['quantity'],checked='true')
                    # print(xx)
                    return JsonResponse({"massage":"这里是增加了数量","status_code":"X222","status_text":"加购成功"})
            else:
                return JsonResponse({"status_code":"X223","status_text":"加购失败"})
        except Exception as ex:
            print(ex)
            return JsonResponse({"message": "抛出异常", "status_code": "X401", "status_text": "系统错误"})
    return JsonResponse({"status_code": "X401", "status_text": "系统错误"})


def getCart(request):
    if request.method=="POST":
        try:
            # 通过user_id获取购物车信息,先从cart表中取到我们需要的数据,然后再从goods和style,shop表中,
            # 分别取出goods_name,main_img,shop_name,然后把数据传回前台
            body = request.body
            info = body and json.loads(body)
            if info['user_id']:
                cart = list(models.shopping_cart.objects.filter(user_id=info['user_id']).values())
                for i in range(len(cart)):
                    goods=list(models.goods.objects.filter(id=cart[i]['goods_id']).values())
                    img=list(models.style.objects.filter(id=cart[i]['goods_id']).values())
                    shop=list(models.shop.objects.filter(id=goods[0]['shop_id']).values())
                    cart[i]['goods_name']=goods[0]['name']
                    cart[i]['price']=goods[0]['price']
                    cart[i]['main_img']=img[0]['main_img']
                    cart[i]['shop_name']=shop[0]['name']
                    cart[i].pop('create_date')
                # print(cart)
                return JsonResponse(cart, safe=False)
            return JsonResponse({"status_code":"X224","status_text":"查询失败"})
        except Exception as ex:
            print(ex)
            return JsonResponse({"message": "抛出异常", "status_code": "X401", "status_text": "系统错误"})
    return JsonResponse({"status_code": "X401", "status_text": "系统错误"})

def delCart(request):
    if request.method=="POST":
        try:
            # 删除购物车的记录,因为获取购物车信息的时候,把cart表中的id也获取过去了
            # 所以,我们前台只需要传一个order_id过来,然后通过id来删除cart表中的数据
            body = request.body
            info = body and json.loads(body)
            if info['cart_id']:
                del_obj = models.shopping_cart.objects.filter(id=info['cart_id'])
                if del_obj:
                    del_obj.delete()
                    return JsonResponse({"status_code":"X235","status_text":"删除购物车商品成功"})
                return JsonResponse({"status_code":"X236","status_text":"删除购物车商品失败"})
            return JsonResponse({"status_code": "X405", "status_text": "数据格式不合法"})
        except Exception as ex:
            print(ex)
            return JsonResponse({"message": "抛出异常", "status_code": "X401", "status_text": "系统错误"})
    return JsonResponse({"status_code": "X401", "status_text": "系统错误"})

def updateCart(request):
    if request.method=="POST":
        try:
            # 格式
            # {"cart_id":"18","checked":"true"}
            # {"cart_id":"18","quantity":"4","checked":"false"}
            # {"cart_id":"18","quantity":"4"}
            # 添加购物车的时候默认checked=true,所以,购物车页面渲染出来的刚刚添加购物车的应该是选中状态的,
            # 这里传的格式随意,
            body=request.body
            info=body and json.loads(body)
            if info['cart_id']:
                if "quantity" in info.keys() and info['quantity']:
                    models.shopping_cart.objects.filter(id=info['cart_id']).update(quantity=info['quantity'])
                    if 'checked' in info.keys() and info['checked']:
                        models.shopping_cart.objects.filter(id=info['cart_id']).update(checked=info['checked'])
                        return JsonResponse({"status_code":"X221","status_text":"购物车数据更新成功"})
                    return JsonResponse({"status_code":"X221","status_text":"购物车数据更新成功"})
                elif 'checked' in info.keys() and info['checked']:
                    models.shopping_cart.objects.filter(id=info['cart_id']).update(checked=info['checked'])
                    return JsonResponse({"status_code":"X221","status_text":"购物车数据更新成功"})
                else:
                    return JsonResponse({"status_code":"X220","status_text":"购物车数据更新失败"})
            else:
                return JsonResponse({"status_code": "X405", "status_text": "数据格式不合法"})
        except Exception as ex:
            print(ex)
            return JsonResponse({"message": "抛出异常", "status_code": "X401", "status_text": "系统错误"})
    return JsonResponse({"status_code": "X401", "status_text": "系统错误"})
