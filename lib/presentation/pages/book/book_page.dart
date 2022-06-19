import 'package:auto_route/auto_route.dart';
import 'package:books_app/domain/models/book.dart';
import 'package:books_app/presentation/common/util/app_colors.dart';
import 'package:books_app/presentation/common/widgets/app_text.dart';
import 'package:books_app/presentation/common/widgets/app_title.dart';
import 'package:books_app/presentation/common/widgets/heart_widget.dart';
import 'package:books_app/core/ui/white_space.dart';
import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  final Book book;
  const BookPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = DraggableScrollableController();
    controller.addListener(
      () => {if (controller.size <= 0.31) context.router.navigateBack()},
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DraggableScrollableSheet(
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: true,
        controller: controller,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: _buildSheetDectoration(),
            child: SingleChildScrollView(
              controller: scrollController,
              child: _buildContent(context),
            ),
          );
        },
      ),
    );
  }

  BoxDecoration _buildSheetDectoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, -5),
              blurRadius: 15,
              color: Colors.black.withOpacity(0.3))
        ]);
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildActions(context),
          Image.network(book.image, height: 211),
          const WhiteSpace(height: 5),
          _buildTexts(),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => context.router.navigateBack(),
          child: const Icon(
            Icons.close,
            color: AppColors.blue,
          ),
        ),
        HeartWidget(book.liked),
      ],
    );
  }

  Widget _buildTexts() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppTitle(book.title),
      AppText(
        book.author,
        fontStyle: FontStyle.italic,
        fontSize: 17,
      ),
      const WhiteSpace(height: 10),
      AppText(
        book.description,
        fontSize: 20,
      ),
    ]);
  }
}
