import 'package:prova_patrick/screens/user_screen.dart';

class UserService {
  final List<User> _users = [];

  void addUser(String name, int age) {
    _users.add(User(name: name,
        age: age,
    ),
    );
  }

  List<User> getUsers() {
    return _users;
  }

  void updateUser(int index, String name, int age) {
    _users[index] = User(name: name, age: age);
  }

  void deleteUser(int index) {
    _users.removeAt(index);
  }
}
