from django.urls import path

from .views import ToDoCategoryView, ToDoItemView, ToDoItemByCategory

urlpatterns = [
    path('category/', ToDoCategoryView.as_view(), name="todo-list"),
    path('item/', ToDoItemView.as_view(), name="todo-list"),
    path('item/<int:cat>/', ToDoItemByCategory.as_view(), name="todo-list"),
]