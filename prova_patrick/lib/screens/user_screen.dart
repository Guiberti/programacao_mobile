import 'package:flutter/material.dart';
import '/services/user_service.dart';
import 'user_detail_screen.dart';

class User {
  String name;
  int age;

  User({
    required this.name,
    required this.age,
  });
}

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserService _userService = UserService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  void _showUserDialog({User? user, int? index}) {
    if (user != null) {
      _nameController.text = user.name;
      _ageController.text = user.age.toString();
    } else {
      _nameController.clear();
      _ageController.clear();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(user == null ? 'Novo usuário' : 'Editar usuário'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Idade'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              if (_nameController.text.isNotEmpty &&
                  _ageController.text.isNotEmpty) {
                try {
                  final age = int.parse(_ageController.text);
                  if (user == null) {
                    _userService.addUser(
                      _nameController.text,
                      age,
                    );
                  } else if (index != null) {
                    _userService.updateUser(
                      index,
                      _nameController.text,
                      age,
                    );
                  }
                  setState(() {});
                  _nameController.clear();
                  _ageController.clear();
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, insira uma idade válida!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Por favor, preencha todos os campos!'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text(user == null ? 'Adicionar' : 'Salvar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Usuários')),
      body: _userService.getUsers().isEmpty
          ? const Center(child: Text('Nenhum usuário cadastrado!'))
          : ListView.builder(
        itemCount: _userService.getUsers().length,
        itemBuilder: (context, index) {
          final user = _userService.getUsers()[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.age.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailScreen(user: user),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showUserDialog(user: user, index: index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _userService.deleteUser(index);
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showUserDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}