# Generated by Django 2.1.7 on 2019-03-27 01:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='collection',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.IntegerField()),
                ('create_date', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='goods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('goods_class', models.CharField(max_length=100)),
                ('price', models.IntegerField()),
                ('count', models.IntegerField()),
                ('goods_style', models.IntegerField()),
                ('classbig', models.CharField(max_length=10)),
                ('recommend', models.CharField(default=None, max_length=20)),
                ('create_date', models.DateTimeField(max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='images',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('images_ads', models.CharField(max_length=255)),
                ('goods', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='goods.goods')),
            ],
        ),
        migrations.CreateModel(
            name='size',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('count', models.CharField(max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='status',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('goods_status', models.CharField(max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='style',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('main_img', models.CharField(max_length=255)),
                ('style_img1', models.CharField(max_length=255, null=True)),
                ('style_img2', models.CharField(max_length=255, null=True)),
                ('style_img3', models.CharField(max_length=255, null=True)),
                ('info_img1', models.CharField(max_length=255, null=True)),
                ('info_img2', models.CharField(max_length=255, null=True)),
                ('info_img3', models.CharField(max_length=255, null=True)),
                ('info_img4', models.CharField(max_length=255, null=True)),
                ('info_img5', models.CharField(max_length=255, null=True)),
                ('info_img6', models.CharField(max_length=255, null=True)),
                ('recommend_img1', models.CharField(max_length=255, null=True)),
                ('recommend_img2', models.CharField(max_length=255, null=True)),
                ('recommend_img3', models.CharField(max_length=255, null=True)),
                ('recommend_img4', models.CharField(max_length=255, null=True)),
                ('goods', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='goods.goods')),
            ],
        ),
        migrations.AddField(
            model_name='goods',
            name='goods_status',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='goods.status'),
        ),
        migrations.AddField(
            model_name='goods',
            name='shop',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.shop'),
        ),
        migrations.AddField(
            model_name='goods',
            name='size',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='goods.size'),
        ),
        migrations.AddField(
            model_name='collection',
            name='goods',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='goods.goods'),
        ),
        migrations.AddField(
            model_name='collection',
            name='shop',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.shop'),
        ),
        migrations.AddField(
            model_name='collection',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.user'),
        ),
    ]
