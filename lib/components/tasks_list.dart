import 'package:flutter/material.dart';
import 'package:todo/components/tasks_tile.dart';
import 'package:todo/modules/tasks.dart';
import 'package:todo/screens/task_screen.dart';

TasksScreen tasksScreen = TasksScreen();

class TasksList extends StatefulWidget {
  const TasksList({
    Key? key,
    required this.task,
  }) : super(key: key);

  final List<Task> task;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TasksTile(text: widget.task[index].name);
      },
      itemCount: widget.task.length,
    );
  }
}
