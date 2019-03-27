# Generated by Django 2.1.7 on 2019-03-27 01:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('user', '0001_initial'),
        ('goods', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('order_num', models.CharField(max_length=20)),
                ('goods_size', models.CharField(max_length=10)),
                ('quantity', models.IntegerField()),
                ('create_date', models.DateTimeField(auto_now_add=True)),
                ('goods', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='goods.goods')),
            ],
        ),
        migrations.CreateModel(
            name='order_status',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status_text', models.CharField(max_length=20)),
            ],
        ),
        migrations.AddField(
            model_name='order',
            name='order_status',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='order.order_status'),
        ),
        migrations.AddField(
            model_name='order',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.user'),
        ),
    ]
