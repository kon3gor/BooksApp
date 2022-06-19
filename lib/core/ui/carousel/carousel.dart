import 'package:books_app/core/ui/app_padding.dart';
import 'package:books_app/core/ui/white_space.dart';
import 'package:books_app/presentation/common/widgets/app_title.dart';
import 'package:books_app/core/ui/carousel/carousel_item.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
    required this.items,
    required this.title,
    this.height = 193,
  }) : super(key: key);

  final List<CarouselItem<dynamic>> items;
  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppPadding(child: AppTitle(title)),
        const WhiteSpace(height: 10),
        SizedBox(
          height: height,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: _itemBuilder,
            separatorBuilder: _separatorBuilder,
            itemCount: items.length,
          ),
        ),
      ],
    );
  }

  Widget _itemBuilder(BuildContext context, int ind) {
    return items[ind].buildWidget(context);
  }

  Widget _separatorBuilder(BuildContext context, int ind) {
    return const WhiteSpace(width: 20);
  }
}
