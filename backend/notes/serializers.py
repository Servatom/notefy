from rest_framework import serializers
from .models import Note

class NoteSerializer(serializers.ModelSerializer):
    class Meta:
        fields = ('id', 'author', 'title', 'body', 'created_at', 'updated_at')
        read_only_fields = ('author',)
        model = Note


    def save(self, **kwargs):
        return super(NoteSerializer, self).save(author=self.context['request'].user)


    def to_representation(self, instance):
        rep = super(NoteSerializer, self).to_representation(instance)
        rep['author'] = instance.author.name
        return rep