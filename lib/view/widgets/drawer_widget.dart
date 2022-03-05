import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/view/widgets/drawer_items.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("assets/images/hero.jpg"),
              maxRadius: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Joy \nMitchell",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            buildDrawerItems()
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItems() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: DrawerItems.allItems
            .map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      item.icon,
                      color: const Color.fromARGB(255, 128, 151, 163),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      item.title,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFd5dcf3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      );
}
