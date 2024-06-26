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
      required this.onUpdateCheck,
      required this.idx,
      required this.indexNavBar});
  final Task task;
  final void Function(Task task, int idx) onEditTask;
  final void Function(int idx) onRemoveTask;
  final void Function(int idx) onUpdateCheck;
  final int idx;
  final int indexNavBar;

  @override
  State<Item> createState() {
    return _ItemState();
  }
}
class _ItemState extends State<Item> {
  /// handle edit
  _editTask() {
    widget.onEditTask(widget.task, widget.idx);
  }

  /// handle delete task
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

  /// handle update checked task
  _checkedTask() {
    widget.onUpdateCheck(widget.idx);
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
        widget.indexNavBar == 0 ?
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
            child: widget.task.isCheck == true ? IconButton(
              onPressed: () {_checkedTask();},
              icon: const Icon(Icons.check_circle_outline),
            ) : IconButton(
              onPressed: () {_checkedTask();},
              icon: const Icon(Icons.circle_outlined),
            ),
          ),
        ]) : const SizedBox(),
      ],
    );
  }
}


  