// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures, avoid_print

import 'package:app/components/delete_dialog.dart';
import 'package:app/components/todo_item_tile.dart';
import 'package:app/constants.dart';
import 'package:app/models/auth.dart';
import 'package:app/models/theme.dart';
import 'package:app/models/todo.dart';
import 'package:app/models/todo_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../components/add_new_todo.dart';

class ItemsScreen extends StatefulWidget {
  final Category category;
  ItemsScreen({required this.category});
  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  bool isVisible = true;
  late String title;
  void setVariable() {
    print('item screen');
    print(widget.category);
    title = widget.category.category;
  }

  @override
  void initState() {
    setVariable();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<TodoItem> items = Provider.of<ToDo>(context)
        .getItemListForCategory(widget.category.id.toString());
    return Scaffold(
      backgroundColor: Provider.of<CustomTheme>(context, listen: false).isTheme
          ? kbgcolor
          : Colors.white,
      floatingActionButton: isVisible
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: BottomModalSheetTodo(
                        title: 'Add Item',
                        buttonText: 'Add',
                        isCategory: false,
                        catId: widget.category.id,
                      ),
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.add,
                color: kbgcolor,
                size: 30,
              ),
            )
          : null,
      appBar: AppBar(
        backgroundColor:
            Provider.of<CustomTheme>(context, listen: false).isTheme
                ? kbgcolor
                : Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            String key = Provider.of<Auth>(context, listen: false).key;
            Provider.of<ToDo>(context, listen: false).updateCategory(
              key,
              title,
              widget.category.id,
            );
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Provider.of<CustomTheme>(context, listen: false).isTheme
                ? kyellow
                : kpink,
            size: 35,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteDialog(
                      boxTitle: 'Do you want to delete this category?',
                      buttonTitle: 'Delete',
                      toDelete: 2,
                      catID: widget.category.id,
                      itemId: '',
                    );
                  });
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.category.category,
              textAlign: TextAlign.center,
              onChanged: (value) {
                title = value;
              },
              maxLines: 1,
              style: TextStyle(
                color: Provider.of<CustomTheme>(context, listen: false).isTheme
                    ? Colors.white
                    : Colors.black,
                fontSize: 30,
              ),
              decoration: InputDecoration(
                hintText: 'Category Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                hintStyle: TextStyle(
                  fontSize: 25,
                  color:
                      Provider.of<CustomTheme>(context, listen: false).isTheme
                          ? Colors.grey
                          : Colors.black54,
                ),
              ),
              onFieldSubmitted: (value) {
                String key = Provider.of<Auth>(context, listen: false).key;
                Provider.of<ToDo>(context, listen: false).updateCategory(
                  key,
                  title,
                  widget.category.id,
                );
              },
            ),
            NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                if (notification.direction == ScrollDirection.forward) {
                  if (!isVisible)
                    setState(() {
                      isVisible = true;
                    });
                } else if (notification.direction == ScrollDirection.reverse) {
                  if (isVisible)
                    setState(() {
                      isVisible = false;
                    });
                }
                return true;
              },
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: (items.isNotEmpty)
                      ? ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return TodoItemListTile(
                                isChecked: items[index].isDone,
                                taskTitle: items[index].item);
                          },
                        )
                      : Text(
                          'No items yet',
                          style: TextStyle(
                            color: Provider.of<CustomTheme>(context).isTheme
                                ? kNoteBody
                                : Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
