import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserParam {
  final String universcityId;
  final String password;
  UserParam({
    required this.universcityId,
    required this.password,
  });

  UserParam copyWith({
    String? universcityId,
    String? password,
  }) {
    return UserParam(
      universcityId: universcityId ?? this.universcityId,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'universityId': universcityId,
      'password': password,
    };
  }
}
