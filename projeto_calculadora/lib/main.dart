import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController valor1Controller = TextEditingController();
  TextEditingController valor2Controller = TextEditingController();
  String resultado = "";

  void calcular(String operacao) {
    double num1 = double.tryParse(valor1Controller.text) ?? 0;
    double num2 = double.tryParse(valor2Controller.text) ?? 0;
    double res = 0;

    switch (operacao) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case '*':
        res = num1 * num2;
        break;
      case '/':
        res = num2 != 0 ? num1 / num2 : double.infinity;
        break;
    }

    setState(() {
      resultado = "Resultado: $res";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: valor1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Valor um"),
            ),
            TextField(
              controller: valor2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Valor dois"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => calcular('+'), child: const Text("+")),
                ElevatedButton(onPressed: () => calcular('-'), child: const Text("-")),
                ElevatedButton(onPressed: () => calcular('*'), child: const Text("*")),
                ElevatedButton(onPressed: () => calcular('/'), child: const Text("/")),
              ],
            ),
            const SizedBox(height: 20),
            Text(resultado, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
