import 'package:always_marketing_application/app/helpers/shared_preferences.dart';
import 'package:always_marketing_application/constant.dart';
import 'package:always_marketing_application/form_bloc/form_bloc.dart';
import 'package:always_marketing_application/resources/route_manager.dart';
import 'package:always_marketing_application/theme.dart';
import 'package:always_marketing_application/widgets/loading_dialog.dart';
import 'package:always_marketing_application/widgets/secondary_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool showPassword;
  LoginFormBloc? _formBloc;

  @override
  void initState() {
    showPassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            ScaleTap(
              onPressed: () {
                SharedPreferencesHelper.saveLanguage('ms');
                Get.updateLocale(const Locale('ms'));
              },
              child: Text(
                AppLocalizations.of(context)!.malay,
                style: textStyleNormal(),
              ),
            ),
            spaceHorizontal(width: 10.0),
            ScaleTap(
              onPressed: () {
                SharedPreferencesHelper.saveLanguage('en');
                Get.updateLocale(const Locale('en'));
              },
              child: Text(
                AppLocalizations.of(context)!.english,
                style: textStyleNormal(),
              ),
            ),
            spaceHorizontal(width: 10.0),
          ],
        ),
        body: BlocProvider(
          create: (context) => LoginFormBloc(),
          child: Builder(builder: (context) {
            _formBloc = BlocProvider.of<LoginFormBloc>(context);
            return FormBlocListener<LoginFormBloc, String, String>(
              onSubmitting: (context, state) {
                LoadingDialog.show(context);
              },
              onSubmissionFailed: (context, state) =>
                  LoadingDialog.hide(context),
              onSuccess: (context, state) {
                LoadingDialog.hide(context);
                Navigator.popAndPushNamed(
                  context,
                  AppRoute.homeScreen,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.successResponse!),
                  ),
                );
              },
              onFailure: (context, state) {
                LoadingDialog.hide(context);
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 40.0, right: 20.0, left: 20.0, bottom: 50.0),
                      height: MediaQuery.of(context).size.height * 0.43,
                      decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextFieldBlocBuilder(
                                  textFieldBloc: _formBloc!.username,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: kWhiteColor,
                                    labelText:
                                        '${AppLocalizations.of(context)!.username}*',
                                    labelStyle: textStyleNormal(color: kGrey),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kGrey, width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kWhiteColor, width: 2.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                  ),
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: _formBloc!.password,
                                  textInputAction: TextInputAction.done,
                                  obscureText: showPassword,
                                  suffixButton: SuffixButton.obscureText,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: kWhiteColor,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          showPassword = !showPassword;
                                        });
                                      },
                                      child: Icon(
                                        showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: kGrey,
                                      ),
                                    ),
                                    labelText:
                                        '${AppLocalizations.of(context)!.password}*',
                                    labelStyle: textStyleNormal(color: kGrey),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kGrey, width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kWhiteColor, width: 2.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                  ),
                                ),
                                ScaleTap(
                                  onPressed: () {},
                                  child: Text(
                                    '${AppLocalizations.of(context)!.forgotPassword}?',
                                    style: textStyleNormal(color: kWhiteColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SecondaryBtn(
                            borderRadius: 10.0,
                            buttonWidth: 0.8,
                            onPressed: () {
                              setState(() {
                                _formBloc!.submit();
                              });
                            },
                            label: Text(
                              AppLocalizations.of(context)!.login,
                              style: textStyleNormal(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          spaceVertical(height: 10.0),
                          ScaleTap(
                            onPressed: () => Navigator.pushNamed(
                                context, AppRoute.homeGuestScreen),
                            child: Text(
                              '${AppLocalizations.of(context)!.signInAsGuest}?',
                              style: textStyleNormal(
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 380,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage(logo),
                          ),
                          spaceVertical(height: 5.0),
                          Text(AppLocalizations.of(context)!.appTitleDesc),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
