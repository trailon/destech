// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../models/booklistmodel.dart' as _i5;
import '../pages/homescreen.dart' as _i1;
import '../pages/viewbook.dart' as _i2;

class RootRouter extends _i3.RootStackRouter {
  RootRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    Viewbook.name: (routeData) {
      final args = routeData.argsAs<ViewbookArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.ViewBook(key: args.key, book: args.book));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i3.RouteConfig(Home.name, path: '/home'),
        _i3.RouteConfig(Viewbook.name, path: '/viewbook:book'),
        _i3.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class Home extends _i3.PageRouteInfo<void> {
  const Home() : super(Home.name, path: '/home');

  static const String name = 'Home';
}

/// generated route for
/// [_i2.ViewBook]
class Viewbook extends _i3.PageRouteInfo<ViewbookArgs> {
  Viewbook({_i4.Key? key, required _i5.Book book})
      : super(Viewbook.name,
            path: '/viewbook:book', args: ViewbookArgs(key: key, book: book));

  static const String name = 'Viewbook';
}

class ViewbookArgs {
  const ViewbookArgs({this.key, required this.book});

  final _i4.Key? key;

  final _i5.Book book;

  @override
  String toString() {
    return 'ViewbookArgs{key: $key, book: $book}';
  }
}
