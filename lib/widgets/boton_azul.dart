import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const BotonAzul({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Center(
          child: Text(text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      color: Colors.blue,
      shape: const StadiumBorder(),
      onPressed: onPressed,
    );
  }
}
