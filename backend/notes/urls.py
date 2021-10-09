from django.urls import path
from .views import NoteList, NoteCreate, NoteDetail

urlpatterns = [
    path("", NoteList.as_view(), name="note-list"),
    path("<int:pk>/", NoteDetail.as_view(), name="note-detail"),
    path("create/", NoteCreate.as_view(), name="note-create"),
]
