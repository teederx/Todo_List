import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/components/tasks_list.dart';
import 'package:todo/modules/tasks.dart';
import 'package:todo/screens/add_tasks_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> task = [];

  String tasks(int number){
    if (number<2){
      return '$number task';
    }
    else{
      return '$number tasks';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list_rounded,
                    color: Colors.lightBlueAccent,
                    size: 35,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Todo List',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  tasks(task.length),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(task: task),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTasksScreen(
                  addTaskCallBack: (newTaskCallBack) {
                    setState(() {
                      task.add(Task(name:newTaskCallBack));
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add_rounded,
          size: 40,
        ),
      ),
    );
  }
}
