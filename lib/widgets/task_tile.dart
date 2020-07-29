import 'package:flutter/material.dart';
import 'package:todoey_flutter/constants.dart';

import 'package:rounded_checkbox/rounded_checkbox.dart';

class TaskTile extends StatelessWidget {
  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback});

  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(decoration: isChecked? TextDecoration.lineThrough : null),
      ),
      trailing: RoundedCheckbox(
        activeColor: blueColor,
        edgeRadius: Radius.circular(5),
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}

