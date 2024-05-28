import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClass {


  static const bool check = false;

  static Future<bool> set_finger(bool value) async {
    print('call');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Before-Check = ${check}");
    return prefs.setBool(check.toString(), value);
  }

  static Future<bool?> get_finger() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('called');
    print(check);
    return prefs.getBool(check.toString());
  }


}