import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app_training/models/task.dart';

class Item extends StatefulWidget {
  const Item(
      {super.key,
      required this.task,
      required this.onEditTask,
      required this.onRemoveTask,
      required this.idx});
  final Task task;
  final void Function(Task task, int idx) onEditTask;
  final void Function(int idx) onRemoveTask;
  final int idx;

  @override
  State<Item> createState() {
    return _ItemState();
  }
}
class _ItemState extends State<Item> {
  _editTask() {
    widget.onEditTask(widget.task, widget.idx);
  }
  _deleteTask() {

    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Are you sure you want to delete the selected task?'),
          actions: [
            TextButton(
              onPressed: () {
                widget.onRemoveTask(widget.idx);
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );






    
  }

  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.task.title,
              style: const TextStyle(
                color: Color.fromRGBO(147, 149, 211, 1),
              ),
            ),
            Text(
              widget.task.subtext,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        const Spacer(),
        Row(mainAxisSize: MainAxisSize.max, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {_editTask();},
              icon: const Icon(Icons.edit),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {_deleteTask();},
              icon: const Icon(Icons.delete),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.check),
            ),
          ),
        ]),
      ],
    );
  }
}


  