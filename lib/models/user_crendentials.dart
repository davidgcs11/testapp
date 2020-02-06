import 'dart:convert';

import 'package:flutter/cupertino.dart';

class UserCredentials {
  String email;
  String password;

  UserCredentials({
    @required this.password,
    @required this.email,
  });

  String toJSON() {
    Map<String, String> mapped = {
      'email': email,
      'password': password,
    };
    return json.encode(mapped);
  }
}
