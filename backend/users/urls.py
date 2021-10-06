from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from . import views

urlpatterns = [
    path('register/', views.UserCreate.as_view(), name='register'),
    path('email-verify/<str:token>',
         views.EMailVerifyView.as_view(), name='email_verify'),
    path('detail/', views.UserDetailView.as_view(), name='login'),
    path('reset_password/', views.ResetPasswordView.as_view(), name='reset_password'),
    path('change_name/', views.ChangeName.as_view(), name='change_name'),
    path('avatar_change/', views.AvatarChange.as_view(), name='avatar_change'),
]
