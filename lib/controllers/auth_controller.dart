import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/models/user_crendentials.dart';

class AuthController {
  /// Se encarga de obtener la data local y la transforma a un objeto [UserCredential]
  Future<UserCredentials> getUserSavedCredentials() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    List<String> currentKeys = shared.getKeys().toList();
    if (!currentKeys.contains('email') || !currentKeys.contains('password')) {
      return null;
    } else {
      return UserCredentials(
        email: shared.getString('email'),
        password: shared.getString('password'),
        id: shared.getString('id'),
      );
    }
  }

  /// Guarda un objeot [UserCredential] con SharedPreferences
  Future<bool> saveUserCredentials(UserCredentials credentials) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    bool emailSaved = await shared.setString('email', credentials.email);
    bool passwordSaved =
        await shared.setString('password', credentials.password);
    bool id = await shared.setString('id', credentials.id);
    return emailSaved && passwordSaved && id;
  }
}
