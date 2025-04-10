import '/screens/task_screen.dart';

class TaskService {
  final List<Task> _tasks = [];

  void addTask(String title, String description) {
    _tasks.add(
      Task(
        id: DateTime.now().toString(),
        title: title,
        description: description,
      ),
    );
  }

  List<Task> getTasks() {
    return _tasks;
  }

  void updateTask(int index, String title, String description) {
    _tasks[index] = Task(
      id: _tasks[index].id,
      title: title,
      description: description,
    );
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
  }
}
