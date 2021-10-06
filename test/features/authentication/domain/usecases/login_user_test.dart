import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/entities/user.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/usecases/login_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late MockAuthenticationRepository mockAuthenticationRepository;
  late LoginUser usecase;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    usecase = LoginUser(repository: mockAuthenticationRepository);
  });
  const tEmail = 'asdf@test.co';
  const tPassword = '12345657';
  const tUser = User(email: tEmail, names: 'Juan Manuel', lastNames: 'Lovera');

  test('should login a user and get basic User information from the repository',
      () async {
    when(() => mockAuthenticationRepository.loginUser(
            any(that: isNotNull), any(that: isNotNull)))
        .thenAnswer((_) async => const Right(tUser));

    final result =
        await usecase(const LoginParams(email: tEmail, password: tPassword));

    expect(result, const Right(tUser));
    verify(() => mockAuthenticationRepository.loginUser(tEmail, tPassword));
    verifyNoMoreInteractions(mockAuthenticationRepository);
  });
}
