import 'package:flutter/material.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "TODO APP",
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: IconButton(
            icon: const Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
        )
      ],
      backgroundColor: const Color.fromRGBO(
          147, 149, 211, 1), // Set the background color of the app bar
      // Add any other app bar properties (e.g., actions, leading icon)
    );
  }
}
