from django.db import models


# Create your models here.
# 创建性别表
class gender(models.Model):
    name=models.CharField(max_length=10)

# 创建头像表
class usericon(models.Model):
    usericon=models.CharField(max_length=255)
    create_date=models.DateTimeField(auto_now_add=True)

# 创建user表,部分pycharm有问题(性别表是主表当在user表下边,to='gender',
# 在后台生成的的外键中找不到user_gender表,只是一个gender表),建议主表在上边
class user(models.Model):
    # 自动创建一个id列，id为主键、自增长
    telephone = models.CharField(max_length=30,null=False)
    password = models.CharField(max_length=255,null=False)
    username = models.CharField(max_length=64)
    role = models.CharField(max_length=64)
    gender= models.ForeignKey(to=gender,to_field="id", default=1, on_delete=models.CASCADE)
    shop_status = models.CharField(max_length=64)
    create_date = models.DateTimeField(auto_now_add=True)
    usericon = models.ForeignKey(to=usericon, to_field='id',default=1, on_delete=models.CASCADE)
    # memo = models.TextField(default='nothing')
    # memo = models.TextField(null=True)

# 创建一个shop表
class shop(models.Model):
    user=models.ForeignKey(to=user,to_field='id',on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    shop_address=models.CharField(max_length=100)

# 创建一个地址表
class address(models.Model):
    user=models.ForeignKey(to=user,to_field='id',on_delete=models.CASCADE)
    name=models.CharField(max_length=10)
    province=models.CharField(max_length=20)
    city=models.CharField(max_length=20)
    distinct=models.CharField(max_length=20)
    address=models.CharField(max_length=60)
    create_date=models.DateTimeField(auto_now_add=True)

