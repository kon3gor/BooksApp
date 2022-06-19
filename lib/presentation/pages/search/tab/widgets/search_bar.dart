import 'package:auto_route/auto_route.dart';
import 'package:books_app/presentation/common/util/app_colors.dart';
import 'package:books_app/presentation/pages/search/result/search_result_page.dart';
import 'package:books_app/presentation/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 4)),
        ],
      ),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: 'Enter some book...',
          hintStyle: TextStyle(fontSize: 14),
          suffixIcon: Icon(
            Icons.search,
            color: AppColors.blue,
          ),
        ),
        onSubmitted: (text) => _onSearchClick(text, context),
        textInputAction: TextInputAction.search,
        cursorColor: AppColors.blue,
      ),
    );
  }

  void _onSearchClick(String? text, BuildContext context) {
    context.router.navigate(SearchResultRoute(searchText: text ?? ""));
  }
}
