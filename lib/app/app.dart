import 'package:always_marketing_application/resources/route_manager.dart';
import 'package:always_marketing_application/src/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlwaysMarketingApp extends StatelessWidget {
  final String? defaultLanguage;
  const AlwaysMarketingApp({
    super.key,
    this.defaultLanguage,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splashScreen,
      getPages: AppRoute.routes,
      supportedLocales: L10n.all,
      locale: Locale(defaultLanguage != null ? defaultLanguage! : 'en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
