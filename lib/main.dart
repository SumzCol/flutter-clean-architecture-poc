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
            primaryColor: AppColors.primaryColor,
            accentColor: AppColors.secondaryColor,
            brightness: Brightness.light,
            ),
            );
  }
}
