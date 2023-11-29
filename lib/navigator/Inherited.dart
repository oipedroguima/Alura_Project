import 'package:flutter/material.dart';
import 'package:flutter_1/components/Task.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }
   final List <Task> taskList = [];

  void newTask (String name, String photo, int difficulty){
     taskList.add(Task(name, photo, difficulty));
  }
  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
