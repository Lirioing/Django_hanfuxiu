from django.shortcuts import render
from django.http import HttpResponse, response, JsonResponse
from werkzeug.security import generate_password_hash, check_password_hash
import json, uuid
from . import models
from .my_token import createToken, checkLogin, checkToken
import hanfuxiu.settings as settings


from django.db import connection, connections
from django.core import serializers
from django.db.models import Q, Count, Max, Min, Sum, Avg


# Create your views here.
# def index(request):
#     return HttpResponse('<h1>user index</h1>')

# 登录,
def Login(request):
    # 判断请求的方法是不是POST
    if request.method=='POST':
        try:
            # 登录的方法,u是request发过来的json,判断u['telephone'] 和 u['password']是否为空
            # user是根据u的telephone去数据库查询出来的结果,
            # 如果user有值,说明用户存在,否则用户不存在
            #用check_password_hash去判断密码是否相同,相同说明登录成功,否则,登录失败
            # 如果中途出现什么错误,Exception就会抛出异常,返回带有massage的系统错误
            body = request.body
            u= body and json.loads(body)
            if u['telephone'] and u['password']:
                user=list(models.user.objects.filter(telephone=u['telephone']).values('id','telephone','password','username'))
                if user:
                    if (check_password_hash(user[0]['password'], u['password'])):
                        # 构建token
                        token = createToken(u['telephone'])
                        return JsonResponse({"status_code": "X103", "status_text": "登录成功", "token": token,"telephone": user[0]['telephone'], "id": user[0]['id'],"username":user[0]['username']})
                    else:
                        return JsonResponse({"status_code": "X105", "status_text": "密码错误"})
                else:
                    return JsonResponse({"status_code":"X104","status_text":"该用户不存在"})
            else:
                return JsonResponse({"status_code": "X405", "status_text": "数据格式不合法"})
        except Exception as ex:
            print(ex)
            return JsonResponse({"massage":"抛出异常","status_code": "X401", "status_text": "系统错误"})
    return JsonResponse({ "status_code": "X405", "status_text": "数据格式不合法"})   #结束登录

#注册
def addUser(request):
    # 判断请求的方法是不是POST
    if request.method == 'POST':
        try:
            # u是request发过来的json,gender是外键gender的查询出来的值,
            #判断u中telephone和password是否为空,为空,数据格式错误
            #在user表中查找是否有u['telephone'],有用户已存在,没有进行注册准备工作
            # pf是使用generate_password_hash加密后的密码,然后把u的默认值加进去,
            # 如果中途出现什么错误,Exception就会抛出异常,返回带有massage的系统错误
            body = request.body
            u = body and json.loads(body)
            if u['telephone'] and u['password']:
                if not list(models.user.objects.filter(telephone=u['telephone']).values('id')):
                    gender = list(models.gender.objects.filter(name='男').values('id'))[0]['id']
                    pf = generate_password_hash(u['password'], method='pbkdf2:sha1:1001', salt_length=8)
                    u['password'] = pf
                    u['username'] = '汉服秀用户'
                    u['role'] = '0'
                    u['gender_id'] = gender
                    u['shop_status'] = '10'
                    user_obj = models.user.objects.create(**u)
                    user_obj.save()
                    return JsonResponse({"status_code": "X101", "status_text": "注册成功"})
                else:
                    return JsonResponse({"status_code": "X102", "status_text": "用户已经存在"})
            else:
                return JsonResponse({"status_code": "X405", "status_text": "数据格式不合法"})
        except Exception as ex:
            print(ex)
            return JsonResponse({"message": "抛出异常", "status_code": "X401", "status_text": "系统错误"})
    return JsonResponse({"status_code": "X401", "status_text": "系统错误"})    #结束注册

# 检查令牌
def check_Token(request):
    if request.method == 'POST':
        try:
            # 判断u['token']是否为空,不为空,调用checkToken方法,
            # 返回值res如果有值,说明token没过期,如果res没有值,说明token已经过期
            # 如果中途出现什么错误,Exception就会抛出异常,返回带有massage的系统错误
            body = request.body
            u = body and json.loads(body)
            if u['token']:
                res = checkToken(u['token'])
                # print(res)
                if res:
                    username = list(models.user.objects.filter(telephone=res).values('username'))
                    # print(username)
                    return JsonResponse({"status_code": "X103", "status_text": "登录成功", "usermassage": username})
                else:
                    return JsonResponse({"status_code": "X106", "status_text": "登录过期"})
            else:
                return JsonResponse({"status_code": "X405", "status_text": "数据格式不合法"})
        except Exception as ex:
            print(ex)
            return JsonResponse({"message": "抛出异常", "status_code": "X401", "status_text": "系统错误"})
    else:
        return JsonResponse({"status_code": "X401", "status_text": "系统错误"})

