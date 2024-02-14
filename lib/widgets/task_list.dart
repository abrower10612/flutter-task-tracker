import 'package:flutter/material.dart';
import 'package:flutter_task_tracker/models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) toggleTaskDone;

  const TaskList({Key? key, required this.tasks, required this.toggleTaskDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index].title),
          leading: Checkbox(
            value: tasks[index].isDone,
            onChanged: (bool? value) {
              toggleTaskDone(index);
            },
          ),
        );
      },
    );
  }
}
