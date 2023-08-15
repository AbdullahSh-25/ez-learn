// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String univercityId;
  final String password;
  LoginEvent({
    required this.univercityId,
    required this.password,
  });
}

class SignUpEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String password;
  final String universityId;
  final String avatar;
  SignUpEvent({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.universityId,
    required this.avatar,
  });
}
