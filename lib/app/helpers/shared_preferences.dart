import 'package:always_marketing_application/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<void> saveLanguage(String defaultLanguage) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(keyLanguage, defaultLanguage);
  }

  static Future<void> saveTokenAndMerchantId(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyToken, token);
  }
}
