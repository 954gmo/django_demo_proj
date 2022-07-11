from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User


class Post(models.Model):

    STATUS_CHOICE = (
        ('draft', 'Draft'),
        ('published', 'Published'),
    )

    title = models.CharField(max_length=250)
    # SlugField to build beautiful, SEO-friendly URLs
    slug = models.SlugField(max_length=250, unique_for_date='publish')
    # define many-to-one relationship using ForeignKey()
    author = models.ForeignKey(User, on_delete=models.CASCADE, related_name='blog_posts')

    body = models.TextField()
    publish = models.DateTimeField(default=timezone.now)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    status = models.CharField(max_length=10, choices=STATUS_CHOICE, default='draft')

    class Meta:
        ordering = ('-publish', )