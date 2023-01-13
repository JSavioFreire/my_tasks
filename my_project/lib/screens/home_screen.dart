import 'package:flutter/material.dart';
import 'package:my_project/data/task_dao.dart';
import 'package:my_project/screens/form_screen.dart';
import 'package:my_project/widgets/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormScreen(),
                  )).then((value) => setState(() {}));
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder<List<Task>>(
        future: TaskDao().findAll(),
        builder: (context, snapshot) {
          List<Task>? item = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              Center(
                child: Column(
                  children: const [
                    CircularProgressIndicator(),
                    Text('Carregando...')
                  ],
                ),
              );
              break;
            case ConnectionState.waiting:
              Center(
                child: Column(
                  children: const [
                    CircularProgressIndicator(),
                    Text('Carregando...')
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              Center(
                child: Column(
                  children: const [
                    CircularProgressIndicator(),
                    Text('Carregando...')
                  ],
                ),
              );
              break;
            case ConnectionState.done:
              if (snapshot.hasData && item != null) {
                if (item.isNotEmpty) {
                  return ListView.builder(
                      itemCount: item.length,
                      itemBuilder: (context, index) {
                        final Task eachTask = item[index];
                        return eachTask;
                      });
                }
                return Center(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.error_outline,
                        size: 128,
                      ),
                      Text('Não ha tarefas.')
                    ],
                  ),
                );
              }
              return (const Center(
                child: Text('Erro no banco de dados'),
              ));
          }
          return const Center(
            child: Text('Erro desconhecido'),
          );
        },
      ),
    );
  }
}
