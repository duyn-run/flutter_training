import 'package:flutter/material.dart';
import 'package:todo_app_training/todo/main_todo.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
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
        ),
        body: Container(
          color: const Color.fromRGBO(214, 215, 239, 1),
          child: const MainTodo(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "All",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: "Complete",
            ),
          ],
        ),
      ),
    );
  }
}
