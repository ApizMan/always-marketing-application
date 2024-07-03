import 'package:always_marketing_application/constant.dart';
import 'package:always_marketing_application/resources/auth/auth_resources.dart';
import 'package:always_marketing_application/resources/route_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int activeStepper = 1;

  bool _isInit = false;

  @override
  void didChangeDependencies() {
    _initialize();
    super.didChangeDependencies();
  }

  void _initialize() async {
    final token = await LoginResources.getToken();
    if (!_isInit) {
      await Future.delayed(
        const Duration(milliseconds: 1500),
      );
      if (!mounted) {
        return;
      }

      if (token != null) {
        Navigator.pushReplacementNamed(context, AppRoute.homeScreen);
      } else {
        Navigator.pushReplacementNamed(context, AppRoute.loginScreen);
      }

      _isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: kWhiteColor,
        ),
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(logo),
      ),
    );
  }
}
