import 'package:flutter/material.dart';

class WhiteSpace extends StatelessWidget {
  const WhiteSpace({
    Key? key,
    this.height = 0,
    this.width = 0,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: height);
  }
}
