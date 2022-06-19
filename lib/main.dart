import 'package:books_app/presentation/common/util/app_colors.dart';
import 'package:books_app/presentation/routes/routes.gr.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff8babfd),
        scaffoldBackgroundColor: AppColors.lightGray,
      ),
    );
  }
}
