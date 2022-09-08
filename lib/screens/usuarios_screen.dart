import 'package:flutter/material.dart';
import 'package:chat/services/services.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:chat/models/usuario.dart';

class UsuariosScreen extends StatefulWidget {
  const UsuariosScreen({Key? key}) : super(key: key);

  @override
  State<UsuariosScreen> createState() => _UsuariosScreenState();
}

class _UsuariosScreenState extends State<UsuariosScreen> {
//-------------------- Variables --------------------------
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final usuarioService = UsuariosService();
  List<Usuario> usuarios = [];

  // final usuarios = [
  //   Usuario(uid: '1', nombre: 'María', email: 'maria@test.com', online: true),
  //   Usuario(
  //       uid: '2', nombre: 'Melissa', email: 'melissa@test.com', online: false),
  //   Usuario(
  //       uid: '3',
  //       nombre: 'Fernando',
  //       email: 'fernando@test.com',
  //       online: false),
  //   Usuario(uid: '4', nombre: 'Pablo', email: 'pablo@test.com', online: true),
  //   Usuario(uid: '5', nombre: 'Lionel', email: 'lionel@test.com', online: true),
  // ];

//-------------------- initState --------------------------
  @override
  void initState() {
    _cargarUsuarios();
    super.initState();
  }

//-------------------- Pantalla --------------------------
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    final usuario = authService.usuario;
    return Scaffold(
        appBar: AppBar(
          title: Text(usuario!.nombre.toString(),
              style: TextStyle(color: Colors.black54)),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.black54,
            ),
            onPressed: () {
              socketService.disconnect();
              Navigator.pushReplacementNamed(context, 'login');
              AuthService.deleteToken();
            },
          ),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: socketService.serverStatus == ServerStatus.Online
                  ? Icon(Icons.check_circle, color: Colors.blue[400])
                  : const Icon(Icons.offline_bolt, color: Colors.red),
            )
          ],
        ),
        body: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            onRefresh: _cargarUsuarios,
            header: const WaterDropHeader(
              complete: Icon(
                Icons.check,
              ),
              waterDropColor: Colors.blue,
            ),
            child: _listViewUsuarios()));
  }

//---------------------- _cargarUsuarios ------------------------
  _cargarUsuarios() async {
    // await Future.delayed(const Duration(milliseconds: 1000));

    usuarios = await usuarioService.getUsuarios();
    setState(() {});

    _refreshController.refreshCompleted();
  }

//---------------------- _listViewUsuarios ------------------------
  ListView _listViewUsuarios() {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
        separatorBuilder: (_, i) => const Divider(
              color: Colors.black,
            ),
        itemCount: usuarios.length);
  }

//---------------------- _usuarioListTile -------------------------
  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(
          usuario.nombre.substring(0, 2),
        ),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: usuario.online ? Colors.green : Colors.red,
        ),
      ),
      onTap: () {
        final chatService = Provider.of<ChatService>(context, listen: false);
        chatService.usuarioPara = usuario;
        Navigator.pushNamed(context, 'chat');
      },
    );
  }
}
