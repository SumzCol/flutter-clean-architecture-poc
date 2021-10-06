import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/entities/user.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/usecases/signup_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'login_user_test.dart';

void main() {
  late MockAuthenticationRepository mockAuthenticationRepository;
  late SignupUser usecase;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    usecase = SignupUser(repository: mockAuthenticationRepository);
  });

  const tEmail = 'asdf@test.co';
  const tPassword = '12345657';
  const tNames = 'Juan Manuel';
  const tLastNames = 'Lovera';
  const tUser = User(email: tEmail, names: tNames, lastNames: tLastNames);

  test(
      'should signup the user and get the User information from the repository',
      () async {
    when(() => mockAuthenticationRepository.signUpUser(
        any(that: isNotNull),
        any(that: isNotNull),
        any(that: isNotNull),
        any(that: isNotNull))).thenAnswer((_) async => const Right(tUser));

    final result = await usecase(const SignupParams(
        email: tEmail,
        password: tPassword,
        names: tNames,
        lastNames: tLastNames));

    expect(result, const Right(tUser));
    verify(() => mockAuthenticationRepository.signUpUser(
        tEmail, tPassword, tNames, tLastNames));
  });
}
