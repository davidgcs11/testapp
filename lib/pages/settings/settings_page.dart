import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/user_model.dart';
import 'package:testapp/pages/settings/components/update_modal.dart';
import 'package:testapp/providers/global/auth_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsPageBase();
  }
}

class SettingsPageBase extends StatelessWidget {
  const SettingsPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('username: ${authService.userData?.username ?? "-"}'),
            trailing: Icon(Icons.edit),
            onTap: () => editUsername(context),
          ),
          ListTile(
            title: Text('email: ${authService.userData?.email ?? "-"}'),
            trailing: Icon(Icons.edit),
            onTap: () => editEmail(context),
          ),
        ],
      ),
    );
  }

  /// Estos métodos se implementaron el la misma sección del UI, 
  /// deberían haber sido implementados en un servicio aparte, 
  /// pero por cuestión de tiempo no se hizo
  editUsername(BuildContext context) async {
    AuthService authService = Provider.of<AuthService>(context, listen: false);
    dynamic response = await showModalBottomSheet(
        context: context,
        builder: (context) => UpdateModal(
              initialValue: authService.userData.username,
            ));

    if (response != null) {
      User baseUserData = authService.userData;
      baseUserData.username = response;
      authService.updateUserData(baseUserData);
    }
  }

  editEmail(BuildContext context) async {
    AuthService authService = Provider.of<AuthService>(context, listen: false);
    dynamic response = await showModalBottomSheet(
        context: context,
        builder: (context) => UpdateModal(
              initialValue: authService.userData.email,
            ));

    if (response != null) {
      User baseUserData = authService.userData;
      baseUserData.email = response;
      authService.updateUserData(baseUserData);
    }
  }
}
