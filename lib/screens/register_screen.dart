import 'package:flutter/material.dart';
import 'package:chat/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Logo(
                    titulo: 'Registro',
                  ),
                  _Form(),
                  const Labels(
                    ruta: 'login',
                    titulo: '¿Ya tienes una cuenta?',
                    subtitulo: 'Ingresa ahora',
                  ),
                  const Text('Términos y condiciones de uso',
                      style: TextStyle(fontWeight: FontWeight.w200)),
                ],
              ),
            ),
          ),
        ));
  }
}

//------------------ _Form ----------------------
class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: [
        CustomInput(
          icon: Icons.perm_identity,
          placeholder: 'Nombre',
          textController: nameCtrl,
        ),
        CustomInput(
          icon: Icons.mail_outline,
          placeholder: 'Correo',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
        ),
        CustomInput(
          icon: Icons.lock_outline,
          placeholder: 'Contraseña',
          textController: passCtrl,
          isPassword: true,
        ),
        BotonAzul(
            text: 'Registrar',
            onPressed: () {
              print(emailCtrl.text);
              print(emailCtrl.text);
            }),
      ]),
    );
  }
}
