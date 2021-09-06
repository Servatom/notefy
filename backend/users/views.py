from rest_framework.views import APIView
from rest_framework.response import Response
from users import serializers
from users import models
from users.forms import UserRegisterForm
from rest_framework.permissions import IsAuthenticated


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

class UserDetailView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        email = request.user.email
        user = models.User.objects.get(email=email)
        serializer = serializers.UserSerializer(user)
        result = serializer.data
        print(serializer.data)
        return Response(result)
    
class ResetPasswordView(APIView):
    permission_classes = (IsAuthenticated,)
    def post(self, request):

        # check old password
        email = request.user.email
        user = models.User.objects.get(email=email)

        if not user.check_password(request.data['old_password']):
            return Response({"detail": "old password is wrong"}, status=400)
        # change new password
        user.set_password(request.data['new_password'])
        user.save()
        return Response({"detail": "password changed"})
