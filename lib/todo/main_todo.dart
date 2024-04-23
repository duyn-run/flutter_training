import 'package:flutter/material.dart';
import 'package:todo_app_training/todo/list_todo.dart';
import 'package:todo_app_training/todo/list_todo_complete.dart';
import 'package:todo_app_training/todo/add_item.dart';
import 'package:todo_app_training/todo/edit_item.dart';
import 'package:todo_app_training/models/task.dart';

class MainTodo extends StatefulWidget {
  const MainTodo(
      {super.key, required this.indexNavBar, required this.changeTitleApp});

  final int indexNavBar;
  final void Function(String flag) changeTitleApp;

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
      date: DateTime.now(),
      isCheck: false,
    ),
    Task(
      id: '002',
      title: 'handle todo app',
      subtext: 'task',
      date: DateTime.now(),
      isCheck: false,
    ),
    Task(
      id: '003',
      title: 'training Widget',
      subtext: 'training',
      date: DateTime.now(),
      isCheck: false,
    ),
    Task(
      id: '004',
      title: 'training HTMl',
      subtext: 'task',
      date: DateTime.now(),
      isCheck: true,
    ),
    Task(
      id: '005',
      title: 'training CSS',
      subtext: 'training',
      date: DateTime.now(),
      isCheck: true,
    ),
    Task(
      id: '006',
      title: 'training Javascript',
      subtext: 'training',
      date: DateTime.now(),
      isCheck: true,
    ),
    Task(
      id: '007',
      title: 'training VUE',
      subtext: 'training',
      date: DateTime.now(),
      isCheck: true,
    ),
    Task(
      id: '008',
      title: 'training dummy 1',
      subtext: 'training',
      date: DateTime.now(),
      isCheck: true,
    ),
    Task(
      id: '009',
      title: 'training dummy 2',
      subtext: 'training',
      date: DateTime.now(),
      isCheck: true,
    ),
    Task(
      id: '010',
      title: 'training dummy 3',
      subtext: 'training',
      date: DateTime.now(),
      isCheck: true,
    ),
  ];

  /// handle open modal add item
  void _openAddItemTodo() {
    widget.changeTitleApp('Add');
    showBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          width: MediaQuery.of(context)
              .size
              .width, // Set the width to the screen width
          child: NewItem(
            onAddItem: _addItem,
          ), // Replace with your desired content
        );
      },
    ).closed.then((value) {
      widget.changeTitleApp('');
    });
  }

  /// handle add item into list task when submit
  void _addItem(Task itemTask) {
    setState(() {
      listToDo.add(itemTask);
    });
  }

  /// handle complete edit item
  void _completeEditItem(Task completeEditItem, int idx) {
    setState(() {
      listToDo[idx] = completeEditItem;

      // _listToDo.add(itemTask);
    });
  }

  /// handle remove item
  void _removeItem(idx) {
    setState(() {
      listToDo.removeAt(idx);
    });
  }

  /// handle update button checked
  void _updateChecked(int idx) {
    setState(() {
      if (listToDo[idx].isCheck == true) {
        listToDo[idx].isCheck = false;
      } else {
        listToDo[idx].isCheck = true;
      }
    });
  }

  /// handle show modal task
  void _editItem(Task itemTask, int idx) {
    widget.changeTitleApp('Edit');
    showBottomSheet(
      context: context,
      builder: (ctx) => EditItem(
        onCompleteEditItem: _completeEditItem,
        editItem: itemTask,
        idx: idx,
      ),
    ).closed.then((value) {
      widget.changeTitleApp('');
    });
    ;
  }

  @override
  Widget build(BuildContext context) {
    List<Task> listItemToDoComplete = [];
    if (widget.indexNavBar == 1) {
      listItemToDoComplete =
          listToDo.where((item) => item.isCheck == true).toList();
    }
    return Stack(children: <Widget>[
      widget.indexNavBar == 0
          ? ListToDo(
              listToDo: listToDo,
              onEditTask: _editItem,
              onRemoveTask: _removeItem,
              onUpdateCheck: _updateChecked,
              indexNavBar: widget.indexNavBar,
            )
          : ListToDoComplete(
              listToDo: listItemToDoComplete,
              onEditTask: _editItem,
              onRemoveTask: _removeItem,
              onUpdateCheck: _updateChecked,
              indexNavBar: widget.indexNavBar,
            ),
      widget.indexNavBar == 0
          ? Positioned(
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
                    onPressed: _openAddItemTodo,
                    icon: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ),
            )
          : const SizedBox(),
    ]);
    // return ListToDo(listToDo: listToDo);
  }
}
