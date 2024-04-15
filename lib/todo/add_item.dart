import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return const Text('new data');
  }
}