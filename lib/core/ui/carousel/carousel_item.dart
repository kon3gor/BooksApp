import 'package:flutter/material.dart';

abstract class CarouselItem<T> {
  CarouselItem(this.model);

  final T model;
  Widget buildWidget(BuildContext context);
}
