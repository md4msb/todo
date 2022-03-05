import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/model/todo_model.dart';
import '../db/boxes.dart';

class TodoProvider with ChangeNotifier {
  Box<TodoModel> box = Boxes.getInstance();

  addTodo(String title, String type, bool isDone) async {
    box.add(
      TodoModel(title, type, isDone),
    );
    notifyListeners();
  }

  List getTodo() {
    List todos = box.values.toList();
    return todos;
  }

  deleteTodo(TodoModel todo) {
    todo.delete();
    notifyListeners();
  }

  updateTodo(TodoModel todo) {
    todo.save();
    notifyListeners();
  }

  updateScreen() {
    notifyListeners();
  }
}
