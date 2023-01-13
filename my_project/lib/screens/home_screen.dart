import 'package:flutter/material.dart';
import 'package:my_project/widgets/task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView(
        children: [
          Task(
            title: 'fazer coco',
            description: 'na hora do almmoco',
            type: 'coisa',
          ),
        ],
      ),
      backgroundColor: Colors.grey,
    );
  }
}
