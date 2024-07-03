import 'package:always_marketing_application/constant.dart';
import 'package:always_marketing_application/theme.dart';
import 'package:always_marketing_application/widgets/background_template.dart';
import 'package:always_marketing_application/widgets/secondary_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundTemplate(
      isStaff: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: const AssetImage('assets/icons/complete_icon.png'),
            ),
            spaceVertical(height: 50.0),
            SizedBox(
              width: 250,
              child: Text(
                AppLocalizations.of(context)!.successDesc,
                style: textStyleNormal(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            spaceVertical(height: 50.0),
            SecondaryBtn(
              borderRadius: 10.0,
              buttonWidth: 0.8,
              onPressed: () => Navigator.pop(context),
              label: Text(
                AppLocalizations.of(context)!.backToHome,
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
    );
  }
}
