import 'dart:async';

import 'package:always_marketing_application/app/helpers/validators.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StoreSurveyGuestFormBloc extends FormBloc<String, String> {
  final name = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  final age = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  final location = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  final occupation = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  final income = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  final answer = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  StoreSurveyGuestFormBloc() {
    addFieldBlocs(
      step: 0,
      fieldBlocs: [
        name,
        age,
        location,
        occupation,
        income,
      ],
    );

    addFieldBloc(
      step: 1,
      fieldBloc: answer,
    );

    addFieldBlocs(
      step: 2,
      fieldBlocs: [],
    );
  }

  @override
  FutureOr<void> onSubmitting() async {
    if (state.currentStep == 0) {
      emitSuccess();
    } else if (state.currentStep == 1) {
      emitSuccess();
    }
    await Future.delayed(const Duration(milliseconds: 1000));
  }
}
