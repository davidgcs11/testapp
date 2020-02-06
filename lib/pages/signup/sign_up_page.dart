import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/providers/local/signup_page_service.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => SignUpPageService(),
      ),
    ], child: SingUpPageBase());
  }
}

class SingUpPageBase extends StatelessWidget {
  const SingUpPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpPageService loginService = Provider.of<SignUpPageService>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'SIGNUP',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: loginService.usernameController,
              onChanged: (value) => loginService.validate(),
              decoration: InputDecoration(
                hintText: 'Username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: loginService.emailController,
              onChanged: (value) => loginService.validate(),
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: loginService.passwordController,
              obscureText: true,
              onChanged: (value) => loginService.validate(),
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: loginService.imageController,
              onChanged: (value) => loginService.validate(),
              decoration: InputDecoration(
                hintText: 'Photo',
              ),
            ),
          ),
          FlatButton(
            color: Theme.of(context).primaryColor,
            child: Text('SignUp'),
            onPressed: loginService.validated
                ? () => loginService.register(context)
                : null,
          ),
          FlatButton(
            color: Theme.of(context).primaryColor,
            child: Text('GoToLogin'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
