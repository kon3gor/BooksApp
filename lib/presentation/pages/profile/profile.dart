import 'package:books_app/data/data_generator.dart';
import 'package:books_app/domain/models/book.dart';
import 'package:books_app/presentation/common/util/app_colors.dart';
import 'package:books_app/presentation/common/widgets/app_text.dart';
import 'package:books_app/presentation/common/widgets/app_title.dart';
import 'package:books_app/presentation/common/widgets/book_horizontal_snippet.dart';
import 'package:books_app/core/ui/white_space.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  List<Book> data = getModels();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTitle("Liked books"),
              const WhiteSpace(
                height: 20,
              ),
              ...getWidgets(context)
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getWidgets(BuildContext context) {
    List<Widget> result = List.empty(growable: true);
    for (int i = 0; i < data.length; i++) {
      result.add(BookHorizontalSnippet(
        data[i],
        iconBuilder: () => _buildTrashCan(context, i),
      ));
      result.add(const WhiteSpace(height: 15));
    }
    return result;
  }

  Widget _buildTrashCan(BuildContext context, int ind) {
    return GestureDetector(
      onTap: () => _showDeleteDialog(context, ind),
      child: const Padding(
        padding: EdgeInsets.all(5),
        child: Icon(
          Icons.delete,
          color: AppColors.blue,
          size: 20,
        ),
      ),
    );
  }

  void _deleteBook(int ind) {
    setState(() {
      data.removeAt(ind);
    });
  }

  void _showDeleteDialog(BuildContext context, int ind) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => _areUSureDialog(context, ind),
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  Widget _areUSureDialog(BuildContext context, int ind) {
    return SizedBox(
      height: 200,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            AppTitle(
              "Точно удалять???????",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => _deleteBookAndPop(context, ind),
                  child: AppText("YEP"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: AppText("NOPE"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _deleteBookAndPop(BuildContext context, int ind) {
    _deleteBook(ind);
    Navigator.pop(context);
  }
}
