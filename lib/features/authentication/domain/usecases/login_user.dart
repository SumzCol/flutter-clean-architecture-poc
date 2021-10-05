import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_poc/core/error/failures.dart';
import 'package:flutter_clean_architecture_poc/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/entities/registration.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/repositories/authentication_repository.dart';

class LoginUser extends UseCase<User, LoginParams> {
  final AuthenticationRepository repository;

  LoginUser({required this.repository});

  @override
  Future<Either<Failure, User>> call(LoginParams params) {
    return repository.loginUser(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
