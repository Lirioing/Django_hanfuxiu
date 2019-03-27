from django.db import models
# 导入goods表和style表,这里的style在views中的getOrder中用到了
from goods.models import goods,style
from user.models import user

# Create your models here.
# 创建order_status表
class order_status(models.Model):
    status_text=models.CharField(max_length=20)

# 创建order表
class order(models.Model):
    user=models.ForeignKey(to=user,to_field='id',on_delete=models.CASCADE)
    goods=models.ForeignKey(to=goods,to_field='id',on_delete=models.CASCADE)
    order_num=models.CharField(max_length=20)
    goods_size=models.CharField(max_length=10)
    order_status=models.ForeignKey(to=order_status,to_field='id',on_delete=models.CASCADE)
    quantity=models.IntegerField()
    create_date=models.DateTimeField(auto_now_add=True)

