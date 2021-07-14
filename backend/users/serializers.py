from django.contrib.auth import get_user_model
from rest_framework import serializers
from dj_rest_auth.serializers import LoginSerializer as RestAuthLoginSerializer
from dj_rest_auth.registration.serializers import RegisterSerializer


User = get_user_model()

class LoginSerializer(RestAuthLoginSerializer):
    username = None

class CustomRegisterSerializer(RegisterSerializer):
    """Use default serializer except don't user username"""
    username = None
    name = serializers.CharField()

    def get_cleaned_data(self):
        return {
            "password1": self.validated_data.get("password1", ""),
            "email": self.validated_data.get("email", ""),
            "name": self.validated_data.get("name", "")
        }

    def perform_create(self, serializer):
        return serializer.save()


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'email', 'password', 'name')
        extra_kwargs = {'password': {'write_only': True, 'min_length': 5}}

    def create(self, validated_data):
        return User.objects.create_user(**validated_data)

    def update(self, instance, validated_data):
        password = validated_data.pop('password', None)
        user = super().update(instance, validated_data)

        if password:
            user.set_password(password)
            user.save()

        return user