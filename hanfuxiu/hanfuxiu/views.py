from django.shortcuts import render
from django.http import HttpResponse, response, JsonResponse
import json,uuid
from django.db import connection, connections

from django.core import serializers
from django.db.models import Q, Count, Max, Min, Sum, Avg

# Create your views here.
def index(request):
    return HttpResponse('<h1>Index</h1>')


def qiniuToken(request):
    from qiniu import Auth, put_file, etag
    if request.method == 'GET':
        try:
            # 需要填写你的 Access Key 和 Secret Key
            access_key = 'mOjctGeTyLy_ars9yTqPc0t4ZD9JWMf2eAye9YsA'
            secret_key = 'e3viUtFAwXKvRYlrMBqjX7HG_thtEvw51ubQEyLS'
            # 构建鉴权对象
            q = Auth(access_key, secret_key)
            # 要上传的空间
            bucket_name = 'hanfuxiu'
            filename = request.GET.get('filename')
            print(filename)
            # usrid=request.POST.get('userid')
            # 上传到七牛后保存的文件名
            key = str(uuid.uuid4()) + '.' + filename.split('.')[1]
            # key = str(uuid.uuid4())+'.'+f1.name.split('.')[1]
            # 生成上传 Token，可以指定过期时间等
            token = q.upload_token(bucket_name, key, 3600)
            domain = 'http://porcdgu2i.bkt.clouddn.com'

            return JsonResponse({"code": "908", "qiniu_token": token, 'key': key, 'domain': domain})
        except Exception as ex:
            print('error-------------------------')
            print(ex)
            return JsonResponse({"code": "408"})
    else:
        return JsonResponse({"code": "408"})