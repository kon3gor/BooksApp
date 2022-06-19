import 'package:books_app/presentation/common/util/app_colors.dart';
import 'package:books_app/presentation/common/util/app_icons_icons.dart';
import 'package:flutter/cupertino.dart';

class HeartWidget extends StatefulWidget {
  final bool isInFavList;
  const HeartWidget(this.isInFavList, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HeartState();
}

class _HeartState extends State<HeartWidget> {
  IconData icon = AppIcons.heart;
  bool isInFavList = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: _onLikeClick,
            child: Icon(icon, color: AppColors.blue),
          )
        ],
      ),
    );
  }

  void _onLikeClick() {
    setState(() {
      if (isInFavList) {
        icon = AppIcons.heart;
      } else {
        icon = AppIcons.filled_heart;
      }
      isInFavList = !isInFavList;
    });
  }
}
