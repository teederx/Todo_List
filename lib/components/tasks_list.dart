import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/tasks_tile.dart';
import 'package:todo/modules/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TasksTile(
                text: taskData.task[index].name);
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
