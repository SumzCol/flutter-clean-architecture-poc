import 'dart:convert';

import 'package:flutter_clean_architecture_poc/features/authentication/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

main() {
  late UserModel tUserModel = const UserModel(
      email: "test@test.com", names: "Juan Manuel", lastNames: "Lovera");
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
    test('should return a valid model', () async {});
  });

  group('toEntity', () {
    test('should return a valid User entity', () async {});
  });
}
