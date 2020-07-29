import 'package:flutter/material.dart';
import 'package:todoey_flutter/constants.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, tasksData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = tasksData.tasks[index];
            return Dismissible(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.delete_forever,
                    color: greyColor,
                  ),
                ],
              ),
              key: Key(task.name),
              onDismissed: (direction) {
                tasksData.deleteTask(index);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: warnColor,
                    content: Text("${task.name} deleted"),
                  ),
                );
              },
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (newValue) {
                  tasksData.updateTask(task);
                },
              ),
            );
          },
          itemCount: tasksData.tasksLength,
        );
      },
    );
  }
}
