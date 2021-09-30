import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_poc/core/error/failures.dart';
import 'package:flutter_clean_architecture_poc/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_poc/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_clean_architecture_poc/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams>{
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
  
}