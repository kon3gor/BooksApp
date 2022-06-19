import 'package:books_app/data/data_generator.dart';
import 'package:books_app/domain/models/book.dart';
import 'package:books_app/presentation/common/widgets/book_horizontal_snippet.dart';
import 'package:books_app/core/ui/white_space.dart';
import 'package:books_app/presentation/pages/search/tab/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class SearchResultPage extends StatelessWidget {
  final String searchText;
  const SearchResultPage(this.searchText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Center(
            child: Column(
              children: [
                const SearchBar(),
                const WhiteSpace(height: 30),
                ...getWidgets(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getWidgets() {
    var data = getModels2(searchText);
    List<Widget> result = List.empty(growable: true);
    for (var element in data) {
      result.add(BookHorizontalSnippet(element));
      result.add(const WhiteSpace(
        height: 15,
      ));
    }
    return result;
  }
}
