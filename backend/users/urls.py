from django.urls import path, include
from .views import UpdateDetailUserView, ListUserView

urlpatterns = [
    path('', ListUserView.as_view(), name='list-user'),
    path('auth/', include('dj_rest_auth.urls')),
    path('profile/<pk>/', UpdateDetailUserView.as_view(), name='update-user'),
    path('registration/', include('dj_rest_auth.registration.urls')),
]