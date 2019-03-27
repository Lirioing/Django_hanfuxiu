from django.db import models
from user.models import shop,user

# Create your models here.
# 创建size表
class size(models.Model):
    count=models.CharField(max_length=10)

# 创建status表
class status(models.Model):
    goods_status=models.CharField(max_length=10)

# 创建goods表
class goods(models.Model):
    shop=models.ForeignKey(to=shop,to_field='id',on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    goods_class=models.CharField(max_length=100)
    price=models.IntegerField()
    count=models.IntegerField()
    goods_style=models.IntegerField()
    size=models.ForeignKey(to=size,to_field='id',on_delete=models.CASCADE)
    goods_status=models.ForeignKey(to=status,to_field='id',on_delete=models.CASCADE)
    classbig=models.CharField(max_length=10)
    recommend=models.CharField(max_length=20,default=None)
    create_date=models.DateTimeField(max_length=10)

# 创建style表
class style(models.Model):
    goods=models.ForeignKey(to=goods,to_field='id',on_delete=models.CASCADE)
    main_img=models.CharField(max_length=255)
    style_img1=models.CharField(max_length=255,null=True)
    style_img2=models.CharField(max_length=255,null=True)
    style_img3=models.CharField(max_length=255,null=True)
    info_img1=models.CharField(max_length=255,null=True)
    info_img2=models.CharField(max_length=255,null=True)
    info_img3=models.CharField(max_length=255,null=True)
    info_img4=models.CharField(max_length=255,null=True)
    info_img5=models.CharField(max_length=255,null=True)
    info_img6=models.CharField(max_length=255,null=True)
    recommend_img1=models.CharField(max_length=255,null=True)
    recommend_img2=models.CharField(max_length=255,null=True)
    recommend_img3=models.CharField(max_length=255,null=True)
    recommend_img4=models.CharField(max_length=255,null=True)

# 创建collection表
class collection(models.Model):
    user=models.ForeignKey(to=user,to_field='id',on_delete=models.CASCADE,)
    goods=models.ForeignKey(to=goods,to_field='id',on_delete=models.CASCADE)
    # shopname = models.ManyToManyField(to=shop)
    shop=models.ForeignKey(to=shop,to_field='id',on_delete=models.CASCADE)
    status=models.IntegerField()
    create_date=models.DateTimeField(auto_now_add=True)

# 创建images表
class images(models.Model):
    goods=models.ForeignKey(to=goods,to_field='id',on_delete=models.CASCADE)
    images_ads=models.CharField(max_length=255)