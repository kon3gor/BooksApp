import 'package:books_app/core/ui/white_space.dart';
import 'package:books_app/presentation/common/util/app_colors.dart';
import 'package:books_app/presentation/common/widgets/app_text.dart';
import 'package:books_app/core/ui/carousel/carousel_item.dart';
import 'package:flutter/material.dart';

class ShowMoreCarouselItem extends CarouselItem<int> {
  ShowMoreCarouselItem() : super(0);

  @override
  Widget buildWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
            color: Colors.white,
          ),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.arrow_forward, color: AppColors.blue),
          ),
        ),
        const WhiteSpace(height: 5),
        AppText("Show more", fontSize: 15),
      ],
    );
  }
}
