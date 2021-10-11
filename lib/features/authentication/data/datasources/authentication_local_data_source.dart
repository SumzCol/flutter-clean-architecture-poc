import 'package:flutter_clean_architecture_poc/features/authentication/data/models/user_model.dart';

abstract class AuthenticationLocalDataSource {
  Future<UserModel> getLastUser();

  Future<void> cacheUser(UserModel userToCache);
}
