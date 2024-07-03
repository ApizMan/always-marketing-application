import 'dart:async';

import 'package:always_marketing_application/app/helpers/validators.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StoreSurveyFormBloc extends FormBloc<String, String> {
  final title = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  final description = TextFieldBloc();

  StoreSurveyFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        title,
        description,
      ],
    );
  }

  @override
  FutureOr<void> onSubmitting() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    emitSuccess();
  }
}
