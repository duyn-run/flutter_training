import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app_training/models/task.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Row(
    
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: const TextStyle(
                color: Color.fromRGBO(147, 149, 211, 1),
              ),
            ),
            Text(
              task.subtext,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        const Spacer(),
        Row(mainAxisSize: MainAxisSize.max, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.edit),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.delete),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.check),
            ),
          ),
        ]),
      ],
    );
  }
}
