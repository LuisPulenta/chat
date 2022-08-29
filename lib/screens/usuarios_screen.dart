import 'package:flutter/material.dart';

class UsuariosScreen extends StatelessWidget {
  const UsuariosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Usuarios'),
      ),
    );
  }
}
