import 'package:auto_route/auto_route.dart';
import 'package:books_app/core/ui/clickable_container.dart';
import 'package:books_app/domain/models/book.dart';
import 'package:books_app/presentation/common/widgets/app_text.dart';
import 'package:books_app/presentation/common/widgets/heart_widget.dart';
import 'package:books_app/core/ui/white_space.dart';
import 'package:books_app/presentation/routes/routes.gr.dart';
import 'package:flutter/material.dart';

class BookHorizontalSnippet extends StatefulWidget {
  final Book book;
  final Widget Function()? iconBuilder;
  const BookHorizontalSnippet(this.book, {Key? key, this.iconBuilder})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookHorizontalSnippetState();
}

class _BookHorizontalSnippetState extends State<BookHorizontalSnippet> {
  @override
  Widget build(BuildContext context) {
    return ClickableContainer(
      onClick: () => context.router.navigate(BookRoute(book: widget.book)),
      child: SizedBox(
        height: 162,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildImage(widget.book.image),
              _buildTexts(
                widget.book.title,
                widget.book.author,
                widget.book.description,
              ),
              _buildIcon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String imgUrl) {
    var radius = const Radius.circular(10);
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: radius, bottomLeft: radius),
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
        width: 110,
      ),
    );
  }

  Widget _buildTexts(String title, String subttitle, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              subttitle,
              fontStyle: FontStyle.italic,
              fontSize: 15,
            ),
            const WhiteSpace(height: 10),
            AppText(
              description,
              fontSize: 15,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (widget.iconBuilder == null) {
      return _defaultIconBuilder();
    } else {
      return widget.iconBuilder!();
    }
  }

  Widget _defaultIconBuilder() {
    return HeartWidget(widget.book.liked);
  }
}
