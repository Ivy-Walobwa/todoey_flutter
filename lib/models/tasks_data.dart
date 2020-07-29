import 'package:flutter/foundation.dart';
import 'dart:collection';

import 'task.dart';

class TasksData extends ChangeNotifier{
   List<Task> _tasks = [
    Task(name: 'buy bread'),
    Task(name: 'buy bread'),
    Task(name: 'Buy eggs'),
  ];

  void addTask(String task){
    _tasks.add(Task(name: task));
    notifyListeners();
  }

  int get tasksLength{
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(index){
    _tasks.removeAt(index);
    notifyListeners();
  }
}