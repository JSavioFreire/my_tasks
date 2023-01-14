import 'package:flutter/material.dart';
import 'package:my_project/data/task_dao.dart';
import 'package:my_project/widgets/task.dart';

class FormScreen extends StatelessWidget {
  FormScreen({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add nova tarefa',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Nome da tarefa',
                        border: InputBorder.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Sobre a tarefa',
                        border: InputBorder.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: ElevatedButton(
                      onPressed: () {
                        TaskDao().save(Task(titleController.text,
                            descriptionController.text, 'teste'));
                        Navigator.pop(context);
                      },
                      child: const Text('Adicionar nova tarefa')),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
