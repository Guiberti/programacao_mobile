import 'package:flutter/material.dart';
import 'dart:math';
import 'resultado_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _opcoes = ['pedra', 'papel', 'tesoura'];

  String _gerarEscolhaApp() {
    final random = Random();
    return _opcoes[random.nextInt(_opcoes.length)];
  }

  void _navegarParaResultado(String escolhaUsuario) {
    final escolhaApp = _gerarEscolhaApp();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoPage(
          escolhaApp: escolhaApp,
          escolhaUsuario: escolhaUsuario,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedra, Papel, Tesoura'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Escolha do APP (Aleatório)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _opcoes.map((opcao) => GestureDetector(
              onTap: () => _navegarParaResultado(opcao),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/$opcao.png', height: 80),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}
