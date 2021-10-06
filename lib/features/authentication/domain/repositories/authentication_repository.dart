import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_poc/core/error/failures.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> loginUser(String email, String password);
  Future<Either<Failure, User>> signUpUser(String email, String password, String names, String lastNames);
}
