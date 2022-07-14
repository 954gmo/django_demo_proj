# -*- encoding:utf-8 -*-
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

__ENTITY_author__ = "SIX DIGIT INVESTMENT GROUP"
__author__ = "GWONGZAN"

from django.urls import path, include
from django.contrib.auth import views as auth_views
from . import views

app_name = 'account'
urlpatterns = [
    # path('login/', views.user_login, name='login'),
    path('', views.dashboard, name='dashboard'),
    # path('', include('django.contrib.auth.urls')),
    path('register/', views.register, name='register'),
    path('login/', auth_views.LoginView.as_view(), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),

    path('edit/', views.edit, name='edit'),
]