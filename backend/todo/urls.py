from django.urls import path
from .views import ToDoList, ToDoCreate, ToDoDetail

urlpatterns = [
    path('', ToDoList.as_view(), name="todo-list"),
    path('<int:pk>/', ToDoDetail.as_view(), name="todo-detail"),
    path('create/', ToDoCreate.as_view(), name="note-create"),
]