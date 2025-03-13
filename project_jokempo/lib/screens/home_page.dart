import 'package:flutter/material.dart';
import 'dart:math';
import 'resultado_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _opcoes = ['pedra', 'papel', 'tesoura'];
  late String _escolhaApp;

  // Função para gerar a escolha do app aleatoriamente
  String _gerarEscolhaApp() {
    final random = Random();
    return _opcoes[random.nextInt(_opcoes.length)];
  }

  // Função que navega para a página de resultados passando as escolhas
  void _navegarParaResultado(String escolhaUsuario) {
    setState(() {
      _escolhaApp = _gerarEscolhaApp(); // Gera a escolha do app toda vez que o usuário escolhe
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoPage(
          escolhaApp: _escolhaApp, // Passa a escolha gerada para a página de resultado
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
          // Exibe a escolha aleatória do app
          Image.asset('assets/images/$_escolhaApp.png', height: 100),
          const SizedBox(height: 10),
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
