import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chat/global/environment.dart';
import 'package:chat/models/usuario.dart';

class ChatService with ChangeNotifier {
  Usuario usuarioPara = Usuario(nombre: '', email: '', online: false, uid: '1');
}
