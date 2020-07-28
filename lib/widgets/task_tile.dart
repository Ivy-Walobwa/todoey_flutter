import 'package:flutter/material.dart';
import 'package:todoey_flutter/constants.dart';

import 'package:rounded_checkbox/rounded_checkbox.dart';

class TaskTile extends StatefulWidget {

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: TextStyle(decoration: isChecked? TextDecoration.lineThrough : null),
      ),
      trailing: RoundedCheckbox(
        edgeRadius: Radius.circular(9),
        value: isChecked,
        onChanged: (bool newValue){
          setState(() {
            isChecked = newValue;
          });
        },
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {

  TaskCheckBox({this.checkBoxState, this.toggleCheckboxState});
  final bool checkBoxState;
  final Function toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: blueColor,
      value: checkBoxState,
      onChanged: toggleCheckboxState,
    );
  }
}