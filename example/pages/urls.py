# -*- encoding:utf-8 -*-
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

__ENTITY_author__ = "SIX DIGIT INVESTMENT GROUP"
__author__ = "GWONGZAN"

from django.urls import path
from . import views

urlpatterns = [

    path('contact', views.contact, name='contact'),
    path('', views.index, {'pagename': ''}, name='index'),
    path('<str:pagename>', views.index, name='index'),

    ]