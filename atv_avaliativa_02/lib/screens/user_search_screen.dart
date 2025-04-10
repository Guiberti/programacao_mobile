import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  @override
  _UserSearchScreenState createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _name;
  String? _email;
  String? _avatarUrl;
  String? _errorMessage;

  Future<void> _fetchUser(String id) async {
    setState(() {
      _name = null;
      _email = null;
      _avatarUrl = null;
      _errorMessage = null;
    });

    try {
      final response = await http.get(Uri.parse('https://reqres.in/api/users/$id'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        setState(() {
          _name = data['first_name'] + ' ' + data['last_name'];
          _email = data['email'];
          _avatarUrl = data['avatar'];
        });
      } else if (response.statusCode == 404) {
        setState(() {
          _errorMessage = 'Usuário não encontrado!';
        });
      } else {
        setState(() {
          _errorMessage = 'Erro ao buscar usuário: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro de conexão: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite um ID (1-12)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final id = _controller.text;
                if (id.isNotEmpty) {
                  _fetchUser(id);
                }
              },
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 20),
            if (_errorMessage != null) ...[
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ] else if (_name != null && _email != null && _avatarUrl != null) ...[
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(_avatarUrl!),
              ),
              const SizedBox(height: 16),
              Text('Nome: $_name', style: const TextStyle(fontSize: 18)),
              Text('Email: $_email', style: const TextStyle(fontSize: 18)),
            ],
          ],
        ),
      ),
    );
  }
}