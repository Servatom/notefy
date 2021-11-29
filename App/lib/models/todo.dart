// ignore_for_file: avoid_print, prefer_final_fields

import 'package:app/models/todo_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ToDo with ChangeNotifier {
  List<Category> _categories = [];
  List<TodoItem> _items = [];

  List<Category> getCateList() {
    print(_categories);
    return [..._categories];
  }

  List<TodoItem> getItemListForCategory(String catID) {
    print('getting the list of all items in the todo list');
    List<TodoItem> items =
        _items.where((element) => element.categoryId == catID).toList();
    return items;
  }

  Future createCategory(String key, String categoryName) async {
    try {
      print('creating new category');
      http.Response response = await http.post(
        Uri.parse('https://notefyapi.servatom.com/api/todo/category/'),
        headers: {'Authorization': 'Token $key'},
        body: {"category": categoryName},
      );
      final data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        _categories.add(
          Category(
            id: data["id"].toString(),
            category: data["category"],
            createdAt: data["created_at"],
            updatedAt: data["updated_at"],
          ),
        );
        notifyListeners();
      } else {
        throw 'Error in creating a category';
      }
    } catch (e) {
      print(e);
    }
  }

  Future getCategoriesList(String key) async {
    try {
      print('getting list of categories');
      http.Response response = await http.get(
        Uri.parse('https://notefyapi.servatom.com/api/todo/category/'),
        headers: {'Authorization': 'Token $key'},
      );
      final data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        List tempCategories = data;
        for (int i = 0; i < tempCategories.length; i++) {
          _categories.add(
            Category(
              id: tempCategories[i]["id"].toString(),
              category: tempCategories[i]["category"],
              createdAt: tempCategories[i]["created_at"],
              updatedAt: tempCategories[i]["updated_at"],
            ),
          );
        }
        notifyListeners();
      } else {
        throw 'Error in getting list of categories';
      }
    } catch (e) {
      print(e);
    }
  }

  Future updateCategory(String key, String newName, String catId) async {
    try {
      print('updating a category');
      http.Response response = await http.put(
        Uri.parse('https://notefyapi.servatom.com/api/todo/category/'),
        headers: {'Authorization': 'Token $key'},
        body: {"cat_id": catId, "category": newName},
      );
      final data = jsonDecode(response.body);
      print(data);
      int index = _categories.indexWhere((element) => element.id == catId);
      if (response.statusCode == 200) {
        _categories[index].updatedAt = data["updated_at"];
        _categories[index].category = data["category"];
        notifyListeners();
      } else {
        throw "Error in update category";
      }
    } catch (e) {
      print(e);
    }
  }

  Future deleteCategory(String key, String catId) async {
    try {
      print('deleting category');
      http.Response response = await http.delete(
        Uri.parse('https://notefyapi.servatom.com/api/todo/category/'),
        headers: {'Authorization': 'Token $key'},
        body: {"cat_id": catId},
      );
      if (response.statusCode == 200) {
        print('delete succesfully');
        int index = _categories.indexWhere((element) => element.id == catId);
        _categories.remove(_categories[index]);
        notifyListeners();
      } else {
        throw 'Error in deleting note';
      }
    } catch (e) {
      print(e);
    }
  }

  Future createItem(String key, String catId, String item) async {
    try {
      print('creating new item = $catId = $item');
      http.Response response = await http.post(
        Uri.parse('https://notefyapi.servatom.com/api/todo/item/'),
        headers: {'Authorization': 'Token $key'},
        body: {"cat_id": catId, "item": item},
      );
      final data = jsonDecode(response.body);
      print('data = $data');
      if (response.statusCode == 200) {
        _items.add(
          TodoItem(
            id: data["id"].toString(),
            categoryId: data["category_id"].toString(),
            categoryName: data["category"],
            createdAt: data["created_at"],
            isDone: data["isDone"],
            item: data["item"],
            updatedAt: data["updated_at"],
          ),
        );
        print('addition succesful');
        notifyListeners();
      } else {
        throw 'Error in creating a new item';
      }
    } catch (e) {
      print(e);
    }
  }

  Future listAllTodoItems(String key) async {
    try {
      print('getting all the items as a list');
      http.Response response = await http.get(
        Uri.parse('https://notefyapi.servatom.com/api/todo/item/'),
        headers: {'Authorization': 'Token $key'},
      );
      final data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        List tempItems = data;
        for (int i = 0; i < tempItems.length; i++) {
          _items.add(
            TodoItem(
              id: tempItems[i]["id"].toString(),
              categoryId: tempItems[i]["category_id"].toString(),
              categoryName: tempItems[i]["category"],
              createdAt: tempItems[i]["created_at"],
              isDone: tempItems[i]["isDone"],
              item: tempItems[i]["item"],
              updatedAt: tempItems[i]["updated_at"],
            ),
          );
        }
        print('listing all the items');
        notifyListeners();
      } else {
        throw 'Error in getting the list of all items';
      }
    } catch (e) {
      print(e);
    }
  }

  Future updateToDoItem(
      String key, String itemId, bool isDone, String item) async {
    try {
      print('updating an item');
      http.Response response = await http.put(
        Uri.parse('https://notefyapi.servatom.com/api/todo/item/'),
        headers: {'Authorization': 'Token $key'},
        body: {"todo_item_id": itemId, "is_done": isDone, "item": item},
      );
      final data = jsonDecode(response.body);
      print(data);
      int index = _items.indexWhere((element) => element.id == itemId);
      if (response.statusCode == 200) {
        _items[index].item = data["item"];
        _items[index].isDone = data["isDone"];
        _items[index].updatedAt = data["updated_at"];
        notifyListeners();
      } else {
        throw 'error in updating item';
      }
    } catch (e) {
      print(e);
    }
  }

  Future deleteToDoItem(String key, String itemId) async {
    try {
      print('deleting an item');
      http.Response response = await http.delete(
        Uri.parse('https://notefyapi.servatom.com/api/todo/item/'),
        headers: {'Authorization': 'Token $key'},
        body: {"todo_item_id": itemId},
      );
      final data = jsonDecode(response.body);
      print(data);
      int index = _items.indexWhere((element) => element.id == itemId);
      if (response.statusCode == 200) {
        print('deleted succesfully');
        _items.remove(_items[index]);
        notifyListeners();
      } else {
        throw 'error in deleting item';
      }
    } catch (e) {
      print(e);
    }
  }

  void clearList() {
    _categories = [];
    _items = [];
  }
}
