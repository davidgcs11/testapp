import 'package:flutter/cupertino.dart';

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
