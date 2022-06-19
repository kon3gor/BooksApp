// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i9;

import '../../domain/models/book.dart' as _i10;
import '../../domain/models/subject.dart' as _i11;
import '../pages/book/book_page.dart' as _i2;
import '../pages/lists/lists_page.dart' as _i6;
import '../pages/main_page.dart' as _i1;
import '../pages/profile/profile.dart' as _i5;
import '../pages/search/result/search_result_page.dart' as _i8;
import '../pages/search/tab/search_tab_page.dart' as _i7;
import '../pages/subject/subject_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    BookRoute.name: (routeData) {
      final args = routeData.argsAs<BookRouteArgs>();
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: _i2.BookPage(key: args.key, book: args.book),
          fullscreenDialog: true,
          transitionsBuilder: _i4.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 400,
          opaque: false,
          barrierDismissible: false);
    },
    SubjectRoute.name: (routeData) {
      final args = routeData.argsAs<SubjectRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.SubjectPage(key: args.key, subject: args.subject));
    },
    SearchRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    ProfileRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ProfilePage());
    },
    ListsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ListsPage());
    },
    SearchTabRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SearchTabPage());
    },
    SearchResultRoute.name: (routeData) {
      final args = routeData.argsAs<SearchResultRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.SearchResultPage(args.searchText, key: args.key));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(MainRoute.name, path: '/', children: [
          _i4.RouteConfig('#redirect',
              path: '',
              parent: MainRoute.name,
              redirectTo: 'search',
              fullMatch: true),
          _i4.RouteConfig(SearchRouter.name,
              path: 'search',
              parent: MainRoute.name,
              children: [
                _i4.RouteConfig('#redirect',
                    path: '',
                    parent: SearchRouter.name,
                    redirectTo: 'search',
                    fullMatch: true),
                _i4.RouteConfig(SearchTabRoute.name,
                    path: 'search', parent: SearchRouter.name),
                _i4.RouteConfig(SearchResultRoute.name,
                    path: 'result', parent: SearchRouter.name)
              ]),
          _i4.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: MainRoute.name),
          _i4.RouteConfig(ListsRoute.name,
              path: 'subjects', parent: MainRoute.name)
        ]),
        _i4.RouteConfig(BookRoute.name, path: 'book'),
        _i4.RouteConfig(SubjectRoute.name, path: 'subject')
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute({List<_i4.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.BookPage]
class BookRoute extends _i4.PageRouteInfo<BookRouteArgs> {
  BookRoute({_i9.Key? key, required _i10.Book book})
      : super(BookRoute.name,
            path: 'book', args: BookRouteArgs(key: key, book: book));

  static const String name = 'BookRoute';
}

class BookRouteArgs {
  const BookRouteArgs({this.key, required this.book});

  final _i9.Key? key;

  final _i10.Book book;

  @override
  String toString() {
    return 'BookRouteArgs{key: $key, book: $book}';
  }
}

/// generated route for
/// [_i3.SubjectPage]
class SubjectRoute extends _i4.PageRouteInfo<SubjectRouteArgs> {
  SubjectRoute({_i9.Key? key, required _i11.Subject subject})
      : super(SubjectRoute.name,
            path: 'subject',
            args: SubjectRouteArgs(key: key, subject: subject));

  static const String name = 'SubjectRoute';
}

class SubjectRouteArgs {
  const SubjectRouteArgs({this.key, required this.subject});

  final _i9.Key? key;

  final _i11.Subject subject;

  @override
  String toString() {
    return 'SubjectRouteArgs{key: $key, subject: $subject}';
  }
}

/// generated route for
/// [_i4.EmptyRouterPage]
class SearchRouter extends _i4.PageRouteInfo<void> {
  const SearchRouter({List<_i4.PageRouteInfo>? children})
      : super(SearchRouter.name, path: 'search', initialChildren: children);

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i4.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i6.ListsPage]
class ListsRoute extends _i4.PageRouteInfo<void> {
  const ListsRoute() : super(ListsRoute.name, path: 'subjects');

  static const String name = 'ListsRoute';
}

/// generated route for
/// [_i7.SearchTabPage]
class SearchTabRoute extends _i4.PageRouteInfo<void> {
  const SearchTabRoute() : super(SearchTabRoute.name, path: 'search');

  static const String name = 'SearchTabRoute';
}

/// generated route for
/// [_i8.SearchResultPage]
class SearchResultRoute extends _i4.PageRouteInfo<SearchResultRouteArgs> {
  SearchResultRoute({required String searchText, _i9.Key? key})
      : super(SearchResultRoute.name,
            path: 'result',
            args: SearchResultRouteArgs(searchText: searchText, key: key));

  static const String name = 'SearchResultRoute';
}

class SearchResultRouteArgs {
  const SearchResultRouteArgs({required this.searchText, this.key});

  final String searchText;

  final _i9.Key? key;

  @override
  String toString() {
    return 'SearchResultRouteArgs{searchText: $searchText, key: $key}';
  }
}
