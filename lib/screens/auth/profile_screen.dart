import 'package:always_marketing_application/constant.dart';
import 'package:always_marketing_application/resources/auth/auth_resources.dart';
import 'package:always_marketing_application/resources/route_manager.dart';
import 'package:always_marketing_application/theme.dart';
import 'package:always_marketing_application/widgets/secondary_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Hi',
            style: textStyleNormal(
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          ScaleTap(
            onPressed: () => Navigator.pop(context),
            child: const Image(
              image: AssetImage('assets/icons/close_icon.png'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Username',
                  style: textStyleNormal(
                      fontSize: 28,
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold),
                ),
                spaceVertical(height: 10.0),
                const SizedBox(
                  width: 100,
                  child: Image(
                    image: AssetImage('assets/images/avatar_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                spaceVertical(height: 20.0),
                Text(
                  AppLocalizations.of(context)!.information,
                  style: textStyleNormal(
                      color: kWhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                spaceVertical(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person_outline,
                      ),
                      spaceHorizontal(width: 10.0),
                      Text(
                        'Outlet Name',
                        style: textStyleNormal(),
                      ),
                    ],
                  ),
                ),
                spaceVertical(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_city_outlined,
                      ),
                      spaceHorizontal(width: 10.0),
                      Text(
                        'Location',
                        style: textStyleNormal(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SecondaryBtn(
                    color: kRed,
                    buttonWidth: 0.8,
                    borderRadius: 10.0,
                    onPressed: () async {
                      LoginResources.logout(prefix: 'logout').then(
                        (value) => Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoute.loginScreen,
                          (route) => false,
                        ),
                      );
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.clear();
                    },
                    label: Text(
                      AppLocalizations.of(context)!.logout,
                      style: textStyleNormal(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
