import 'dart:async';

import 'package:always_marketing_application/app/helpers/shared_preferences.dart';
import 'package:always_marketing_application/app/helpers/validators.dart';
import 'package:always_marketing_application/models/user_model.dart';
import 'package:always_marketing_application/resources/auth/auth_error_resources.dart';
import 'package:always_marketing_application/resources/auth/auth_resources.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final UserModel userModel = UserModel();
  final username = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  final password = TextFieldBloc(
    validators: [
      InputValidator.required,
      InputValidator.passwordChar,
    ],
  );

  LoginFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        username,
        password,
      ],
    );
  }

  @override
  FutureOr<void> onSubmitting() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      userModel.username = username.value;
      userModel.password = password.value;

      // Inside the onSubmitting method
      final response = await LoginResources.loginToken(
        prefix: 'login',
        body: {
          "username": userModel.username,
          "password": userModel.password,
        },
      );

      AuthErrorResources validationResult =
          AuthErrorResources.fromJson(response);

      if (validationResult.errors.isNotEmpty) {
        // Handle validation errors, for example, you can emit an error state
        emitFailure(failureResponse: validationResult.errors.toString());
      } else {
        // No validation errors, proceed with success
        emitSuccess(successResponse: "Successfully Login");
        SharedPreferencesHelper.saveTokenAndMerchantId(
          response['data']['token'],
        );
      }
    } catch (e) {
      e.toString();
    }
  }
}
