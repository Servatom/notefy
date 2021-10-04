from django.urls import path

from todo.models import ToDoItem
from .views import ToDoCategoryView, ToDoItemView

urlpatterns = [
    path('category/', ToDoCategoryView.as_view(), name="todo-list"),
    path('item/', ToDoItemView.as_view(), name="todo-list"),
]