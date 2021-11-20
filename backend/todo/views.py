from .models import ToDoCategory, ToDoItem
from .permissions import IsAuthor
from .serializers import ToDoItemSerializer, ToDoCategorySerializer

from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated


class ToDoCategoryView(APIView):
    permission_classes = (IsAuthor, IsAuthenticated)
    serializer_class = ToDoCategorySerializer

    def get(self, request):
        # get all categories of author
        categories = ToDoCategory.objects.filter(author=request.user)
        serializer = ToDoCategorySerializer(categories, many=True)
        return Response(serializer.data)

    def post(self, request):
        # create new category
        category_name = request.data["category"]
        category = ToDoCategory(category=category_name, author=request.user)
        category.save()
        serializer = ToDoCategorySerializer(category)
        return Response(serializer.data)

    def put(self, request):
        # update category
        category = ToDoCategory.objects.get(id=request.data["cat_id"])
        category.category = request.data["category"]
        category.save()
        serializer = ToDoCategorySerializer(category)
        return Response(serializer.data)

    def delete(self, request):
        # delete category
        try:
            category = ToDoCategory.objects.get(
                author=request.user, id=request.data["cat_id"]
            )
            if category is not None:
                # delete all items of category
                items = ToDoItem.objects.filter(category=category)
                items.delete()
                # delete category
                category.delete()
                print("here")
                return Response({"message": "Successfully Deleted"})
            else:
                return Response({"message": "Category not found"}, status=404)
        except:
            return Response({"message": "Error"})


# list all to do items in todo category
class ToDoItemView(APIView):
    permission_classes = (IsAuthor, IsAuthenticated)
    serializer_class = ToDoItemSerializer

    def get(self, request):
        todo_items = ToDoItem.objects.filter(category__author=request.user)
        serializer = ToDoItemSerializer(todo_items, many=True)
        return Response(serializer.data)

    def post(self, request):
        category_id = request.data["cat_id"]
        if not ToDoCategory.objects.filter(
            author=request.user, id=category_id
        ).exists():
            return Response({"message": "Category not found"}, status=404)

        # check if is_done given if not then default false
        isDone = False
        if "is_done" in request.data:
            isDone = request.data["is_done"]
        todo_item = ToDoItem.objects.create(
            category_id=category_id, item=request.data["item"], isDone=isDone
        )
        todo_item.save()

        serializer = ToDoItemSerializer(todo_item)
        return Response(serializer.data)

    def put(self, request):
        todo_item = request.data["todo_item_id"]

        if not ToDoItem.objects.filter(
            category__author=request.user, id=todo_item
        ).exists():
            return Response({"message": "Todo item not found"}, status=404)

        todo_item = ToDoItem.objects.get(category__author=request.user, id=todo_item)
        if "item" in request.data:
            todo_item.item = request.data["item"]
        if "is_done" in request.data:
            todo_item.isDone = request.data["is_done"]

        todo_item.save()
        serializer = ToDoItemSerializer(todo_item)
        return Response(serializer.data)

    def delete(self, request):
        if not ToDoItem.objects.filter(id=request.data["todo_item_id"]).exists():
            return Response({"message": "Todo item not found"}, status=404)

        todo_item = request.data["todo_item_id"]
        try:
            todo_item = ToDoItem.objects.get(
                category__author=request.user, id=todo_item
            )
            todo_item.delete()
            return Response({"message": "successfully deleted"})
        except:
            return Response({"message": "Error"}, status=400)


class ToDoItemByCategory(APIView):
    permission_classes = (IsAuthor, IsAuthenticated)
    serializer_class = ToDoItemSerializer

    def get(self, request, cat):
        if not ToDoCategory.objects.filter(author=request.user, id=cat).exists():
            return Response({"message": "Category not found"}, status=404)

        todo_items = ToDoItem.objects.filter(
            category__author=request.user, category__id=cat
        )
        serializer = ToDoItemSerializer(todo_items, many=True)
        return Response(serializer.data)
