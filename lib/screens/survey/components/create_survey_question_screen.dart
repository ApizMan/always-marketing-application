import 'package:always_marketing_application/constant.dart';
import 'package:always_marketing_application/form_bloc/form_bloc.dart';
import 'package:always_marketing_application/resources/route_manager.dart';
import 'package:always_marketing_application/theme.dart';
import 'package:always_marketing_application/widgets/background_template.dart';
import 'package:always_marketing_application/widgets/loading_dialog.dart';
import 'package:always_marketing_application/widgets/secondary_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateSurveyQuestionScreen extends StatefulWidget {
  const CreateSurveyQuestionScreen({super.key});

  @override
  State<CreateSurveyQuestionScreen> createState() =>
      _CreateSurveyQuestionScreenState();
}

class _CreateSurveyQuestionScreenState
    extends State<CreateSurveyQuestionScreen> {
  StoreSurveyQuestionFormBloc? _formBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreSurveyQuestionFormBloc(),
      child: Builder(builder: (context) {
        _formBloc = BlocProvider.of<StoreSurveyQuestionFormBloc>(context);
        return FormBlocListener<StoreSurveyQuestionFormBloc, String, String>(
          onSubmitting: (context, state) {
            LoadingDialog.show(context);
          },
          onSubmissionFailed: (context, state) => LoadingDialog.hide(context),
          onSuccess: (context, state) {
            LoadingDialog.hide(context);
            Navigator.pushNamed(context, AppRoute.createSurveyQuestionScreen);
          },
          onFailure: (context, state) {
            LoadingDialog.hide(context);
          },
          child: BackgroundTemplate(
            title: Text(
              AppLocalizations.of(context)!.createQuestion,
              style: textStyleNormal(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: kWhiteColor),
            ),
            isStaff: true,
            isHomePage: false,
            hasBackButton: false,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(120, 158, 158, 158),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.question,
                        style: textStyleNormal(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: _formBloc!.question,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kWhiteColor,
                          labelText: '${AppLocalizations.of(context)!.title}*',
                          labelStyle: textStyleNormal(color: kGrey),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kGrey, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                      DropdownFieldBlocBuilder<String>(
                        selectFieldBloc: _formBloc!.type,
                        showEmptyItem: false,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: kWhiteColor,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        itemBuilder: (context, value) => FieldItem(
                          child: Text(value),
                        ),
                      ),
                      BlocBuilder<SelectFieldBloc<String, dynamic>,
                          SelectFieldBlocState<String, dynamic>>(
                        bloc: _formBloc!.type,
                        builder: (context, state) {
                          return Visibility(
                            visible: state.value == 'Multiple Answer',
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.answer,
                                      style: textStyleNormal(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SecondaryBtn(
                                      borderRadius: 10.0,
                                      buttonWidth: 0.4,
                                      buttonHeight: 30,
                                      onPressed: () =>
                                          _formBloc!.addAnswerField(),
                                      label: Text(
                                        AppLocalizations.of(context)!.addAnswer,
                                        style: textStyleNormal(
                                            color: kWhiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                BlocBuilder<
                                    ListFieldBloc<TextFieldBloc, dynamic>,
                                    ListFieldBlocState<TextFieldBloc, dynamic>>(
                                  bloc: _formBloc!.answers,
                                  builder: (context, state) {
                                    return Column(
                                      children: state.fieldBlocs
                                          .map((answerFieldBloc) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: TextFieldBlocBuilder(
                                            textFieldBloc: answerFieldBloc,
                                            textInputAction:
                                                TextInputAction.done,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: kWhiteColor,
                                              labelText:
                                                  '${AppLocalizations.of(context)!.answer}*',
                                              labelStyle:
                                                  textStyleNormal(color: kGrey),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 20.0,
                                              ),
                                              border: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kPrimaryColor,
                                                    width: 1.0),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kGrey, width: 1.0),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kPrimaryColor,
                                                    width: 2.0),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
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
                          buttonWidth: 0.8,
                          borderRadius: 10.0,
                          onPressed: () {
                            setState(() {
                              _formBloc!.submit();
                            });
                          },
                          label: Text(
                            AppLocalizations.of(context)!.create,
                            style: textStyleNormal(
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
