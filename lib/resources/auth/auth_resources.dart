import 'dart:convert';

import 'package:always_marketing_application/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginResources {
  static Future loginToken({
    required String prefix,
    required Object body,
  }) async {
    var response = await http.post(
      Uri.parse('$baseURL$authURL$prefix'),
      body: body,
      headers: {
        "Accept": "application/json",
      },
    );
    return json.decode(response.body);
  }

  static Future logout({
    required String prefix,
  }) async {
    final token = await LoginResources.getToken();
    var response = await http.get(
      Uri.parse('$baseURL$authURL$prefix'),
      headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
    );
    return json.decode(response.body);
  }

// Share Preferences
  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyToken);
  }
}
