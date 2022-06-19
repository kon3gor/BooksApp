import 'package:auto_route/auto_route.dart';
import 'package:books_app/presentation/common/widgets/app_bottom_nav.dart';
import 'package:books_app/presentation/routes/routes.gr.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [ListsRoute(), SearchRouter(), ProfileRoute()],
      builder: _contentBuilder,
    );
  }

  Widget _contentBuilder(
      BuildContext context, Widget child, Animation<double> animation) {
    final tabsRouter = AutoTabsRouter.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            child,
            SafeArea(
              top: false,
              left: false,
              right: false,
              child: AppBottomNavigation(
                index: tabsRouter.activeIndex,
                onTabSelected: tabsRouter.setActiveIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
