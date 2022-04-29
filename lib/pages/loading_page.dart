import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('LoadingPage'),
      ),
    );
  }
}
