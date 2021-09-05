from rest_framework.views import APIView
from rest_framework.response import Response
from users import serializers
from users import models
from users.forms import UserRegisterForm


class UserCreate(APIView):
    """
    Creates a new user.
    """
    def post(self, request):
        """
        Creates a new user.
        """
        form = UserRegisterForm(request.data)
        if form.is_valid():
            form.save()
            return Response({"detail": "user registered"})
        return Response(form.errors, status=400)