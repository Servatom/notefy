from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth import get_user_model
from .serializers import UserSerializer

User = get_user_model()


class CreateUserView(APIView):
    def post(self, request, *args, **kwargs):
        """
        Creates a new user.
        """
        user = User.objects.create(
            name=request.data['name'],
            email=request.data['email'],
        )
        user.set_password(request.data['password'])
        user.save()
        return Response(status=201)

class UpdateDetailUserView(APIView):
    def post(self, request, *args, **kwargs):
        """
        Updates a user.
        """
        user = User.objects.get(id=kwargs['pk'])
        serializer = UserSerializer(user, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=400)

    def get(self, request, *args, **kwargs):
        """
        Gets a user.
        """
        user = User.objects.get(id=kwargs['pk'])
        serializer = UserSerializer(user)
        return Response(serializer.data)

class ListUserView(APIView):
    def get(self, request, *args, **kwargs):
        """
        Gets a list of users.
        """
        users = User.objects.all()
        serializer = UserSerializer(users, many=True)
        return Response(serializer.data)