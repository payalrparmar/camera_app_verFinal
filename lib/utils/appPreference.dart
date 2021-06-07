import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static Future<String> getSessionToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //print("get storeToken    ${ prefs.getString("sessionToken")}");

    return prefs.getString("sessionToken") ?? "";
  }

  /*set session token in shared preferences*/
  static Future<String> setSessionToken(String sessionToken) async {
    print("storeToken    $sessionToken");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("sessionToken", sessionToken);
  }
}
