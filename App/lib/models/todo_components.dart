class Category {
  String id;
  String category;
  String createdAt;
  String updatedAt;
  Category({
    required this.id,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });
}

class TodoItem {
  String id;
  String item;
  String categoryName;
  bool isDone;
  String createdAt;
  String updatedAt;
  String categoryId;
  TodoItem({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.createdAt,
    required this.isDone,
    required this.item,
    required this.updatedAt,
  });
}
