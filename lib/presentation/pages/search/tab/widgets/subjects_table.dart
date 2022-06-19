import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:books_app/core/ui/clickable_container.dart';
import 'package:books_app/data/subjects_store.dart';
import 'package:books_app/domain/models/subject.dart';
import 'package:books_app/presentation/common/widgets/app_title.dart';
import 'package:books_app/presentation/routes/routes.gr.dart';
import 'package:flutter/material.dart';

class SubjectsTable extends StatefulWidget {
  const SubjectsTable({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SubjectsTableState();
}

class _SubjectsTableState extends State<SubjectsTable> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        _Subject(subject: Subjects.fantasy, isFirstInRow: true),
        _Subject(subject: Subjects.scienceFiction, isFirstInRow: false),
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        _Subject(subject: Subjects.horror, isFirstInRow: true),
        _Subject(subject: Subjects.classics, isFirstInRow: false),
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        _Subject(subject: Subjects.detective, isFirstInRow: true),
        _Subject(subject: Subjects.magic, isFirstInRow: false),
      ]),
    ]);
  }
}

class _Subject extends StatelessWidget {
  const _Subject({
    Key? key,
    required this.subject,
    required this.isFirstInRow,
  }) : super(key: key);

  final Subject subject;
  final bool isFirstInRow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _getEdgeInsets(),
      child: ClickableContainer(
        onClick: () => context.router.navigate(SubjectRoute(subject: subject)),
        child: SizedBox(
          height: 150,
          width: 150,
          child: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildBakground(subject.image),
        AppTitle(
          subject.name,
          color: Colors.white,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _buildBakground(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
          ),
          Container(color: Colors.black38),
        ],
      ),
    );
  }

  EdgeInsets _getEdgeInsets() {
    double rightInset = isFirstInRow ? 10 : 0;
    double leftInset = isFirstInRow ? 0 : 10;
    return EdgeInsets.only(
      top: 10,
      bottom: 10,
      right: rightInset,
      left: leftInset,
    );
  }
}
