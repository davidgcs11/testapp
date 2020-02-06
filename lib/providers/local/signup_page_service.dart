import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/user_model.dart';
import 'package:testapp/pages/dashboard/dashboard_page.dart';
import 'package:testapp/pages/signup/sign_up_page.dart';
import 'package:testapp/providers/global/auth_service.dart';

class SignUpPageService with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController imageController =
      TextEditingController(text: 'https://drquiz.app/assets/images/logo.png');
  bool validated = false;

  /// Validación de contraseña
  bool validatePW({String textbase}) {
    String text = textbase ?? passwordController.text;

    /// Esta es la validación pedida
    /* String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$'; */
    /// Esta es la validación que encaja con el freeAPI
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(text);
  }

  /// Validación de email
  bool validateEmail({String textbase}) {
    bool validation = true;
    String text = textbase ?? emailController.text;

    /// Regex general para validar email
    bool basicValidation = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(text);
    if (basicValidation) {
      int firstSplit = text.indexOf('@');
      int secondSplit = text.lastIndexOf('.');
      if (secondSplit - firstSplit <= 3 || secondSplit == -1) {
        validation = false;
      }
      if (text.length - secondSplit <= 2 + 1) {
        validation = false;
      }
    } else {
      validation = false;
    }
    return validation;
  }

  /// Validación del username
  bool validateUsername({String textbase}) {
    bool validation = true;
    String text = textbase ?? usernameController.text;

    if (text.length == 0) {
      validation = false;
    }
    return validation;
  }

  validate({bool signupview = true}) {
    bool email = validateEmail();
    bool password = validatePW();
    bool username = validateUsername();
    validated = email && password && username;
    notifyListeners();
  }

  register(BuildContext context) async {
    AuthService authService = Provider.of<AuthService>(context, listen: false);
    User credentials = User(
        email: emailController.text,
        password: passwordController.text,
        imageURL: imageController.text,
        username: usernameController.text);
    bool response = await authService.registerUser(user: credentials);
    if (response) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DashboardPage(),
        ),
      );
    }
  }

  goToSignUp(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      ),
    );
  }
}
