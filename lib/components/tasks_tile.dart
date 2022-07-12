import 'package:flutter/material.dart';

bool _checked = false;

class TasksTile extends StatefulWidget {
  const TasksTile({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<TasksTile> createState() => _TasksTileState();
}

class _TasksTileState extends State<TasksTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Colors.lightBlueAccent,
      onChanged: (bool? value) {
        setState(() {
          _checked = value!;
        });
      },
      value: _checked,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(
        widget.text,
        style: kTaskTileStyle(),
      ),
    );
  }

  TextStyle kTaskTileStyle() {
    return TextStyle(
        decorationColor: Colors.black,
        decorationStyle: TextDecorationStyle.double,
        color: _checked ? Colors.black.withOpacity(0.5) : Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        decoration: _checked ? TextDecoration.lineThrough : TextDecoration.none,
        decorationThickness: 1.5, 
      );
  }
}
