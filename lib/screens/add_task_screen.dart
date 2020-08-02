import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoey_flutter/constants.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks_data.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:jiffy/jiffy.dart';

String newTaskTitle;
DateTime newDateTime;

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(
        0xff757575,
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 30.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(
                  'New Task',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(

                  icon: Icon(Icons.clear),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                right: 20.0,
                left: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(onChanged: (newTask){
                    newTaskTitle = newTask;
                  },
                    textAlign: TextAlign.center,
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'What are you planning?'),
                  ),
                  FlatButton.icon(
                    padding: EdgeInsets.all(0.0),
                    onPressed: ()async{
                      newDateTime = await showRoundedDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 1),
                        lastDate: DateTime(DateTime.now().year + 1),
                        borderRadius: 16,
                        theme: ThemeData(
                          primaryColor: blueColor,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.notifications_none,
                      color: blueColor,
                    ),
                    label: Text(
                      '${newDateTime!=null ? Jiffy('$newDateTime').yMMMd : 'pick date'}',
                    ),
                  ),
                  FlatButton.icon(
                    padding: EdgeInsets.all(0.0),
                    onPressed: null,
                    icon: Icon(Icons.label),
                    label: Text('Category'),
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed: () {
                if(newTaskTitle == null){
                  Navigator.pop(context);
                  return;
                }
                Provider.of<TasksData>(context, listen: false).addTask(newTaskTitle);
                Navigator.pop(context);
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: blueColor,
            ),
          ],
        ),
      ),
    );
  }
}
