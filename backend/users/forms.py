from django import forms
from rest_framework.authtoken.models import Token
from users.models import User
from django.db import transaction


class UserRegisterForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('email', 'name', 'password')

    @transaction.atomic
    def save(self, commit=True):
        user = super(UserRegisterForm, self).save(commit=False)
        user.set_password(self.cleaned_data['password'])
        user.is_active = False
        user.save()
        Token.objects.create(user=user)
        return user
