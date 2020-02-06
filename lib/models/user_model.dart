import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:testapp/models/user_crendentials.dart';

class User {
  String username;
  String email;
  String password;
  String imageURL;
  String id;

  User({
    @required this.email,
    @required this.imageURL,
    this.password,
    @required this.username,
    this.id,
  });

  factory User.fromJSON(json) {
    return User(
      username: json['first_name'] ?? 'None',
      email: json['email'] ?? 'None',
      password: json['password'] ?? 'None',
      imageURL: json['last_name'] ?? 'None',
      id: json['id'] ?? '',
    );
  }

  String toJSON() {
    Map<String, String> mapped = {
      'username': username,
      'email': email,
      'password': password,
      'first_name': username,
      'last_name': imageURL,
      'gender': 'male',
    };
    return json.encode(mapped);
  }

  UserCredentials toCredentials() {
    return UserCredentials(
      email: email,
      password: password,
      id: id,
    );
  }
}
