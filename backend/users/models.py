import uuid

from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, UserManager
from django.db import models
from users.managers import UserManager

class User(AbstractBaseUser, PermissionsMixin):
    """
    Custom User model
    """
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    email = models.EmailField(
        max_length=255, unique=True, verbose_name="email address"
    )
    name = models.CharField("Name", max_length=20)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["name",]

    objects = UserManager()

    def __str__(self):
        return f"{self.name}"