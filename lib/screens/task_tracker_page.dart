// TaskTracker page
import 'package:flutter/material.dart';
import 'package:flutter_task_tracker/models/task.dart';
import 'package:flutter_task_tracker/widgets/task_list.dart';

class TaskTrackerPage extends StatefulWidget {
  const TaskTrackerPage({Key? key}) : super(key: key);

  @override
  _TaskTrackerPageState createState() => _TaskTrackerPageState();
}

// TaskTracker page state
class _TaskTrackerPageState extends State<TaskTrackerPage> {
  List<Task> tasks = [
    Task(title: 'Buy groceries'),
    Task(title: 'Walk the dog'),
    Task(title: 'Read a book'),
  ];

  void toggleTaskDone(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Tracker'),
      ),
      body: TaskList(
        tasks: tasks,
        toggleTaskDone: toggleTaskDone,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String newTaskTitle = '';
              return AlertDialog(
                title: const Text('Add New Task'),
                content: TextField(
                  onChanged: (value) {
                    newTaskTitle = value;
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Add'),
                    onPressed: () {
                      setState(() {
                        tasks.add(Task(title: newTaskTitle));
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
