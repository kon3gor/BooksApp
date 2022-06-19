import 'package:books_app/presentation/common/util/app_colors.dart';
import 'package:books_app/presentation/common/util/app_icons_icons.dart';
import 'package:flutter/material.dart';

class AppBottomNavigation extends StatefulWidget {
  final int index;
  final void Function(int)? onTabSelected;

  const AppBottomNavigation({Key? key, required this.index, this.onTabSelected})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _NavBarState();
}

class _NavBarState extends State<AppBottomNavigation> {
  int _currentActiveTab = 0;

  @override
  Widget build(BuildContext context) {
    _currentActiveTab = widget.index;

    return Container(
      height: 62,
      width: 360,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _clickableChildren(),
      ),
    );
  }

  List<Widget> _clickableChildren() {
    return [
      _buildTab(0, AppIcons.subjects),
      _buildTab(1, AppIcons.search),
      _buildTab(2, AppIcons.profile),
    ];
  }

  Widget _buildTab(int at, IconData icon) {
    return GestureDetector(
      onTap: (() => {_updateSelectedTab(at)}),
      child: Icon(
        icon,
        size: 24,
        color: _currentActiveTab == at ? AppColors.blue : AppColors.grey,
      ),
    );
  }

  void _updateSelectedTab(int newSelected) {
    widget.onTabSelected!(newSelected);
    setState(() {
      _currentActiveTab = newSelected;
    });
  }
}
