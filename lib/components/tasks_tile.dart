import 'package:flutter/material.dart';

bool _checked = false;

class TasksTile extends StatefulWidget {
  const TasksTile({Key? key, required this.text, required this.longPressCallback, this.dragEnd}) : super(key: key);

  final String text;
  final Function() longPressCallback;
  final Function(DragEndDetails)? dragEnd;

  @override
  State<TasksTile> createState() => _TasksTileState();
}

class _TasksTileState extends State<TasksTile> {
  @override
  Widget build(BuildContext context) {
  
    return GestureDetector(
      onHorizontalDragEnd: widget.dragEnd,
      child: ListTile(
        onLongPress: widget.longPressCallback,
        title: Text(
          widget.text,
          style: kTaskTileStyle(),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: _checked,
          onChanged: (bool? value) {
            setState(() {
              _checked = value!;
            });
          },
        ),
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
