import 'package:flutter/material.dart';
import 'dart:math';
import 'package:todo_app_training/models/task.dart';

class EditScreen extends StatefulWidget {
  const EditScreen(
      {super.key,
      required this.onCompleteEditItem,
      required this.editItem,
      required this.idx});

  final Task editItem;
  final int idx;
  final void Function(Task editItem, int idx) onCompleteEditItem;
  @override
  State<EditScreen> createState() {
    return _EditScreenState();
  }
}

class _EditScreenState extends State<EditScreen> {
  final _titleController = TextEditingController();
  final _subTitleController = TextEditingController();

  void _submitEditTask() {
    Random random = Random();
    int randomNumber1 =
        random.nextInt(50); // Giá trị nằm trong khoảng từ 0 đến 49.

    final Task itemTask = Task(
      id: randomNumber1.toString(),
      subtext: _subTitleController.text,
      title: _titleController.text,
      date: DateTime.now(),
      isCheck: false,
    );
    widget.onCompleteEditItem(itemTask, widget.idx);

    _titleController.dispose();
    _subTitleController.dispose();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double desiredWidth = screenWidth * 0.3; // 50% width

    _titleController.text = widget.editItem.title;
    _subTitleController.text = widget.editItem.subtext;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Text',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),

        backgroundColor: const Color.fromRGBO(
            147, 149, 211, 1), // Set the background color of the app bar
        // Add any other app bar properties (e.g., actions, leading icon)
      ),
      body: Container(
        color: const Color.fromRGBO(214, 215, 239, 1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _subTitleController,
                decoration: const InputDecoration(
                  labelText: 'Detail',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _submitEditTask();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(desiredWidth,
                          40), // Set your desired width and height
                      backgroundColor: const Color.fromRGBO(147, 149, 211, 1),
                    ),
                    child: const Text(
                      'Update',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the bottom sheet
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(desiredWidth,
                          40), // Set your desired width and height
                      backgroundColor: const Color.fromRGBO(147, 149, 211, 1),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
