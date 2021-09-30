// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../core/presentation/pages/main_page.dart' as _i1;
import '../features/barcode_scanner/presentation/pages/barcode_scanner_page.dart'
    as _i3;
import '../features/number_trivia/presentation/pages/number_trivia_page.dart'
    as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.MainPage(),
          opaque: true,
          barrierDismissible: false);
    },
    NumberTriviaRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.NumberTriviaPage(),
          opaque: true,
          barrierDismissible: false);
    },
    BarcodeScannerRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.BarcodeScannerPage(),
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(MainRoute.name, path: '/'),
        _i4.RouteConfig(NumberTriviaRoute.name, path: '/number-trivia-page'),
        _i4.RouteConfig(BarcodeScannerRoute.name, path: '/barcode-scanner-page')
      ];
}

/// generated route for [_i1.MainPage]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute() : super(name, path: '/');

  static const String name = 'MainRoute';
}

/// generated route for [_i2.NumberTriviaPage]
class NumberTriviaRoute extends _i4.PageRouteInfo<void> {
  const NumberTriviaRoute() : super(name, path: '/number-trivia-page');

  static const String name = 'NumberTriviaRoute';
}

/// generated route for [_i3.BarcodeScannerPage]
class BarcodeScannerRoute extends _i4.PageRouteInfo<void> {
  const BarcodeScannerRoute() : super(name, path: '/barcode-scanner-page');

  static const String name = 'BarcodeScannerRoute';
}
