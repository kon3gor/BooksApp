import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends Text {
  AppText(
    super.data, {
    Key? key,
    FontStyle fontStyle = FontStyle.normal,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    super.textAlign,
    super.overflow,
    super.maxLines,
  }) : super(
          key: key,
          style: GoogleFonts.marvel(
            fontSize: fontSize,
            fontStyle: fontStyle,
            fontWeight: fontWeight,
            color: color,
          ),
        );
}
