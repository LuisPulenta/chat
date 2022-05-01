import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
              child: Text(
                'Lu',
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Luis Núñez',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
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
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, i) => Text('$i'),
                reverse: true,
              ),
            ),
            Divider(
              height: 1,
            ),
            //TODO Caja de Texto
            Container(
              color: Colors.white70,
              height: 60,
              child: _inputChat(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto) {
                  //TODO cuando hay un valor, para poder postear
                },
                decoration:
                    InputDecoration.collapsed(hintText: 'Enviar mensaje'),
                focusNode: _focusNode,
              ),
            ),
            //Botón de enviar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: Text('Enviar'),
                      onPressed: () {},
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: IconButton(
                          icon: Icon(Icons.send),
                          color: Colors.blue[400],
                          onPressed: () {}),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmit(String texto) {
    print(texto);
    _textController.clear();
    _focusNode.requestFocus();
  }
}
