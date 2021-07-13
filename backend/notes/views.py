from rest_framework import generics
from .models import Note
from .serializers import NoteSerializer


from rest_framework.permissions import IsAuthenticated
from .permissions import IsAuthor

class NoteList(generics.ListAPIView):
    permission_classes = (IsAuthor, IsAuthenticated)
    serializer_class = NoteSerializer
    def get_queryset(self):
        return Note.objects.filter(author__id=self.request.user.id)

class NoteCreate(generics.CreateAPIView):
    permission_classes = (IsAuthor, IsAuthenticated)
    serializer_class = NoteSerializer

class NoteDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthor, IsAuthenticated)
    queryset = Note.objects.all()
    serializer_class = NoteSerializer
