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
    print('running');
    SocketIOManager manager = SocketIOManager();
    SocketIO socket = manager.createSocketIO('http://127.0.0.1:3000', '');
    socket.init();
    await socket.connect();
    Map<String, String> data = {'username': 'david'};
    socket.sendMessage('add user', json.encode(data));
  
    notifyListeners();
  }

  void sendChatMessage(String msg) async {}
}
