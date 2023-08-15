import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignupParam {
  final String firstName;
  final String lastName;
  final String password;
  final String universityId;
  final String avatar;
  SignupParam({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.universityId,
    required this.avatar,
  });

  SignupParam copyWith({
    String? firstName,
    String? lastName,
    String? password,
    String? universityId,
    String? avatar,
  }) {
    return SignupParam(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      universityId: universityId ?? this.universityId,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'universityId': universityId,
      'avatar': avatar,
    };
  }
}
