import 'package:books_app/domain/models/book.dart';
import 'package:books_app/core/ui/carousel/carousel_item.dart';
import 'package:books_app/presentation/pages/search/tab/widgets/book_snippet.dart';
import 'package:flutter/material.dart';

class BookCarouselItem extends CarouselItem<Book> {
  BookCarouselItem(super.model);

  @override
  Widget buildWidget(BuildContext context) {
    return BookSnippet(model);
  }
}
