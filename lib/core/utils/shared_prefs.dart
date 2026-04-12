import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void setBool(String key, bool value) {
    _prefs.setBool(key, value);
  }

  static bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }
}
