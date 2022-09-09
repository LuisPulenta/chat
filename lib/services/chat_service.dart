import 'package:chat/models/models.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chat/global/environment.dart';

class ChatService with ChangeNotifier {
  Usuario usuarioPara = Usuario(nombre: '', email: '', online: false, uid: '1');

  Future<List<Mensaje>> getChat(String usuarioId) async {
    final uri = Uri.parse('${Environment.apiUrl}/mensajes/$usuarioId');
    String? token = await AuthService.getToken();

    try {
      final resp = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'x-token': token.toString()
      });
      final mensajesResponse = mensajesResponseFromJson(resp.body);
      return mensajesResponse.mensajes;
    } catch (e) {
      return [];
    }
  }
}
