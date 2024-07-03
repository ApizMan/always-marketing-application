import 'package:always_marketing_application/constant.dart';
import 'package:flutter/material.dart';

class SecondaryBtn extends StatelessWidget {
  final Function()? onPressed;
  final Widget label;
  final Widget icon;
  final double buttonWidth;
  final double buttonHeight;
  final double borderRadius;
  final Color? color;
  const SecondaryBtn({
    super.key,
    this.onPressed,
    required this.label,
    this.icon = const SizedBox(),
    this.buttonWidth = 0.5,
    this.buttonHeight = 50,
    this.borderRadius = 50.0,
    this.color = kSecondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        ],
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: label,
        icon: icon,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          fixedSize: Size(
              MediaQuery.sizeOf(context).width * buttonWidth, buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: const BorderSide(
              width: 2.0,
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
