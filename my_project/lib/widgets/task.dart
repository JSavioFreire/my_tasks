import 'package:flutter/material.dart';
import 'package:my_project/data/task_dao.dart';

class Task extends StatelessWidget {
  final String title;
  final String description;
  final String type;
  const Task(
    this.title,
    this.description,
    this.type, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(title,
            style: const TextStyle(
              fontSize: 22,
            )),
        subtitle: Text(
          description,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        tileColor: Colors.blue[50],
        trailing: IconButton(
            onPressed: () {
              TaskDao().delete(title);
            },
            icon: const Icon(
              Icons.remove_circle_outline,
              size: 40,
              color: Colors.red,
            )),
      ),
    );
  }
}
