import 'package:flutter/material.dart';
import 'package:flutter_crud/screens/user_screen.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Usuário')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: ${user.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('E-mail: ${user.email}', style: const TextStyle(fontSize: 18)),
            Text('Idade: ${user.age}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
