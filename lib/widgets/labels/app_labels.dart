import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_theme_manager.dart';


class AppLabel extends StatelessWidget {

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;


  AppLabel({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.fontStyle,
  });


  final AppThemeManager theme =
  Get.find<AppThemeManager>();


  @override
  Widget build(BuildContext context) {


    return Text(

      text,

      maxLines: maxLines,

      overflow: overflow,

      textAlign: textAlign,

      style: TextStyle(

        fontSize: fontSize,

        fontWeight: fontWeight,

        fontStyle: fontStyle,

        color: color ?? theme.text,

      ),

    );

  }
}