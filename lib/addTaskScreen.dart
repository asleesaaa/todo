import 'package:flutter/material.dart';

import 'main.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(Task) onTaskAdded;

  AddTaskScreen({required this.onTaskAdded});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff72afd5),
          centerTitle: true,
          title: Text('Add Task'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(147, 55, 236, 185),
              Color.fromARGB(188, 114, 175, 211)
            ], begin: Alignment.topRight),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Title',
                    labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.w300), // Customize the font style
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Description',
                    labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.w300), // Customize the font style
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        widget.onTaskAdded(Task(
                            titleController.text, descriptionController.text));
                        Navigator.pop(context);
                      },
                      child: Text('Confirm',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
