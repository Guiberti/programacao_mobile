import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget {
  final String escolhaApp;
  final String escolhaUsuario;

  const ResultadoPage({
    Key? key,
    required this.escolhaApp,
    required this.escolhaUsuario,
  }) : super(key: key);

  String _verificarResultado() {
    if (escolhaUsuario == escolhaApp) {
      return 'empate.png';
    } else if ((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel')) {
      return 'vitoria.png';
    } else {
      return 'derrota.png';
    }
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
          const Text('Escolha do APP', style: TextStyle(fontSize: 20)),
          Image.asset('assets/images/$escolhaApp.png', height: 100),
          const SizedBox(height: 20),
          const Text('Sua Escolha', style: TextStyle(fontSize: 20)),
          Image.asset('assets/images/$escolhaUsuario.png', height: 100),
          const SizedBox(height: 20),
          Image.asset('assets/images/${_verificarResultado()}', height: 120),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Jogar novamente'),
          ),
        ],
      ),
    );
  }
}
