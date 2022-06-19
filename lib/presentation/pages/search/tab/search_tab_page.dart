import 'package:books_app/core/ui/app_padding.dart';
import 'package:books_app/core/ui/carousel/carousel.dart';
import 'package:books_app/core/ui/carousel/carousel_item.dart';
import 'package:books_app/data/data_generator.dart';
import 'package:books_app/domain/models/book.dart';
import 'package:books_app/presentation/common/widgets/app_title.dart';
import 'package:books_app/core/ui/white_space.dart';
import 'package:books_app/presentation/common/widgets/carousel/book_item.dart';
import 'package:books_app/presentation/common/widgets/carousel/white_space_carousel_item.dart';
import 'package:books_app/presentation/pages/search/tab/widgets/search_bar.dart';
import 'package:books_app/presentation/pages/search/tab/widgets/subjects_table.dart';
import 'package:flutter/material.dart';

class SearchTabPage extends StatefulWidget {
  const SearchTabPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTabPage> {
  List<Book> snippets = getModels();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 150),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          AppPadding(top: 15, child: const SearchBar()),
          const WhiteSpace(height: 30),
          _buildTrendingCarousel(),
          const WhiteSpace(height: 30),
          _buildFooter(),
        ]),
      ),
    );
  }

  Widget _buildTrendingCarousel() {
    var items = List<CarouselItem<dynamic>>.of(snippets.map(
      (e) => BookCarouselItem(e),
    ));
    items
      ..insert(0, WhiteSpaceCarouselItem(0))
      ..add(WhiteSpaceCarouselItem(0));
    return Carousel(items: items, title: "Trending now");
  }

  Widget _buildFooter() {
    return AppPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle("Subjects"),
          const SubjectsTable(),
        ],
      ),
    );
  }
}
