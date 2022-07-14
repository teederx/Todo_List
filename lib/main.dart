import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/task_data.dart';
import 'package:todo/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        home: TasksScreen(), 
      ),
    );
  }
}