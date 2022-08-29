import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;
  const Logo({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 50),
        width: 170,
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/tag-logo.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
