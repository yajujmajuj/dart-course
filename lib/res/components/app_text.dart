import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class AppText extends Text {
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;

  AppText.title(
    String data, {
    Key? key,
    this.color = AppColors.cBlack,
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = 'Montserrat',
  }) : super(
          data,
          key: key,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontFamily: fontFamily,
          ),
        );
}
