import 'package:flutter/material.dart';
import 'package:todo_app_training/todo/list_todo.dart';
import 'package:todo_app_training/todo/add_item.dart';
import 'package:todo_app_training/todo/edit_item.dart';
import 'package:todo_app_training/models/task.dart';


class MainTodo extends StatefulWidget {
  const MainTodo({super.key, required this.changeStateAppBar});

  final void Function(String changeState) changeStateAppBar;


  @override
  State<MainTodo> createState() {
    return _MainTodo();
  }
}

class _MainTodo extends State<MainTodo> {
  List<Task> listToDo = [
    Task(
        id: '001',
        title: 'training flutter',
        subtext: 'training',
        date: DateTime.now()),
    Task(
        id: '002',
        title: 'handle todo app',
        subtext: 'task',
        date: DateTime.now()),
    Task(
        id: '003',
        title: 'training Widget',
        subtext: 'training',
        date: DateTime.now()),
    Task(
        id: '004',
        title: 'training HTMl',
        subtext: 'task',
        date: DateTime.now()),
    Task(
        id: '005',
        title: 'training CSS',
        subtext: 'training',
        date: DateTime.now()),
    Task(
        id: '006',
        title: 'training Javascript',
        subtext: 'training',
        date: DateTime.now()),
    Task(
        id: '007',
        title: 'training VUE',
        subtext: 'training',
        date: DateTime.now()),
    Task(
        id: '008',
        title: 'training dummy 1',
        subtext: 'training',
        date: DateTime.now()),
    Task(
        id: '009',
        title: 'training dummy 2',
        subtext: 'training',
        date: DateTime.now()),
    Task(
        id: '010',
        title: 'training dummy 3',
        subtext: 'training',
        date: DateTime.now()),
  ];



  void _openAddIemTodo() {
    
    showBottomSheet(
      context: context,
      builder: (ctx) => NewItem(
        onAddItem: _addItem,
      ),
    );
  }

  void _addItem(Task itemTask) {
    setState(() {
      listToDo.add(itemTask);
    });
  }
  void _completeEditItem(Task completeEditItem, int idx) {
    setState(() {

      listToDo[idx] = completeEditItem;

      // _listToDo.add(itemTask);
    });
  }

  void _removeItem(idx) {
    setState(() {
      listToDo.removeAt(idx);
    });
  }

  void _editItem(Task itemTask, int idx) {
    showBottomSheet(
      context: context,
      builder: (ctx) => EditItem(
        onCompleteEditItem: _completeEditItem,
        editItem: itemTask,
        idx: idx,
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ListToDo(listToDo: listToDo,onEditTask: _editItem, onRemoveTask: _removeItem,),
      Positioned(
          right: 20.0,
          bottom: 10.0,
          child: Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(147, 149, 211, 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: IconButton( 
                onPressed: _openAddIemTodo,
                icon: const Icon(Icons.add, color: Colors.white),
                
              ),
            ),
          )),
    ]);
    // return ListToDo(listToDo: listToDo);
  }
}
