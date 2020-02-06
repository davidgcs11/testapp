import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/providers/local/chat_service.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ChatService(),
      )
    ], child: DashboardPageBase());
  }
}

class DashboardPageBase extends StatelessWidget {
  const DashboardPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Text('DASHBOARD'),
    );
  }
}
