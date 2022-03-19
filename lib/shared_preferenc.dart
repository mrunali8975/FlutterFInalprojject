import 'package:shared_preferences/shared_preferences.dart';


class Preferences {
  static SharedPreferences? pref;

  static Future initPref() async {
    pref = await SharedPreferences.getInstance();
  }

  static addData(String key,String value) {
    pref!.setString(key,value);
  }

  static String? getData() {
    String? msg = pref!.getString('login');
    return msg;
  }

  static dispose() {
    pref!.clear();
  }
}