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
                const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    'Tipo da tarefa',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.work,
                          size: 40,
                        ),
                        Icon(
                          Icons.home,
                          size: 40,
                        ),
                        Icon(
                          Icons.payments_outlined,
                          size: 40,
                        ),
                        Icon(
                          Icons.star,
                          size: 40,
                        )
                      ],
                    )),
                ElevatedButton(
                    onPressed: () {
                      TaskDao().save(Task(
                          titleController.text,
                          descriptionController.text,
                          'teste')); //depois mudar type
                      Navigator.pop(context);
                    },
                    child: const Text('Adicionar nova tarefa'))
              ],
            )),
          ),
        ),
      ),
    );
  }
}
