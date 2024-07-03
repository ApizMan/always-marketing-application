import 'package:always_marketing_application/constant.dart';
import 'package:always_marketing_application/resources/route_manager.dart';
import 'package:always_marketing_application/resources/survey/survey_resources.dart';
import 'package:always_marketing_application/theme.dart';
import 'package:always_marketing_application/widgets/background_template.dart';
import 'package:always_marketing_application/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class HomeGuestScreen extends StatelessWidget {
  const HomeGuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundTemplate(
      isStaff: false,
      child: FutureBuilder(
          future: SurveyResources.getSurveyGuestList(prefix: 'list-guest'),
          builder: (context, snapshot) {
            // snapshot;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: LoadingDialog(),
              );
            } else if (snapshot.hasError) {
              return Scaffold(
                appBar: AppBar(),
                body: SafeArea(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ScaleTap(
                    onPressed: () => Navigator.pushNamed(
                        context, AppRoute.surveyGuestScreen,
                        arguments: snapshot.data['data'][index]['title']),
                    child: Container(
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
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: const AssetImage(surveyImage),
                              width: MediaQuery.of(context).size.width * 0.18,
                            ),
                            spaceHorizontal(width: 10.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data['data'][index]['title'],
                                  style: textStyleNormal(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  snapshot.data['data'][index]['description'] ??
                                      'no description',
                                  style: snapshot.data['data'][index]
                                              ['description'] !=
                                          null
                                      ? textStyleNormal()
                                      : const TextStyle(
                                          fontStyle: FontStyle.italic,
                                        ),
                                ),
                              ],
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
