import jwt,json
from functools import wraps
from django.http import HttpResponse, response, JsonResponse
SECRET = '123456'
def createToken(id):
    import datetime
    import hashlib
    datetimeInt=datetime.datetime.utcnow()+datetime.timedelta(seconds=180)
    option={
        'iss':'hanfuxiu.com',
        'exp':datetimeInt,
        'iat':datetime.datetime.utcnow(),
        'aud':'webkit',
        'telephone':id
    }
    token = jwt.encode(option,SECRET,'HS256')
    return token.decode()




def checkToken(token):
    try:
        decoded = jwt.decode(token, '123456', audience='webkit', algorithms=['HS256'])
        return decoded['telephone']
    except jwt.ExpiredSignatureError as ex:
        return None

def checkLogin(request):
    def decorated(func):
        @wraps(func)
        def wrapper():
             try:
                token=request.headers.get('token')
                decoded = jwt.decode(token,SECRET, audience='webkit', algorithms=['HS256'])
                return func()
             except jwt.ExpiredSignatureError as ex:
                 return JsonResponse({"status_code": "X107", "status_text": "未登录"})
        return wrapper
    return decorated