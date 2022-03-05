import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/todo_provider.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({Key? key, required this.todo}) : super(key: key);

  final List todo;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: todo.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Dismissible(
                key: UniqueKey(),
                secondaryBackground: Container(
                  padding: const EdgeInsets.only(right: 20),
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: Text(
                    "delete",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                onDismissed: (DismissDirection direction) {
                  if (direction == DismissDirection.endToStart) {
                    provider.deleteTodo(todo[index]);
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: const Text(" Task Deleted"),
                        action: SnackBarAction(label: "Undo", onPressed: () {}),
                      ),
                    );
                  }
                },
                background: Container(),
                child: Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {
                        if (todo[index].isDone == false) {
                          todo[index].isDone = true;
                          provider.updateTodo(todo[index]);
                        } else if (todo[index].isDone) {
                          todo[index].isDone = false;
                          provider.updateTodo(todo[index]);
                        }
                      },
                      icon: todo[index].isDone
                          ? const Icon(Icons.check_box)
                          : const Icon(Icons.check_box_outline_blank),
                    ),
                    title: Text(todo[index].title),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
