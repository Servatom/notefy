from django.urls import path
from .views import CreateUserView, UpdateDetailUserView, ListUserView

urlpatterns = [
    path('register/', CreateUserView.as_view(), name='create-user'),
    path('profile/<pk>/', UpdateDetailUserView.as_view(), name='update-user'),
    # path('detail/<pk>/', DetailUserView.as_view(), name='detail-user'),
    path('', ListUserView.as_view(), name='list-user'),
]