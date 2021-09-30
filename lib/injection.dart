import 'package:flutter_clean_architecture_poc/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
Future<void> configureInjection(String environment) async {
  await $initGetIt(getIt, environment: environment);
}
