import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;

  const Logo({required this.titulo});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: EdgeInsets.only(top: 50),
        child: SafeArea(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/tag-logo.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(titulo,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
