import 'package:always_marketing_application/app/app.dart';
import 'package:always_marketing_application/resources/language_resources.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final defaultLanguage = await LanguageResources.getLanguage();

  runApp(AlwaysMarketingApp(
    defaultLanguage: defaultLanguage,
  ));
}
