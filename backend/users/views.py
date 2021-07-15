from django.shortcuts import render
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.views import APIView
from django.contrib.auth import get_user_model
from .serializers import LoginSerializer, UserSerializer
from .permissions import IsSuperUser
from notes.permissions import IsAuthor
from dj_rest_auth.registration.views import ConfirmEmailView
from dj_rest_auth.views import LoginView, LogoutView

User = get_user_model()

class UpdateDetailUserView(generics.RetrieveUpdateAPIView):
    permission_classes = (IsAuthor, )
    serializer_class = UserSerializer
    def get_queryset(self):
        return User.objects.all().filter(id=self.request.user.id)


class ListUserView(generics.ListAPIView):
    permission_classes = (IsSuperUser, )
    serializer_class = UserSerializer
    queryset = User.objects.all()

class CustomLoginView(LoginView, LogoutView):
    def post(self, request, *args, **kwargs):

        self.request = request
        self.serializer = LoginSerializer(data=request.data, context={"request": request})
        self.serializer.is_valid(raise_exception=True)
        self.login()
        if not request.user.is_email_confirmed:
            self.logout(request)
            return Response({'detail': 'Verify Your email'}, status=400)
        return self.get_response()

        

class CustomConfirmEmailView(APIView, ConfirmEmailView):

    def get(self, request, *args, **kwargs):
        obj = self.request.user
        obj.is_email_confirmed = True
        obj.save()
        
        return render(request, 'users/confirm_email.html')