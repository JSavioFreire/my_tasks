import 'package:flutter/material.dart';

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
        leading: const Icon(
          Icons.work,
          size: 40,
          color: Colors.green,
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.remove_circle_outline,
              size: 40,
              color: Colors.red,
            )),
      ),
    );
  }
}
