import 'package:always_marketing_application/constant.dart';
import 'package:always_marketing_application/form_bloc/form_bloc.dart';
import 'package:always_marketing_application/resources/route_manager.dart';
import 'package:always_marketing_application/theme.dart';
import 'package:always_marketing_application/widgets/background_template.dart';
import 'package:always_marketing_application/widgets/loading_dialog.dart';
import 'package:always_marketing_application/widgets/primary_btn.dart';
import 'package:always_marketing_application/widgets/secondary_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateSurveyScreen extends StatefulWidget {
  const CreateSurveyScreen({super.key});

  @override
  State<CreateSurveyScreen> createState() => _CreateSurveyScreenState();
}

class _CreateSurveyScreenState extends State<CreateSurveyScreen> {
  StoreSurveyFormBloc? _formBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreSurveyFormBloc(),
      child: Builder(builder: (context) {
        _formBloc = BlocProvider.of<StoreSurveyFormBloc>(context);
        return FormBlocListener<StoreSurveyFormBloc, String, String>(
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
              AppLocalizations.of(context)!.createSurvey,
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
                    children: [
                      TextFieldBlocBuilder(
                        textFieldBloc: _formBloc!.title,
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
                      SizedBox(
                        height: 200,
                        child: TextFieldBlocBuilder(
                          expands: true,
                          maxLines: null,
                          textFieldBloc: _formBloc!.description,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: kWhiteColor,
                            labelText:
                                '${AppLocalizations.of(context)!.description}*',
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
                        PrimaryBtn(
                          buttonWidth: 0.4,
                          borderRadius: 10.0,
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          label: Text(
                            AppLocalizations.of(context)!.cancel,
                            style: textStyleNormal(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        SecondaryBtn(
                          buttonWidth: 0.45,
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
