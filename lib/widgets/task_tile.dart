import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rounded_checkbox_list_tile/rounded_checkbox_list_tile.dart';

class TaskTile extends StatelessWidget {
  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback});

  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return RoundedCheckboxListTile(
      checkboxEdgeRadius: Radius.circular(5.0,) ,
      value: isChecked,
      onChanged: checkboxCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          color: isChecked ? Colors.grey : Colors.black
        ),
      ),
    );
  }
}

//ListTile(
//title: Text(
//taskTitle,
//style: TextStyle(decoration: isChecked? TextDecoration.lineThrough : null),
//),
//trailing: RoundedCheckbox(
//activeColor: blueColor,
//edgeRadius: Radius.circular(5),
//value: isChecked,
//onChanged: checkboxCallback,
//),
//);
