import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_poc/core/presentation/colors/app_colors.dart';
import 'package:flutter_clean_architecture_poc/routes/app_router.gr.dart';
import 'package:injectable/injectable.dart';

import 'injection.dart';

void main() async {
  await configureInjection(Environment.prod);
  runApp(App());
}

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      theme: ThemeData(
          colorScheme: const ColorScheme(
              primary: AppColors.primary,
              primaryVariant: AppColors.primaryVariant,
              secondary: AppColors.secondary,
              secondaryVariant: AppColors.secondaryVariant,
              surface: AppColors.white,
              background: AppColors.background,
              error: AppColors.error,
              onPrimary: AppColors.secondary,
              onSecondary: AppColors.white,
              onSurface: AppColors.gray,
              onBackground: AppColors.gray,
              onError: AppColors.onError,
              brightness: Brightness.light),
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 45,
                  fontFamily: 'Poppins',
                  color: AppColors.gray,
                  fontWeight: FontWeight.normal))),
    );
  }
}
