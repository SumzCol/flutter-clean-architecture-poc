import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_clean_architecture_poc/core/error/exception.dart';
import 'package:flutter_clean_architecture_poc/core/error/failures.dart';
import 'package:flutter_clean_architecture_poc/core/network/network_info.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/data/datasources/authentication_local_data_source.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/data/models/user_model.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationLocalDataSource extends Mock
    implements AuthenticationLocalDataSource {}

class MockAuthenticationRemoteDataSource extends Mock
    implements AuthenticationRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

main() {
  Faker faker = Faker();

  late AuthenticationRepositoryImpl repository;
  late MockAuthenticationRemoteDataSource mockRemote;
  late MockAuthenticationLocalDataSource mockLocal;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemote = MockAuthenticationRemoteDataSource();
    mockLocal = MockAuthenticationLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AuthenticationRepositoryImpl(
        remote: mockRemote, local: mockLocal, networkInfo: mockNetworkInfo);
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  String tEmail = faker.internet.email();
  String tPassword = faker.internet.password();
  String tNames = faker.person.name();
  String tLastNames = faker.person.lastName();
  UserModel tUserModel =
      UserModel(email: tEmail, names: tNames, lastNames: tLastNames);
  User tUser = User(email: tEmail, names: tNames, lastNames: tLastNames);

  group('loginUser', () {
    runTestsOnline(() {
      test('should check if the device is online', () async {
        when(() => mockRemote.loginUser(
                any(that: isNotNull), any(that: isNotNull)))
            .thenAnswer((_) async => tUserModel);

        await repository.loginUser(tEmail, tPassword);

        verify(() => mockNetworkInfo.isConnected);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        when(() => mockRemote.loginUser(
                any(that: isNotNull), any(that: isNotNull)))
            .thenAnswer((_) async => tUserModel);

        final result = await repository.loginUser(tEmail, tPassword);

        verify(() => mockRemote.loginUser(tEmail, tPassword));
        expect(result, Right(tUser));
      });

      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        when(() => mockRemote.loginUser(
                any(that: isNotNull), any(that: isNotNull)))
            .thenAnswer((_) async => tUserModel);

        await repository.loginUser(tEmail, tPassword);

        verify(() => mockRemote.loginUser(tEmail, tPassword));
        verify(() => mockLocal.cacheUser(tUserModel));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        when(() => mockRemote.loginUser(
                any(that: isNotNull), any(that: isNotNull)))
            .thenThrow(ServerException());

        final result = await repository.loginUser(tEmail, tPassword);

        verify(() => mockRemote.loginUser(tEmail, tPassword));
        verifyZeroInteractions(mockLocal);
        expect(result, Left(ServerFailure()));
      });
    });

    runTestsOffline(() {
      test(
          'should return last locally cached data when the cached data is present',
          () async {
        when(() => mockLocal.getLastUser()).thenAnswer((_) async => tUserModel);

        final result = await repository.loginUser(tEmail, tPassword);

        verifyZeroInteractions(mockRemote);
        verify(() => mockLocal.getLastUser());
        expect(result, Right(tUser));
      });

      test('should return CacheFailure when there is no cached data present',
          () async {
        when(() => mockLocal.getLastUser()).thenThrow(CacheException());

        final result = await repository.loginUser(tEmail, tPassword);

        verifyZeroInteractions(mockRemote);
        verify(() => mockLocal.getLastUser());
        expect(result, Left(CacheFailure()));
      });
    });
  });

  group('signUpUser', () {
    runTestsOnline(() {
      test('should check if the device is online', () async {
        when(() => mockRemote.signUpUser(
            any(that: isNotNull),
            any(that: isNotNull),
            any(that: isNotNull),
            any(that: isNotNull))).thenAnswer((_) async => tUserModel);

        await repository.signUpUser(tEmail, tPassword, tNames, tLastNames);

        verify(() => mockNetworkInfo.isConnected);
      });
      
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        when(() => mockRemote.signUpUser(
            any(that: isNotNull),
            any(that: isNotNull),
            any(that: isNotNull),
            any(that: isNotNull))).thenAnswer((_) async => tUserModel);

        final result =
            await repository.signUpUser(tEmail, tPassword, tNames, tLastNames);

        verify(
            () => mockRemote.signUpUser(tEmail, tPassword, tNames, tLastNames));
        expect(result, Right(tUser));
      });

      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        when(() => mockRemote.signUpUser(
            any(that: isNotNull),
            any(that: isNotNull),
            any(that: isNotNull),
            any(that: isNotNull))).thenAnswer((_) async => tUserModel);

        await repository.signUpUser(tEmail, tPassword, tNames, tLastNames);

        verify(
            () => mockRemote.signUpUser(tEmail, tPassword, tNames, tLastNames));
        verify(() => mockLocal.cacheUser(tUserModel));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        when(() => mockRemote.signUpUser(
            any(that: isNotNull),
            any(that: isNotNull),
            any(that: isNotNull),
            any(that: isNotNull))).thenThrow(ServerException());

        final result =
            await repository.signUpUser(tEmail, tPassword, tNames, tLastNames);

        verify(
            () => mockRemote.signUpUser(tEmail, tPassword, tNames, tLastNames));
        verifyZeroInteractions(mockLocal);
        expect(result, Left(ServerFailure()));
      });
    });

    runTestsOffline(() {
      test(
          'should return last locally cached data when the cached data is present',
          () async {
        when(() => mockLocal.getLastUser()).thenAnswer((_) async => tUserModel);

        final result =
            await repository.signUpUser(tEmail, tPassword, tNames, tLastNames);

        verifyZeroInteractions(mockRemote);
        verify(() => mockLocal.getLastUser());
        expect(result, Right(tUser));
      });

      test('should return CacheFailure when there is no cached data present',
          () async {
        when(() => mockLocal.getLastUser()).thenThrow(CacheException());

        final result =
            await repository.signUpUser(tEmail, tPassword, tNames, tLastNames);

        verifyZeroInteractions(mockRemote);
        verify(() => mockLocal.getLastUser());
        expect(result, Left(CacheFailure()));
      });
    });
  });
}
