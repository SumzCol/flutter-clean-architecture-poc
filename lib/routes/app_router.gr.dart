// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../core/presentation/pages/main_page.dart' as _i1;
import '../features/number_trivia/presentation/pages/number_trivia_page.dart'
    as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i3.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.MainPage(),
          opaque: true,
          barrierDismissible: false);
    },
    NumberTriviaRoute.name: (routeData) {
      return _i3.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.NumberTriviaPage(),
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(MainRoute.name, path: '/'),
        _i3.RouteConfig(NumberTriviaRoute.name, path: '/number-trivia-page')
      ];
}

/// generated route for [_i1.MainPage]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute() : super(name, path: '/');

  static const String name = 'MainRoute';
}

/// generated route for [_i2.NumberTriviaPage]
class NumberTriviaRoute extends _i3.PageRouteInfo<void> {
  const NumberTriviaRoute() : super(name, path: '/number-trivia-page');

  static const String name = 'NumberTriviaRoute';
}
