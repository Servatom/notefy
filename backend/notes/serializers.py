from rest_framework import serializers
from .models import Note

def giveMeDateTime(date_time):
    split_date = date_time.split("T")

    return (split_date[0] + " " + split_date[1].split(":")[0] + ":" + split_date[1].split(":")[1])

class NoteSerializer(serializers.ModelSerializer):
    class Meta:
        fields = ('id', 'author', 'title', 'body', 'created_at', 'updated_at')
        read_only_fields = ('author',)
        model = Note


    def save(self, **kwargs):
        return super(NoteSerializer, self).save(author=self.context['request'].user)


    def to_representation(self, instance):
        rep = super(NoteSerializer, self).to_representation(instance)
        rep['created_at'] = giveMeDateTime(rep['created_at'])
        rep['updated_at'] = giveMeDateTime(rep['updated_at'])
        rep['author'] = instance.author.name
        return rep