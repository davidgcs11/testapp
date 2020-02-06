import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:testapp/controllers/auth_controller.dart';
import 'package:testapp/data/api_endpoints.dart';
import 'package:testapp/models/user_crendentials.dart';
import 'package:testapp/models/user_model.dart';

class AuthService with ChangeNotifier {
  User userData;
  UserCredentials savedUserCredentials;
  static AuthController _authController = AuthController();
  String initialPage;

  AuthService() {
    getUserSavedCredentials();
  }

  getUserSavedCredentials() async {
    UserCredentials userCredentials =
        await _authController.getUserSavedCredentials();
    if (userCredentials != null) {
      savedUserCredentials = userCredentials;
      initialPage = 'dashboard';
      Response response = await get(loginEndpoint(savedUserCredentials),
          headers: getBasicHeaders());
      userData = User.fromJSON(json.decode(response.body)['result'][0]);
      notifyListeners();
    }
  }

  Future<bool> loginUser(
      {UserCredentials credentials, bool shouldSave = false}) async {
    try {
      Response response =
          await get(loginEndpoint(credentials), headers: getBasicHeaders());
      /* print(response.body); */
      userData = User.fromJSON(json.decode(response.body)['result'][0]);
      bool saved = await _authController.saveUserCredentials(credentials);
      if (saved) {
        await Fluttertoast.cancel();
        Fluttertoast.showToast(msg: 'Credentials saved');
      } else {
        await Fluttertoast.cancel();
        Fluttertoast.showToast(msg: '¡Error! Credentials not saved');
      }
      return true;
    } catch (e) {
      await Fluttertoast.cancel();
      Fluttertoast.showToast(msg: 'Cant login. Try again later');
      return false;
    }
  }

  Future<bool> registerUser({User user, bool shouldSave = false}) async {
    try {
      Response response = await post(registerEndpoint(),
          body: user.toJSON(), headers: getBasicHeaders());
      userData = User.fromJSON(json.decode(response.body)['result']);
      notifyListeners();
      bool saved =
          await _authController.saveUserCredentials(user.toCredentials());
      if (saved) {
        await Fluttertoast.cancel();
        Fluttertoast.showToast(msg: 'Credentials saved');
      } else {
        await Fluttertoast.cancel();
        Fluttertoast.showToast(msg: '¡Error! Credentials not saved');
      }
      return true;
    } catch (e) {
      await Fluttertoast.cancel();
      Fluttertoast.showToast(msg: 'Error ocurred try again later: $e');
      return false;
    }
  }

  updateUserData(User newUserData) async {
    try {
      Response response = await patch(updateEndpoint(newUserData),
          body: newUserData.toJSON(), headers: getBasicHeaders());
      userData = User.fromJSON(json.decode(response.body)['result']);
      notifyListeners();
      bool saved = await _authController
          .saveUserCredentials(newUserData.toCredentials());
      if (saved) {
        await Fluttertoast.cancel();
        Fluttertoast.showToast(msg: 'Credentials saved');
      } else {
        await Fluttertoast.cancel();
        Fluttertoast.showToast(msg: '¡Error! Credentials not saved');
      }
      return true;
    } catch (e) {
      await Fluttertoast.cancel();
      Fluttertoast.showToast(msg: 'Error ocurred try again later: $e');
      return false;
    }
  }
}
