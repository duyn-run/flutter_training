import 'package:flutter/material.dart';
import 'package:todo_app_training/todo/main_todo.dart';

void main() {
  runApp(const MainApp());
}




class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() {
    return _MainAppState();
  }
}
int _indexNavBar = 0;
String _titleApp = "TODO APP";



class _MainAppState extends State<MainApp> {
  void _changeTitleApp (type) {
  if(type == 'Add') {
    setState(() {
      _titleApp = "Add Task";
    });
  } else if(type == 'Edit') {
    setState(() {
      _titleApp = "Edit Task";
    });
  } else if(type == 'complete') {
    setState(() {
      _titleApp = "Completed Task";
    });
  } else {
    setState(() {
      _titleApp = "TODO APP";
    });
  }
}

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            _titleApp,
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
          child: MainTodo(indexNavBar: _indexNavBar, changeTitleApp: _changeTitleApp),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indexNavBar, // Set the current index
          onTap: (int value) {
            setState(() {
              _indexNavBar = value; // Update the selected index
              if(value == 0) {
                _changeTitleApp ('');
              } else {
                _changeTitleApp ('complete');
              }
            });
          },
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
