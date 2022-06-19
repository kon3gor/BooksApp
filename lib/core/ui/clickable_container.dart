import 'package:flutter/material.dart';

class ClickableContainer extends StatelessWidget {
  const ClickableContainer({
    Key? key,
    required this.child,
    this.onClick,
  }) : super(key: key);

  final Widget child;
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick!(),
      child: child,
    );
  }
}
