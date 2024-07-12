import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  const Titulo({super.key, required this.titulo});

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Text(titulo, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),);
  }
}
