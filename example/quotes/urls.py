# -*- encoding:utf-8 -*-
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

__ENTITY_author__ = "SIX DIGIT INVESTMENT GROUP"
__author__ = "GWONGZAN"

from django.urls import path
from . import views
from .views import QuoteList, QuoteView

urlpatterns = [
    path('', views.quote_req, name='quote_request'),
    path('show', QuoteList.as_view(), name='show_quotes'),
    path('show/<int:pk>', QuoteView.as_view(), name='quote-detail'),
]