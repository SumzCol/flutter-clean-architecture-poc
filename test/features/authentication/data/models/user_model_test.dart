import 'dart:convert';
import 'dart:math';

import 'package:flutter_clean_architecture_poc/features/authentication/data/models/user_model.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

main() {
  const String tEmail = "test@test.com";
  const String tNames = "Juan Manuel";
  const String tLastNames = "Lovera";

  late UserModel tUserModel =
      const UserModel(email: tEmail, names: tNames, lastNames: tLastNames);
  late User tUser =
      const User(email: tEmail, names: tNames, lastNames: tLastNames);
  final Map<String, dynamic> jsonMap =
      json.decode(fixture('authentication/user.json'));

  group('fromJson', () {
    test('should return a valid model', () async {
      final result = UserModel.fromJson(jsonMap);

      expect(result, tUserModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map with the proper data', () async {
      final result = tUserModel.toJson();

      expect(result, jsonMap);
    });
  });

  group('fromEntity', () {
    test('should return a valid model', () async {
      final result = UserModel.fromEntity(tUser);

      expect(result, tUserModel);
    });
  });

  group('toEntity', () {
    test('should return a valid User entity', () async {
      final result = tUserModel.toEntity();

      expect(result, tUser);
    });
  });
}
