from rest_framework import generics
from django.contrib.auth import get_user_model
from .serializers import UserSerializer
from .permissions import IsSuperUser
from notes.permissions import IsAuthor

User = get_user_model()

class CreateUserView(generics.CreateAPIView):
    serializer_class = UserSerializer

class UpdateDetailUserView(generics.RetrieveUpdateAPIView):
    permission_classes = (IsAuthor, )
    serializer_class = UserSerializer
    def get_queryset(self):
        return User.objects.all().filter(id=self.request.user.id)


class ListUserView(generics.ListAPIView):
    permission_classes = (IsSuperUser, )
    serializer_class = UserSerializer
    queryset = User.objects.all()