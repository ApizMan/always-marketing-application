import 'dart:async';

import 'package:always_marketing_application/app/helpers/validators.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StoreSurveyQuestionFormBloc extends FormBloc<String, String> {
  final question = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  final type = SelectFieldBloc(
    initialValue: 'Single Answer',
    items: [
      'Single Answer',
      'Multiple Answer',
    ],
  );

  final answers = ListFieldBloc<TextFieldBloc, dynamic>(
    name: 'answers',
  );

  final isMultipleAnswer = BooleanFieldBloc();

  StoreSurveyQuestionFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        question,
        type,
        answers,
        isMultipleAnswer,
      ],
    );

    type.onValueChanges(onData: (previous, current) async* {
      if (current.value == 'Multiple Answer') {
        isMultipleAnswer.updateValue(true);
      } else {
        isMultipleAnswer.updateValue(false);
      }
    });

    if (type.value == 'Multiple Answer') {
      isMultipleAnswer.updateValue(true);
    } else {
      isMultipleAnswer.updateValue(false);
    }

    // Add an initial answer field
    addAnswerField();
  }

  void addAnswerField() {
    answers.addFieldBloc(
      TextFieldBloc(
        validators: [
          InputValidator.required,
        ],
      ),
    );
  }

  @override
  FutureOr<void> onSubmitting() async {
    
  }
}
