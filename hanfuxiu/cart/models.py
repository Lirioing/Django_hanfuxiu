from django.db import models
from goods.models import goods,style
from user.models import user,shop

# Create your models here.
# 创建购物车表
class shopping_cart(models.Model):
    user=models.ForeignKey(to=user,to_field='id',on_delete=models.CASCADE)
    goods=models.ForeignKey(to=goods,to_field='id',on_delete=models.CASCADE)
    checked=models.CharField(max_length=10,null=True)
    quantity=models.IntegerField()
    goods_size=models.CharField(max_length=10)
    create_date=models.DateTimeField(auto_now_add=True)