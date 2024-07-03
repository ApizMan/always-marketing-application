import 'package:always_marketing_application/constant.dart';
import 'package:always_marketing_application/models/survey_model.dart';
import 'package:always_marketing_application/theme.dart';
import 'package:always_marketing_application/widgets/background_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic model =
        ModalRoute.of(context)!.settings.arguments as SurveyModel;
    return BackgroundTemplate(
      isStaff: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            model.title,
                            style: textStyleNormal(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Image(
                            image: AssetImage(surveyImage),
                          ),
                          spaceVertical(height: 10.0),
                        ],
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            spaceVertical(height: 10.0),
                            Text(
                              AppLocalizations.of(context)!.question,
                              style: textStyleNormal(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: kGrey,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    )
                                  ]),
                              child: Text(
                                'Question',
                                style: textStyleNormal(),
                              ),
                            ),
                            spaceVertical(height: 10.0),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: kGrey,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    )
                                  ]),
                              child: Text(
                                'Type',
                                style: textStyleNormal(),
                              ),
                            ),
                            spaceVertical(height: 10.0),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20.0),
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
                                    AppLocalizations.of(context)!.answer,
                                    style: textStyleNormal(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  spaceVertical(height: 10.0),
                                  Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: kWhiteColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          )
                                        ]),
                                    child: Text(
                                      'Answer 1',
                                      style: textStyleNormal(),
                                    ),
                                  ),
                                  spaceVertical(height: 10.0),
                                  Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: kWhiteColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          )
                                        ]),
                                    child: Text(
                                      'Answer 2',
                                      style: textStyleNormal(),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
