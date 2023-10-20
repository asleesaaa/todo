import 'package:flutter/material.dart';
import 'package:todoapp/tasklist.dart';
import 'addTaskScreen.dart';
import 'main.dart';

class TodoApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Task> pendingTasks = [];
  List<Task> completedTasks = [];
  Task? editedTask;

  void markAsCompleted(Task task) {
    setState(() {
      pendingTasks.remove(task);
      completedTasks.add(task);
    });
  }

  void editButton(Task task) {
    setState(() {
      editedTask = task;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 27, 223, 168),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddTaskScreen(onTaskAdded: (task) {
                            setState(() {
                              pendingTasks.add(task);
                            });
                          })));
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            backgroundColor: const Color(0xff72afd5),
            centerTitle: true,
            title: const Text(
              'To-Do App',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text('Pending',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                ),
                Tab(
                  child: Text('Completed',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                ),
              ],
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(147, 55, 236, 185), Color.fromARGB(188, 114, 175, 211)],
                  begin: Alignment.topRight),
            ),
            child: TabBarView(
              children: [
                TaskList(
                  tasks: pendingTasks,
                  onTaskTapped: markAsCompleted,
                  onTaskEdit: editButton,
                ),
                TaskList(
                  tasks: completedTasks,
                  onTaskTapped: null,
                  onTaskEdit: editButton,
                ),
              ],
            ),
          ),
        ));
  }
}
