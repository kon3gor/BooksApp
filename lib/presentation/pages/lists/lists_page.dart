import 'package:books_app/core/ui/app_padding.dart';
import 'package:books_app/core/ui/white_space.dart';
import 'package:books_app/data/data_generator.dart';
import 'package:books_app/domain/models/book.dart';
import 'package:books_app/presentation/common/widgets/app_title.dart';
import 'package:books_app/presentation/common/widgets/book_horizontal_snippet.dart';
import 'package:books_app/presentation/common/widgets/carousel/book_item.dart';
import 'package:books_app/core/ui/carousel/carousel.dart';
import 'package:books_app/core/ui/carousel/carousel_item.dart';
import 'package:books_app/presentation/common/widgets/carousel/show_more_caousel_item.dart';
import 'package:books_app/presentation/common/widgets/carousel/white_space_carousel_item.dart';
import 'package:flutter/material.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListsState();
}

class _ListsState extends State<ListsPage> {
  List<Book> items = getModels();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBookCarousel(context, "List one"),
          const WhiteSpace(height: 20),
          _buildBookCarousel(context, "List two"),
          const WhiteSpace(height: 20),
          AppPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTitle("List three"),
                const WhiteSpace(height: 10),
                ..._buildBooksList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBooksList() {
    List<Widget> result = List.empty(growable: true);
    for (var book in items) {
      result
        ..add(BookHorizontalSnippet(book))
        ..add(const WhiteSpace(height: 10));
    }
    return result;
  }

  Carousel _buildBookCarousel(BuildContext context, String title) {
    var carouselItems = items.getRange(0, 4).map((e) => BookCarouselItem(e));
    var carousel = List<CarouselItem<dynamic>>.of(carouselItems);
    carousel
      ..insert(0, WhiteSpaceCarouselItem(0))
      ..add(ShowMoreCarouselItem())
      ..add(WhiteSpaceCarouselItem(0));

    return Carousel(items: carousel, title: title);
  }
}
