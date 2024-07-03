import 'package:always_marketing_application/constant.dart';
import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  final Function()? onPressed;
  final Widget label;
  final Widget icon;
  final double buttonWidth;
  final double buttonHeight;
  final double borderRadius;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderColor;
  const PrimaryBtn({
    super.key,
    this.onPressed,
    required this.label,
    this.icon = const SizedBox(),
    this.buttonWidth = 0.6,
    this.buttonHeight = 50,
    this.borderRadius = 30.0,
    this.foregroundColor = kPrimaryColor,
    this.backgroundColor = kWhiteColor,
    this.borderColor = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: label,
      icon: icon,
      style: ElevatedButton.styleFrom(
        fixedSize:
            Size(MediaQuery.sizeOf(context).width * buttonWidth, buttonHeight),
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            width: 2.0,
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
