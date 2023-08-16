import 'package:ez_learn/generated/assets.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String accessToken;
  final String refreshToken;
  final String avatarUrl;
  final String universityId;
  final int year;

  User({
    required this.firstName,
    required this.lastName,
    required this.accessToken,
    required this.refreshToken,
    required this.id,
    required this.avatarUrl,
    required this.universityId,
    required this.year,
  });

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName ,accessToken: $accessToken, refreshToken: $refreshToken';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'universityId': universityId,
      'avatarUrl': avatarUrl,
      'year': year,
    };
  }

  Map<String, dynamic> toMapForProfile() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'universityId': universityId,
      'avatar': avatarUrl,
      'year': year,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      lastName: map['lastName'] as String,
      firstName: map['firstName'] as String,
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] ?? '',
      avatarUrl: map['avatarUrl'] ?? Assets.imagesBoy1,
      universityId: map['universityId'] as String,
      year: map['year'] ?? 1,
    );
  }

  User copyWith({
    String? accessToken,
    String? refreshToken,
    String? id,
    String? firstName,
    String? lastName,
    String? avatarUrl,
    String? universityId,
    int? year,
  }) {
    return User(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.firstName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      universityId: universityId ?? this.universityId,
      year: year ?? this.year,
    );
  }
}
