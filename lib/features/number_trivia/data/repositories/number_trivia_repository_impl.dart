import 'package:flutter_clean_architecture_poc/core/error/exception.dart';
import 'package:flutter_clean_architecture_poc/core/network/network_info.dart';
import 'package:flutter_clean_architecture_poc/features/number_trivia/data/datasources/number_trivia_local_datasource.dart';
import 'package:flutter_clean_architecture_poc/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_clean_architecture_poc/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_clean_architecture_poc/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_clean_architecture_poc/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_poc/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:injectable/injectable.dart';

typedef _ConcreteOrRandomChooser = Future<NumberTriviaModel> Function();

@LazySingleton(as: NumberTriviaRepository)
class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    return await _getTrivia(() {
      return remoteDataSource.getConcreteNumberTrivia(number);
    });
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    return await _getTrivia(() {
      return remoteDataSource.getRandomNumberTrivia();
    });
  }

  Future<Either<Failure, NumberTrivia>> _getTrivia(
      _ConcreteOrRandomChooser getConcreteOrRandom) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getConcreteOrRandom();
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(await localDataSource.getLastNumberTrivia());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
