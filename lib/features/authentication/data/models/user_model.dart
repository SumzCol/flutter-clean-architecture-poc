import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_poc/features/authentication/domain/entities/user.dart';

class UserModel extends Equatable {
  final String email;
  final String names;
  final String lastNames;

  const UserModel(
      {required this.email, required this.names, required this.lastNames});

  factory UserModel.fromJson(Map<String, dynamic> jsonString) {
    return UserModel(
        email: jsonString['email'],
        names: jsonString['names'],
        lastNames: jsonString['lastNames']);
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
        email: user.email, names: user.names, lastNames: user.lastNames);
  }

  Map<String, dynamic> toJson() {
    return {"email": email, "names": names, "lastNames": lastNames};
  }

  @override
  List<Object?> get props => [email, names, lastNames];
}
