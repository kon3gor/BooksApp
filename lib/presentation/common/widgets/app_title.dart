import 'package:flutter/material.dart';
import 'app_text.dart';

class AppTitle extends AppText {
  AppTitle(
    super.data, {
    Key? key,
    super.color = Colors.black,
    super.textAlign,
  }) : super(
          key: key,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        );
}
