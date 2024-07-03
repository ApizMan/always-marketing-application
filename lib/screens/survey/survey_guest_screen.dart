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
import 'package:get/get.dart';

class SurveyGuestScreen extends StatefulWidget {
  const SurveyGuestScreen({
    super.key,
  });

  @override
  State<SurveyGuestScreen> createState() => _SurveyGuestScreenState();
}

class _SurveyGuestScreenState extends State<SurveyGuestScreen> {
  StoreSurveyGuestFormBloc? _formBloc;
  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context)!.settings.arguments.toString();
    return BlocProvider(
      create: (context) => StoreSurveyGuestFormBloc(),
      child: Builder(builder: (context) {
        _formBloc = BlocProvider.of<StoreSurveyGuestFormBloc>(context);
        return FormBlocListener<StoreSurveyGuestFormBloc, String, String>(
          onSubmitting: (context, state) {
            LoadingDialog.show(context);
          },
          onSubmissionFailed: (context, state) => LoadingDialog.hide(context),
          onSuccess: (context, state) {
            LoadingDialog.hide(context);
          },
          onFailure: (context, state) {
            LoadingDialog.hide(context);
          },
          child: BackgroundTemplate(
            isStaff: false,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: double.infinity,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: textStyleNormal(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Image(
                            image: AssetImage(surveyImage),
                          ),
                          spaceVertical(height: 10.0),
                          _formBloc!.state.currentStep == 0
                              ? Column(
                                  children: [
                                    TextFieldBlocBuilder(
                                      textFieldBloc: _formBloc!.name,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: kWhiteColor,
                                        labelText:
                                            '${AppLocalizations.of(context)!.name}*',
                                        labelStyle:
                                            textStyleNormal(color: kGrey),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 20.0),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryColor, width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kGrey, width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryColor, width: 2.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: _formBloc!.age,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: kWhiteColor,
                                        labelText:
                                            '${AppLocalizations.of(context)!.age}*',
                                        labelStyle:
                                            textStyleNormal(color: kGrey),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 20.0),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryColor, width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kGrey, width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryColor, width: 2.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: _formBloc!.location,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: kWhiteColor,
                                        labelText:
                                            '${AppLocalizations.of(context)!.location}*',
                                        labelStyle:
                                            textStyleNormal(color: kGrey),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 20.0),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryColor, width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kGrey, width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryColor, width: 2.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: _formBloc!.occupation,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: kWhiteColor,
                                        labelText:
                                            '${AppLocalizations.of(context)!.occupation}*',
                                        labelStyle:
                                            textStyleNormal(color: kGrey),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 20.0),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryColor, width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kGrey, width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryColor, width: 2.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: _formBloc!.income,
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: kWhiteColor,
                                        labelText:
                                            '${AppLocalizations.of(context)!.income}*',
                                        labelStyle:
                                            textStyleNormal(color: kGrey),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 20.0),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryColor, width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kGrey, width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryColor, width: 2.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                        ),
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              120, 158, 158, 158),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Question ${index + 1}',
                                              style: textStyleNormal(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            spaceVertical(height: 10.0),
                                            const TextField(
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: kWhiteColor,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 20.0),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kPrimaryColor,
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kGrey, width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kPrimaryColor,
                                                      width: 2.0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                ),
                                              ),
                                            ),
                                            TextFieldBlocBuilder(
                                              textFieldBloc: _formBloc!.answer,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: kWhiteColor,
                                                labelText:
                                                    '${AppLocalizations.of(context)!.answer}*',
                                                labelStyle: textStyleNormal(
                                                    color: kGrey),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 20.0),
                                                border:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kPrimaryColor,
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                ),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kGrey, width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kPrimaryColor,
                                                      width: 2.0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                        ],
                      ),
                    ),
                    spaceVertical(
                        height: _formBloc!.state.currentStep == 0
                            ? MediaQuery.of(context).size.height * 0.12
                            : MediaQuery.of(context).size.height * 0.10),
                    _formBloc!.state.currentStep == 0
                        ? SecondaryBtn(
                            borderRadius: 10.0,
                            buttonWidth: 0.8,
                            onPressed: () {
                              setState(() {
                                _formBloc!.submit();
                              });
                            },
                            label: Text(
                              AppLocalizations.of(context)!.next,
                              style: textStyleNormal(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              PrimaryBtn(
                                buttonWidth: 0.4,
                                borderRadius: 10.0,
                                onPressed: () {
                                  setState(() {
                                    _formBloc!.updateCurrentStep(0);
                                  });
                                },
                                label: Text(
                                  AppLocalizations.of(context)!.back,
                                  style: textStyleNormal(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Get.locale!.languageCode == 'ms'
                                        ? 18
                                        : 24,
                                  ),
                                ),
                              ),
                              SecondaryBtn(
                                buttonWidth: 0.45,
                                borderRadius: 10.0,
                                onPressed: () {
                                  setState(() {
                                    _formBloc!.submit();
                                    LoadingDialog.show(context);
                                    Future.delayed(
                                      const Duration(seconds: 2),
                                      () {
                                        LoadingDialog.hide(context);
                                        Navigator.popAndPushNamed(
                                            context, AppRoute.successScreen);
                                      },
                                    );
                                  });
                                },
                                label: Text(
                                  AppLocalizations.of(context)!.submit,
                                  style: textStyleNormal(
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              )
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
