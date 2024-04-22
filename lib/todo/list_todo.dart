import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app_training/models/task.dart';
import 'package:todo_app_training/todo/item.dart';

class ListToDo extends StatelessWidget {
  const ListToDo({
    super.key,
    required this.listToDo,
    required this.onEditTask,
    required this.onRemoveTask,
  });
  final List<Task> listToDo;
  final void Function(Task task, int idx) onEditTask;
  final void Function(int idx) onRemoveTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listToDo.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Item(task: listToDo[index], onRemoveTask: onRemoveTask, onEditTask: onEditTask, idx: index),
                ),
              ),
            ),
          );
        });
  }
}
