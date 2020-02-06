import 'dart:convert';

import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/message.dart';
import 'package:testapp/pages/settings/settings_page.dart';
import 'package:testapp/providers/global/auth_service.dart';

class ChatService with ChangeNotifier {
  SocketIO socketIO;
  List<Message> messages = [];
  TextEditingController messageController = TextEditingController();
  ChatService(BuildContext context) {
    configureSocket(context);
  }

  goToSettings(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SettingsPage()));
  }

  configureSocket(BuildContext context) async {
    SocketIOManager manager = SocketIOManager();
    SocketIO socket = manager.createSocketIO('http://127.0.0.1:3000', '');
    await socket.init();
    await socket.connect();
    AuthService authService = Provider.of<AuthService>(context);
    String username = authService.userData?.username ?? 'NoUsername';
    Map<String, String> data = {'username': username};
    socket.sendMessage('add user', json.encode(data));
    socketIO.init();
    //Subscribe to an event to listen to
    socketIO.subscribe('new message', (jsonData) {
      //Convert the JSON data received into a Map
      Map<String, dynamic> data = json.decode(jsonData);
      messages.add(Message.fromJSON(data));
    });
    //Connect to the socket
    socketIO.connect();
    notifyListeners();
  }

  void sendChatMessage(String msg) async {}
}
