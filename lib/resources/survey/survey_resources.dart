import 'dart:convert';

import 'package:always_marketing_application/constant.dart';
import 'package:always_marketing_application/resources/auth/auth_resources.dart';
import 'package:http/http.dart' as http;

class SurveyResources {
  static Future createSurvey({
    required String prefix,
    required Object body,
  }) async {
    var response = await http.post(
      Uri.parse('$baseURL$surveyURL$prefix'),
      body: body,
      headers: {
        "Accept": "application/json",
      },
    );
    return json.decode(response.body);
  }

  // Get List Survey For Guest
  static Future getSurveyGuestList({
    required String prefix,
  }) async {
    var response = await http.get(
      Uri.parse('$baseURL$surveyURL$prefix'),
      headers: {
        "Accept": "application/json",
      },
    );
    return json.decode(response.body);
  }

  static Future getSurveyList({
    required String prefix,
  }) async {
    final token = await LoginResources.getToken();
    var response = await http.get(
      Uri.parse('$baseURL$surveyURL$prefix'),
      headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
    );
    return json.decode(response.body);
  }

  static Future answerSurvey({
    required String prefix,
    required Object body,
  }) async {
    var response = await http.post(
      Uri.parse('$baseURL$surveyURL$prefix'),
      body: body,
      headers: {
        "Accept": "application/json",
      },
    );
    return json.decode(response.body);
  }
}
