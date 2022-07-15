import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/tasks_tile.dart';
import 'package:todo/modules/task_data.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final tasks = taskData.task[index];
            return TasksTile(
              text: tasks.name,
              longPressCallback: () {
                const snackBar = SnackBar(content: Text('Deleted!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                taskData.deleteTask(tasks);
              },
              dragEnd: (details){
                const snackBar = SnackBar(content: Text('Deleted!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                taskData.deleteTask(tasks);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
