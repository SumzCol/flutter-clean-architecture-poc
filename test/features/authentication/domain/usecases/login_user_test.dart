import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/entities/registration.dart';
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
  const email = 'asdf@test.co';
  const password = '12345657';
  const user = User(email: email, names: 'Juan Manuel', lastNames: 'Lovera');

  test('should login a user and get basic user information from the repository',
      () async {
    when(() => mockAuthenticationRepository.loginUser(
            any(that: isNotNull), any(that: isNotNull)))
        .thenAnswer((_) async => const Right(user));

    final result =
        await usecase(const LoginParams(email: email, password: password));

    expect(result, const Right(user));
    verify(() => mockAuthenticationRepository.loginUser(email, password));
    verifyNoMoreInteractions(mockAuthenticationRepository);
  });
}
