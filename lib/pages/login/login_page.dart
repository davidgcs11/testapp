import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/providers/local/login_page_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => LoginPageService(context),
      ),
    ], child: LoginPageBase());
  }
}

class LoginPageBase extends StatelessWidget {
  const LoginPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginPageService loginService = Provider.of<LoginPageService>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 25,
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
          FlatButton(
            color: Theme.of(context).primaryColor,
            child: Text('Login'),
            onPressed: loginService.validated
                ? () => loginService.authenthicate(context)
                : null,
          ),
          FlatButton(
            color: Theme.of(context).primaryColor,
            child: Text('Go to SignUp'),
            onPressed: () => loginService.goToSignUp(context),
          ),
        ],
      ),
    );
  }
}
