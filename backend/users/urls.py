from django.urls import path
from .views import CreateUserView, UpdateDetailUserView, ListUserView

urlpatterns = [
    path('', ListUserView.as_view(), name='list-user'),
    path('register/', CreateUserView.as_view(), name='create-user'),
    path('profile/<pk>/', UpdateDetailUserView.as_view(), name='update-user'),
]