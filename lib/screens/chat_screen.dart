import 'dart:io';

import 'package:chat/services/services.dart';
import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  List<ChatMessage> _messages = [
    // ChatMessage(
    //   uid: '124',
    //   texto: 'Yo al recontrapedo tomando mate',
    // ),
    // ChatMessage(
    //   uid: '123',
    //   texto:
    //       'Qué estás haciendo? Yo acá rascandome los huevos estudiando esta mierda de como carajo se hace un chat con Flutter',
    // ),
    // ChatMessage(
    //   uid: '123',
    //   texto: 'Como estas?',
    // ),
    // ChatMessage(
    //   uid: '124',
    //   texto: 'Hola Culiauuuu',
    // ),
    // ChatMessage(
    //   uid: '123',
    //   texto: 'Hola Puto!!',
    // ),
  ];

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    final chatService = Provider.of<ChatService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
              child: Text(
                chatService.usuarioPara.nombre.substring(0, 2),
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(chatService.usuarioPara.nombre,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                    fontWeight: FontWeight.bold))
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _messages.length,
                  itemBuilder: (_, i) => _messages[i]),
            ),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            Container(
              color: Colors.white,
              height: 60,
              child: _inputChat(),
            ),
          ],
        ),
      ),
    );
  }

//---------------------- _inputChat -------------------------
  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto) {
                  setState(() {
                    if (texto.trim().length > 0) {
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration:
                    const InputDecoration.collapsed(hintText: 'Enviar mensaje'),
                focusNode: _focusNode,
              ),
            ),
            //Botón de enviar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: const Text('Enviar'),
                      onPressed: _estaEscribiendo
                          ? () => _handleSubmit(_textController.text.trim())
                          : null,
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: IconTheme(
                          data: IconThemeData(
                            color: Colors.blue[400],
                          ),
                          child: IconButton(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              icon: const Icon(
                                Icons.send,
                              ),
                              onPressed: _estaEscribiendo
                                  ? () =>
                                      _handleSubmit(_textController.text.trim())
                                  : null)),
                    ),
            ),
          ],
        ),
      ),
    );
  }

//---------------------- _handleSubmit -------------------------
  _handleSubmit(String texto) {
    if (texto.isEmpty) return;
    _textController.clear();
    _focusNode.requestFocus();
    final newMessage = ChatMessage(
        texto: texto,
        uid: '123',
        animationController: AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 400),
        ));
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _estaEscribiendo = false;
    });
  }

//---------------------- dispose -------------------------
  @override
  void dispose() {
    // TODO: Off del socket
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
