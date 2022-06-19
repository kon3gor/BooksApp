import 'package:books_app/core/ui/white_space.dart';
import 'package:books_app/core/ui/carousel/carousel_item.dart';
import 'package:flutter/material.dart';

class WhiteSpaceCarouselItem extends CarouselItem<double> {
  WhiteSpaceCarouselItem(super.model);

  @override
  Widget buildWidget(BuildContext context) {
    return WhiteSpace(width: model);
  }
}