# 获取用户信息
def getUserinfo(request):
    if request.method=='POST':
        try:
            # 通过用户id从用户表中取出id.telephone,username,gender,usericon
            # 再通过gender表取出name的值,
            # usericon表取出usericon的值
            # 因为return回去的是一个字典列表,要加上safe=False
            body = request.body
            u = body and json.loads(body)
            if u['id']:
                user=list(models.user.objects.filter(id=u['id']).values('id','telephone','username','gender','usericon'))
                # print(user)
                for i in range(len(user)):
                    gendername = list(models.gender.objects.filter(id=user[i]['gender']).values('name'))
                    usericon= list(models.usericon.objects.filter(id=user[i]['usericon']).values('usericon','create_date').order_by('-create_date'))
                    user[i]['gender']=gendername[0]['name']
                    # print(usericon)
                    user[i]['usericon']=usericon[0]['usericon']
                # print(user)
                return JsonResponse(user,safe=False)
        except Exception as ex:
            print(ex)
            return JsonResponse({"message": "抛出异常", "status_code": "X401", "status_text": "系统错误"})
    else:
        return JsonResponse({"status_code": "X401", "status_text": "系统错误"})

# 更新用户信息
def updateUserinfo(request):
    if request.method=="POST":
        try:
            # 1-女； 2-男
            # myStatus:1-username； 2-性别gender； 3-密码password； 4-手机号telephone； 5-地址address 6-头像usericon
            # 模板{"user_id":"42","myStatus":"1","username":"测试"}
            # 如果中途出现什么错误,Exception就会抛出异常,返回带有massage的系统错误
            body=request.body
            info=body and json.loads(body)
            if info['user_id'] and info['myStatus']:
                if info['myStatus'] == "1":
                    # 修改用户名,前台已经验证了用户名是和修改前的用户名不一致,这里是直接更新
                    if info['username'] != '':
                        aa=models.user.objects.filter(id=info['user_id']).update(username=info['username'])
                        return JsonResponse({"status_code":"X108","status_text":"更新个人信息成功"})
                    return JsonResponse({"massage":"postman null test update username"})
                elif info['myStatus'] =='2':
                    # 修改用户性别
                    if info['gender']:
                        aa = models.user.objects.filter(id=info['user_id']).update(gender=int(info['gender']))
                        return JsonResponse({"status_code":"X108","status_text":"更新个人信息成功"})
                    return JsonResponse({"massage": "postman null  test update gender"})
                elif info['myStatus'] =='3':
                    # 修改用户密码
                    if info['password']:
                        pf = generate_password_hash(info['password'], method='pbkdf2:sha1:1001', salt_length=8)
                        aa = models.user.objects.filter(id=info['user_id']).update(password=pf)
                        return JsonResponse({"status_code":"X108","status_text":"更新个人信息成功"})
                    return JsonResponse({"massage": "postman null test update password"})
                elif info['myStatus'] =='4':
                    # 修改手机号
                    if info['telephone']:
                        tel = list(models.user.objects.filter(telephone=info['telephone']).values('id'))
                        if not tel:
                            aa = models.user.objects.filter(id=info['user_id']).update(telephone=info['telephone'])
                            return JsonResponse({"status_code":"X108","status_text":"更新个人信息成功"})
                        return JsonResponse({"status_code":"X109","status_text":"更新个人信息失败"})
                    else:
                        return JsonResponse({"massage": "postman null test update telephone"})
                elif info['myStatus']=='5':
                    # 修改地址,这里的222222以后要从地址里切出来的,传入的地址格式为
                    # "address":"安徽省 合肥市 蜀山区 名都花园2栋1204号"
                    # 如果格式为上边的,则下面改成address['addresss']=add[3]即可
                    if info['address']:
                        username=list(models.user.objects.filter(id=info['user_id']).values('username'))
                        address ={}
                        add = info['address'].split(" ")
                        address['name']=username[0]['username']
                        address['province'] = add[0]
                        address['city'] = add[1]
                        address['distinct'] = add[2]
                        address['user_id']=info['user_id']
                        address['address']='222222'
                        add_obj = models.address.objects.create(**address)
                        add_obj.save()
                        return JsonResponse({"status_code":"X108","status_text":"更新个人信息成功"})
                    return JsonResponse({"massage": "postman null test update address"})
                else:
                    # 这里是保存上传上来的图片链接
                    if info['usericon']:
                        icon={}
                        icon['usericon']=info['usericon']
                        icon_obj=models.usericon.objects.create(**icon)
                        icon_obj.save()
                        xx=models.user.objects.filter(id=info['user_id']).update(usericon=icon_obj.id)
                        return JsonResponse({"status_code":"X108","status_text":"更新个人信息成功"})
                    return JsonResponse({"massage": "postman null  test usericon gender"})
            else:
                return JsonResponse({"massage":"updatefail"})
        except Exception as ex:
            print(ex)
            return JsonResponse({"message": "抛出异常", "status_code": "X401", "status_text": "系统错误"})
    return JsonResponse({"status_code": "X401", "status_text": "系统错误"})



# 上传头像的接口
def upLoad(request):
    if request.method == 'POST':
        try:
            # 此处可以接收文件和字符串
            img = request.FILES['usericon']
            userid = request.POST.get('userid')
            print(userid)
            # 设置保存的文件名
            name = str(uuid.uuid4()) + "." + str(img).split('.')[1]
            fname = '{path}\imgs\{name}'.format(path=settings.STATICFILES_DIRS[0], name=name)
            # 由于文件是二进制流的方式，所有要用chunks()
            with open(fname, 'wb') as fp:
                for c in img.chunks():
                    fp.write(c)
            return JsonResponse({"code": "success", "img_url": "http://127.0.0.1:8000/static/imgs/" + name})
        except Exception as ex:
            print(ex)
            return JsonResponse({"code": "408"})
    else:
        return JsonResponse({"code": "408"})
