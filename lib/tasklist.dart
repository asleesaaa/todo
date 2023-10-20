import "package:flutter/material.dart";
import "main.dart";

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task)? onTaskTapped;
  final Function(Task)? onTaskEdit; // Define an edit callback

  TaskList(
      {required this.tasks,
      required this.onTaskTapped,
      required this.onTaskEdit});

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? const Center(
            child: Text(
              "Welcome to To-Do List. Please press '+' to add new items.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 245, 246, 246),
                fontSize: 15,
              ),
            ),
          )
        : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  tasks[index].title,
                  style: const TextStyle(
                      color: Color.fromARGB(247, 42, 129, 228),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  tasks[index].description,
                  style: const TextStyle(
                      color: Color.fromARGB(221, 243, 239, 239),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  if (onTaskTapped != null) {
                    onTaskTapped!(tasks[index]);
                  }
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 25,
                        color: Color.fromARGB(179, 44, 125, 218),
                      ),
                      onPressed: () {
                        if (onTaskEdit != null) {
                          onTaskEdit!(tasks[index]);
                        }
                      },
                    ),
                    if (onTaskTapped != null)
                      const Icon(
                        Icons.done,
                        size: 25,
                        color: Color.fromARGB(179, 44, 125, 218),
                      ),
                  ],
                ),
              );
            },
          );
  }
}
