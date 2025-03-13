import 'package:flutter/material.dart';

class Segunda extends StatefulWidget {
  const Segunda({super.key});

  @override
  State<Segunda> createState() => _SegundaState();
}

class _SegundaState extends State<Segunda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.yellow
        ),
      ),
    );
  }
}
