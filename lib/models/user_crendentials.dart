import 'dart:convert';

import 'package:flutter/cupertino.dart';

/// Modelo con información para almacenar e iniciar sesión
class UserCredentials {
  String email;
  String password;
  String id;

  UserCredentials(
      {@required this.password, @required this.email, @required this.id});

  String toJSON() {
    Map<String, String> mapped = {
      'email': email,
      'password': password,
    };
    return json.encode(mapped);
  }
}
