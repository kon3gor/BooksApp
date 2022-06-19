import 'package:books_app/core/ui/app_padding.dart';
import 'package:books_app/core/ui/white_space.dart';
import 'package:books_app/data/data_generator.dart';
import 'package:books_app/domain/models/subject.dart';
import 'package:books_app/presentation/common/util/app_colors.dart';
import 'package:books_app/presentation/common/widgets/app_title.dart';
import 'package:books_app/presentation/common/widgets/book_horizontal_snippet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({Key? key, required this.subject}) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          subject.image,
          width: maxWidth,
          height: 300,
          fit: BoxFit.cover,
        ),
        Container(color: Colors.black38),
        DraggableScrollableSheet(
          expand: true,
          maxChildSize: 1,
          minChildSize: .7,
          initialChildSize: .7,
          builder: _buildContent,
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context, ScrollController controller) {
    return Container(
      decoration: _buildSheetDectoration(),
      child: AppPadding(
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              const WhiteSpace(height: 30),
              AppTitle(subject.name, textAlign: TextAlign.center),
              const WhiteSpace(height: 10),
              _buildDescription(),
              const WhiteSpace(height: 10),
              const Divider(color: Colors.black38),
              const WhiteSpace(height: 20),
              ..._buildBooksList(),
              const WhiteSpace(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    var firstChar = subject.description.characters.first;
    var otherText = subject.description.substring(1);
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: firstChar,
            style: GoogleFonts.medievalSharp(fontSize: 20),
          ),
          TextSpan(
            text: otherText,
            style: GoogleFonts.marvel(fontSize: 15),
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildSheetDectoration() {
    return const BoxDecoration(
      color: AppColors.lightGray,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    );
  }

  List<Widget> _buildBooksList() {
    var items = getModels();
    List<Widget> result = List.empty(growable: true);
    for (var book in items) {
      result
        ..add(BookHorizontalSnippet(book))
        ..add(const WhiteSpace(height: 10));
    }
    return result;
  }
}
