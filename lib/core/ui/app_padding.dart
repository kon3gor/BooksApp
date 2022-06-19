import 'package:flutter/material.dart';

class AppPadding extends Padding {
  AppPadding({
    Key? key,
    required super.child,
    double bottom = 0,
    double top = 0,
  }) : super(
          key: key,
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: bottom,
            top: top,
          ),
        );
}
