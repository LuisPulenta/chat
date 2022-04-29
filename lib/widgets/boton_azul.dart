import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String text;
  final Function onPressed;

  const BotonAzul({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        width: 200,
        height: 60,
        child: Center(
          child: Text(text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      color: Colors.blue,
      shape: StadiumBorder(),
      onPressed: () => onPressed(),
    );
  }
}
