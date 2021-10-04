from rest_framework import serializers
from .models import ToDoItem, ToDoCategory
from todo.getDateTime import *

class ToDoItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = ToDoItem
        fields = ('id', 'item', 'category', 'isDone', 'created_at', 'updated_at')
        read_only_fields = ('category', )
        model = ToDoItem
    
    def save(self, **kwargs):
        return super(ToDoItemSerializer, self).save(author=self.context['request'].user)


    def to_representation(self, instance):
        rep = super(ToDoItemSerializer, self).to_representation(instance)
        rep['created_at'] = giveMeDateTime(rep['created_at'])
        rep['updated_at'] = giveMeDateTime(rep['updated_at'])
        rep['category'] = instance.category.category
        rep['category_id'] = instance.category.id
        return rep

class ToDoCategorySerializer(serializers.ModelSerializer):
    class Meta:
        fields = ('id', 'author', 'category', 'created_at', 'updated_at')
        read_only_fields = ('author',)
        model = ToDoCategory


    def save(self, **kwargs):
        return super(ToDoCategorySerializer, self).save(author=self.context['request'].user)


    def to_representation(self, instance):
        rep = super(ToDoCategorySerializer, self).to_representation(instance)
        rep['created_at'] = giveMeDateTime(rep['created_at'])
        rep['updated_at'] = giveMeDateTime(rep['updated_at'])
        rep['author'] = instance.author.name
        return rep