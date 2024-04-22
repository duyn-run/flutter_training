import 'package:flutter/material.dart';
import 'dart:math';
import 'package:todo_app_training/models/task.dart';

class EditItem extends StatefulWidget {
  const EditItem({super.key, required this.onCompleteEditItem, required this.editItem, required this.idx});

  final Task editItem;
  final int idx;
  final void Function(Task editItem, int idx) onCompleteEditItem;

  @override
  State<EditItem> createState() {
    return _EditItemState();
  }
}

class _EditItemState extends State<EditItem> {

  final _titleController = TextEditingController();
  final _subTitleController = TextEditingController();

  

  void _submitEditTask() {
    Random random = Random();
    int randomNumber1 = random.nextInt(50); // Giá trị nằm trong khoảng từ 0 đến 49.

      final Task itemTask = Task(id: randomNumber1.toString(),
          subtext: _subTitleController.text,
          title: _titleController.text,
          date: DateTime.now()
          );
      widget.onCompleteEditItem(itemTask, widget.idx);

      _titleController.dispose();
      _subTitleController.dispose();

      Navigator.pop(context);
  }

  @override
  // void dispose() {
    
  //   _titleController.dispose();
  //   _titleController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.editItem.title;
    _subTitleController.text = widget.editItem.subtext;
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
                  _submitEditTask();
                },
                child: const Text('EDIT'),
                style: ElevatedButton.styleFrom(
                ),
              ),
            ],
          ),
        );
  }
}
