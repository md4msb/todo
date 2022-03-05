import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/todo_provider.dart';

// ignore: must_be_immutable
class AddTodo extends StatelessWidget {
  AddTodo({Key? key}) : super(key: key);

  String? title;
  String type = "Business";
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final provider = Provider.of<TodoProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height / 3,
            ),
            TextFormField(
              onChanged: (value) {
                if (value != "") {}
                title = value;
              },
              cursorHeight: 24,
              cursorWidth: 2.5,
              autofocus: true,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                hintText: "Enter New Task",
                hintStyle: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 145, 145, 145),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Radio(
                value: "Business",
                groupValue: type,
                onChanged: (value) {
                  type = value.toString();
                  provider.updateScreen();
                },
              ),
              title: Text(
                "Business",
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: const Color.fromARGB(255, 153, 153, 153)),
              ),
            ),
            ListTile(
              leading: Radio(
                value: "Personal",
                groupValue: type,
                onChanged: (value) {
                  type = value.toString();
                  provider.updateScreen();
                },
              ),
              title: Text(
                "Personal",
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: const Color.fromARGB(255, 153, 153, 153)),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (title != null && title != "") {
                        provider.addTodo(title!, type, isDone);
                        
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue[600],
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: Text(
                          "Add Task",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
