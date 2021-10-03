from rest_framework import serializers
from .models import Todo
from todo.getDateTime import *

class TodoSerializer(serializers.ModelSerializer):
    class Meta:
        fields = ('id', 'author', 'to_do', 'isDone', 'created_at', 'updated_at')
        read_only_fields = ('author',)
        model = Todo


    def save(self, **kwargs):
        return super(TodoSerializer, self).save(author=self.context['request'].user)


    def to_representation(self, instance):
        rep = super(TodoSerializer, self).to_representation(instance)
        rep['created_at'] = giveMeDateTime(rep['created_at'])
        rep['updated_at'] = giveMeDateTime(rep['updated_at'])
        rep['author'] = instance.author.name
        return rep