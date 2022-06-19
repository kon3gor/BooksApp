import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:books_app/domain/models/book.dart';
import 'package:books_app/presentation/common/widgets/app_text.dart';
import 'package:books_app/presentation/common/widgets/heart_widget.dart';
import 'package:books_app/core/ui/white_space.dart';
import 'package:books_app/presentation/routes/routes.gr.dart';
import 'package:flutter/material.dart';

class BookSnippet extends StatefulWidget {
  final Book book;
  const BookSnippet(this.book, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookSnippetState();
}

class _BookSnippetState extends State<BookSnippet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 137,
      height: 193,
      child: GestureDetector(
        onTap: () => context.router.push(BookRoute(book: widget.book)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _buildBakground(widget.book.image),
            _buildBlackOverlay(),
            HeartWidget(widget.book.liked),
            _buildMainContent(widget.book.image, widget.book.title)
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(String imgUrl, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(imgUrl, height: 120),
        const WhiteSpace(height: 10),
        AppText(
          text,
          fontSize: 15,
          color: Colors.white,
        )
      ],
    );
  }

  Widget _buildBakground(String imgUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Image.network(
          imgUrl,
          fit: BoxFit.fill,
          width: 137,
          height: 193,
        ),
      ),
    );
  }

  Widget _buildBlackOverlay() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
