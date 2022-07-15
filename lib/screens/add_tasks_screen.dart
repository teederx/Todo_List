import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/task_data.dart';

class AddTasksScreen extends StatelessWidget {
  AddTasksScreen({Key? key}) : super(key: key);

  String? myTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5,),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              onChanged: (String value){
                myTask = value;
              },
              onEditingComplete: (){
                myTask = myTask;
              },
            ),
            const SizedBox(height: 5,),
            TextButton(
              onPressed:() {
                Provider.of<TaskData>(context,listen: false).addTaskName(newTaskName: myTask!);
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ), 
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}