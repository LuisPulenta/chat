import 'package:flutter/material.dart';

class UsuariosPage extends StatelessWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('UsuariosPage'),
      ),
    );
  }
}
