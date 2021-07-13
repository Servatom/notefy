from django.urls import path
from .views import NoteList, NoteCreate, NoteDetail

urlpatterns = [
    path('<int:pk>/', NoteDetail.as_view()),
    path('', NoteList),
    path('create/', NoteCreate)
]