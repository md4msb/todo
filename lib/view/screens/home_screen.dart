import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/todo_provider.dart';
import 'package:todo/view/screens/add_todo_screen.dart';
import 'package:todo/view/widgets/home_categories.dart';
import '../widgets/drawer_menu_widget.dart';
import '../widgets/todo_card.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback openDrawer;

  const HomeScreen({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 252, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 252, 255),
        elevation: 0,
        leading: DrawerMenuWidget(
          onClicked: openDrawer,
        ),
        actionsIconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              openDrawer;
            },
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                "What's up, Joy!",
                style: GoogleFonts.roboto(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
             HomeCategories(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                "TODAY'S TASK",
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 153, 153, 153)),
              ),
            ),
            Consumer<TodoProvider>(
              builder: (context, value, child) {
                List todo = value.getTodo();
                if (todo.isNotEmpty) {
                  return TodoCard(todo: todo);
                }
                return const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Text(
                    "No Task found",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 38, 60, 230),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTodo()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
