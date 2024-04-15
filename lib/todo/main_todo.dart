import 'package:flutter/material.dart';
import 'package:todo_app_training/todo/list_todo.dart';
import 'package:todo_app_training/models/task.dart';

class MainTodo extends StatefulWidget {
  const MainTodo({super.key});

  @override
  State<MainTodo> createState() {
    return _MainTodo();
  }
}

class _MainTodo extends State<MainTodo> {

  final List<Task> listToDo = [
    Task(id: '001', title: 'training flutter', subtext: 'training', date: DateTime.now()),
    Task(id: '002', title: 'handle todo app', subtext: 'task', date: DateTime.now()),
    Task(id: '003', title: 'training Widget', subtext: 'training', date: DateTime.now()),
    Task(id: '004', title: 'training HTMl', subtext: 'task', date: DateTime.now()),
    Task(id: '005', title: 'training CSS', subtext: 'training', date: DateTime.now()),
    Task(id: '006', title: 'training Javascript', subtext: 'training', date: DateTime.now()),
    Task(id: '007', title: 'training VUE', subtext: 'training', date: DateTime.now()),
    Task(id: '008', title: 'training dummy 1', subtext: 'training', date: DateTime.now()),
    Task(id: '009', title: 'training dummy 2', subtext: 'training', date: DateTime.now()),
    Task(id: '010', title: 'training dummy 3', subtext: 'training', date: DateTime.now()),
  
  ];

  @override
  Widget build(BuildContext context) {
    return ListToDo(listToDo: listToDo);
  }
}