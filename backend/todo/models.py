from django.db import models
from django.conf import settings

class ToDoCategory(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    category = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.category

class ToDoItem(models.Model):
    category = models.ForeignKey(ToDoCategory, on_delete=models.CASCADE)
    item = models.CharField(max_length=100)
    isDone = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.item
