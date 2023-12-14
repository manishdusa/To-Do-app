import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(24.0),
        child: Row(
          children: [
            //checkbox
            Checkbox(value: taskCompleted, onChanged: onChanged)

            //task name
            Text("Make Tutorial"),
          ],
        ),
        decoration: BoxDecoration(
          color: Color(0xFFffd300),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}