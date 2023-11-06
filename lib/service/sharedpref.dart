import 'package:shared_preferences/shared_preferences.dart';

class Sharedpref {
  Sharedpref._();
  static final Sharedpref _instence = Sharedpref._();
  static Sharedpref get instence => _instence;

  static const String token = 'token';

  late SharedPreferences sharedpref;

  initeStorage() async {
    sharedpref = await SharedPreferences.getInstance();
  }

  setAuthDetaials(token) async {
    await sharedpref.setString(token, token);
  }

  signout() {
    sharedpref.remove(token);
  }

  String? getAuthDetails() => sharedpref.getString(token);
}
