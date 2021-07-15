from django.urls import path, include
from .views import UpdateDetailUserView, ListUserView, CustomConfirmEmailView


urlpatterns = [
    path('', ListUserView.as_view(), name='list-user'),
    path('profile/<pk>/', UpdateDetailUserView.as_view(), name='update-user'),
    path('registration/', include('dj_rest_auth.registration.urls')),
    path('account-confirm-email/<str:key>/', CustomConfirmEmailView.as_view(), name='account_confirm_email')
    
]