import 'package:always_marketing_application/constant.dart';
import 'package:flutter/material.dart';

TextStyle textStyleNormal({
  Color color = Colors.black,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal,
  TextDecoration decoration = TextDecoration.none,
  Color decorationColor = kBlackColor,
}) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: "Poppins",
      fontWeight: fontWeight,
      decoration: decoration,
      decorationColor: decorationColor);
}

SizedBox spaceVertical({double height = 10}) {
  return SizedBox(
    height: height,
  );
}

SizedBox spaceHorizontal({double width = 10}) {
  return SizedBox(
    width: width,
  );
}
