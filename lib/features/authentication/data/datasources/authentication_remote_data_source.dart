import 'package:flutter_clean_architecture_poc/features/authentication/data/datasources/authentication_local_data_source.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/data/models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<UserModel> loginUser(String email, String password);

  Future<UserModel> signUpUser(
      String email, String password, String names, String lastNames);
}
