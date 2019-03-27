"""Django_project_teach URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path
from django.conf.urls import url, include
from . import views

app_name='user'
urlpatterns = [
    url(r'getcollect', views.getCollectByUserInfo,name='getCollectByUserInfo'),
    url(r'insertcollect',views.InsertCollectByUserInfo,name='InsertCollectByUserInfo'),
    url(r'deletecollect',views.DeleteCollectByUserInfo,name='DeleteCollectByUserInfo'),
    # url(r'upload',views.upLoad,name='upLoad'),
    # url(r'checktoken',views.check_Token,name='check_Token'),

]