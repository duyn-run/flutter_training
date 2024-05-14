import 'package:flutter/material.dart';
import 'dart:math';
import 'package:todo_app_training/models/task.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key, required this.onAddItem});

  final void Function(Task newItem) onAddItem;

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {

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
    return Padding(
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
        );
  }
}
