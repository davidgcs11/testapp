import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/providers/local/chat_service.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ChatService(context),
      )
    ], child: DashboardPageBase());
  }
}

class DashboardPageBase extends StatelessWidget {
  const DashboardPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatService chatService = Provider.of<ChatService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => chatService.goToSettings(context),
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Text('CHAT'),
          FlatButton(
            onPressed: () => chatService.configureSocket(context),
            child: Text('configure'),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                for (var i = 0; i < chatService.messages.length; i++)
                  Text(chatService.messages[i].message),
              ],
            ),
          ),
          TextFormField(),
          FlatButton(
            onPressed: () => chatService.sendChatMessage('hola'),
            child: Text('ENVIAR'),
          ),
        ],
      ),
    );
  }
}
