import 'package:flutter/cupertino.dart';

/// Modelo creado en base al modelo de mensajes emitidos por el servidor del proyecto de prueba
class Message {
  String message;
  String username;

  Message({
    @required this.username,
    @required this.message,
  });

  factory Message.fromJSON(json) {
    return Message(
      message: json['message'] ?? 'nomsg',
      username: json['username'] ?? 'nouser',
    );
  }
}
