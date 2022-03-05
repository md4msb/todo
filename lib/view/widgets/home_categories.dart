import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/todo_provider.dart';

// ignore: must_be_immutable
class HomeCategories extends StatelessWidget {
  HomeCategories({Key? key}) : super(key: key);

  double business = 0;
  double personal = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 25,
            bottom: 25,
          ),
          child: Text(
            "CATEGORIES",
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 153, 153, 153)),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Consumer<TodoProvider>(builder: (context, value, child) {
            List todo = value.getTodo();

            for (var element in todo) {
              if (element.type == "Business") {
                business++;
              } else {
                personal++;
              }
            }
            return Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                categoryCard(
                  context,
                  title: "Buisiness",
                  count: business,
                  color: Colors.pink,
                ),
                categoryCard(
                  context,
                  title: "Personal",
                  count: personal,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            );
          }),
        )
      ],
    );
  }

  Padding categoryCard(BuildContext context, {title, count, color}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 5),
      child: Container(
        padding: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height / 7,
        width: MediaQuery.of(context).size.width / 2,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              "$count Tasks",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w600,
                color: const Color(0xFFCACACA),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 18),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 3.5,
              color: Colors.blueGrey[50],
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 4,
                  width: count * 3,
                  color: color,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
