import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/modules/tasks.dart';

class TaskData extends ChangeNotifier{
  final List<Task> _task = [];

  UnmodifiableListView <Task> get task {
    return UnmodifiableListView(_task);
  }

  int get taskCount {
    return _task.length;
  }

  void updateTaskName ({required String newTaskName}){
    _task.add(Task(name: newTaskName));
    notifyListeners();
  }
}