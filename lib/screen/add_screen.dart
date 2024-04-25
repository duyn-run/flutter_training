import 'package:flutter/material.dart';
import 'dart:math';
import 'package:todo_app_training/models/task.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key, required this.onAddItem});

  final void Function(Task newItem) onAddItem;

 @override
  State<AddScreen> createState() {
    return _AddScreenState();
  } 

}

class _AddScreenState extends State<AddScreen> {


  final _titleController = TextEditingController();
  final _subTitleController = TextEditingController();

  void _submitAddTask() {
    Random random = Random();
    int randomNumber1 = random.nextInt(50); // Giá trị nằm trong khoảng từ 0 đến 49.

      final Task itemTask = Task(id: randomNumber1.toString(),
          subtext: _subTitleController.text,
          title: _titleController.text,
          date: DateTime.now(),
          isCheck: false,
          );
      widget.onAddItem(itemTask);
      Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _titleController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Text',
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
              ElevatedButton(
                onPressed: () {
                  _submitAddTask();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 40), // Set your desired width and height
                  backgroundColor: const Color.fromRGBO(147, 149, 211, 1),
                ),
                child: const Text('ADD', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),),),
              ),
            ],
          ),
        )
      ),
    );
  }
}
