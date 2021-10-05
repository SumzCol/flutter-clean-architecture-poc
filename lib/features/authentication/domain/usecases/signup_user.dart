import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_poc/core/error/failures.dart';
import 'package:flutter_clean_architecture_poc/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/entities/registration.dart';

class LoginUser extends UseCase<User, SignupParams> {
  @override
  Future<Either<Failure, User>> call(SignupParams params) {
    throw UnimplementedError();
  }
}

class SignupParams extends Equatable {
  final String email;
  final String password;
  final String names;
  final String lastNames;

  const SignupParams(
      {required this.email,
      required this.password,
      required this.names,
      required this.lastNames});

  @override
  List<Object?> get props => [email, password];
}
