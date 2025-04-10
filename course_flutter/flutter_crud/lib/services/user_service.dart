import '../screens/user_screen.dart';

class UserService {
  final List<User> _users = [];

  void addUser(String name, String email, int age) {
    _users.add(
      User(
        id: DateTime.now().toString(),
        name: name,
        email: email,
        age: age,
      ),
    );
  }

  List<User> getUsers() {
    return _users;
  }

  void updateUser(int index, String name, String email, int age) {
    _users[index] = User(
      id: _users[index].id,
      name: name,
      email: email,
      age: age,
    );
  }

  void deleteUser(int index) {
    _users.removeAt(index);
  }
}