import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String names;
  final String lastNames;

  const User(
      {required this.email,
      required this.names,
      required this.lastNames});

  @override
  List<Object?> get props => [email, names, lastNames];
}
