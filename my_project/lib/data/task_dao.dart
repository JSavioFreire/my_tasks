import 'open_database.dart';
import 'package:sqflite/sqflite.dart';
import '../widgets/task.dart';

class TaskDao {
  static const String taskdatabase = 'CREATE TABLE $tableName('
      '$name TEXT, '
      '$description TEXT, '
      '$type TEXT)';

  static const String tableName = 'taskTable';

  static const String name = 'name';
  static const String description = 'description';
  static const String type = 'type';

  save(Task newTask) async {
    final Database dataBase = await getDataBase();
    Map<String, dynamic> newTaskMap = toMap(newTask);
    return await dataBase.insert(tableName, newTaskMap);
  }

  Future<List<Task>> findAll() async {
    final Database dataBase = await getDataBase();
    final List<Map<String, dynamic>> result = await dataBase.query(tableName);
    return toList(result);
  }

  Future<List<Task>> find(String taskBuscada) async {
    final Database dataBase = await getDataBase();
    final List<Map<String, dynamic>> result = await dataBase.query(
      tableName,
      where: '$name = ?',
      whereArgs: [taskBuscada],
    );
    return toList(result);
  }

  delete(String taskName) async {
    final Database dataBase = await getDataBase();
    return dataBase.delete(
      tableName,
      where: '$name = ?',
      whereArgs: [taskName],
    );
  }

  Map<String, dynamic> toMap(Task eachTask) {
    final Map<String, dynamic> taskMap = {};
    taskMap[name] = eachTask.title;
    taskMap[description] = eachTask.description;
    taskMap[type] = eachTask.type;
    return taskMap;
  }

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    final List<Task> taskList = [];
    for (Map<String, dynamic> eachTask in taskMap) {
      final Task tasks =
          Task(eachTask['name'], eachTask['description'], eachTask['type']);
      taskList.add(tasks);
    }
    return taskList;
  }
}
