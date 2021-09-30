import 'package:auto_route/annotations.dart';
import 'package:flutter_clean_architecture_poc/core/presentation/pages/main_page.dart';
import 'package:flutter_clean_architecture_poc/features/number_trivia/presentation/pages/number_trivia_page.dart';

@CustomAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: MainPage, initial: true),
  AutoRoute(page: NumberTriviaPage)
])
class $AppRouter {}
