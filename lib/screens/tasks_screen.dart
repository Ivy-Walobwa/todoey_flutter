import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoey_flutter/constants.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks_data.dart';

import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueColor,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 60.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    color: blueColor,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TasksData>(context).tasksLength} tasks today',
                  style: TextStyle(
                    color: Color(0xffD4E2FB),
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}

