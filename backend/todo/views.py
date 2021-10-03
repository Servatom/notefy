from rest_framework import generics
from .models import Todo
from .serializers import TodoSerializer


from rest_framework.permissions import IsAuthenticated
from .permissions import IsAuthor

class ToDoList(generics.ListAPIView):
    permission_classes = (IsAuthor, IsAuthenticated)
    serializer_class = TodoSerializer
    def get_queryset(self):
        return Todo.objects.filter(author__id=self.request.user.id)

class ToDoCreate(generics.CreateAPIView):
    permission_classes = (IsAuthor, IsAuthenticated)
    serializer_class = TodoSerializer

class ToDoDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthor, IsAuthenticated)
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer
