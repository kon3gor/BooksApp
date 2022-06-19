import 'package:auto_route/auto_route.dart';
import 'package:books_app/presentation/pages/book/book_page.dart';
import 'package:books_app/presentation/pages/lists/lists_page.dart';
import 'package:books_app/presentation/pages/main_page.dart';
import 'package:books_app/presentation/pages/profile/profile.dart';
import 'package:books_app/presentation/pages/search/result/search_result_page.dart';
import 'package:books_app/presentation/pages/search/tab/search_tab_page.dart';
import 'package:books_app/presentation/pages/subject/subject_page.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(
      path: '/',
      page: MainPage,
      initial: true,
      children: [
        searchRouter,
        AutoRoute(path: "profile", page: ProfilePage),
        AutoRoute(path: "subjects", page: ListsPage),
      ],
    ),
    CustomRoute(
      path: "book",
      page: BookPage,
      opaque: false,
      fullscreenDialog: true,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 400,
    ),
    AutoRoute(path: "subject", page: SubjectPage),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}

const searchRouter = AutoRoute(
  page: EmptyRouterPage,
  path: "search",
  name: "SearchRouter",
  initial: true,
  children: [
    AutoRoute(
      path: "search",
      page: SearchTabPage,
      initial: true,
    ),
    AutoRoute(
      path: "result",
      page: SearchResultPage,
    ),
  ],
);
