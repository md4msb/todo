import 'package:hive/hive.dart';
import 'package:todo/model/todo_model.dart';


class Boxes {
  static Box<TodoModel> getInstance() => 
    Hive.box<TodoModel>('todo');
}