import 'package:flutter_clean_architecture_poc/core/error/exception.dart';
import 'package:flutter_clean_architecture_poc/core/network/network_info.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/data/datasources/authentication_local_data_source.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/data/models/user_model.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/entities/user.dart';
import 'package:flutter_clean_architecture_poc/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remote;
  final AuthenticationLocalDataSource local;
  final NetworkInfo networkInfo;

  AuthenticationRepositoryImpl(
      {required this.remote, required this.local, required this.networkInfo});

  @override
  Future<Either<Failure, User>> loginUser(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel response = await remote.loginUser(email, password);
        local.cacheUser(response);
        return Right(response.toEntity());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        UserModel response = await local.getLastUser();
        return Right(response.toEntity());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, User>> signUpUser(
      String email, String password, String names, String lastNames) {
    throw UnimplementedError();
  }
}
