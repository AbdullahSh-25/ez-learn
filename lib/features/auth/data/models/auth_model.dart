import 'package:dio_refresh_bot/dio_refresh_bot.dart';

class AuthTokenModel extends AuthToken
// implements Equatable
{
  const AuthTokenModel({
    required String accessToken,
    String? refreshToken,
  }) : super(accessToken: accessToken, refreshToken: refreshToken);

  @override
  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'tokenType': refreshToken,
    };
  }

  factory AuthTokenModel.fromMap(Map<String, dynamic> data) {
    return AuthTokenModel(
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthTokenModel &&
          runtimeType == other.runtimeType &&
          accessToken == other.accessToken &&
          refreshToken == other.refreshToken &&
          tokenType == other.tokenType;

  @override
  int get hashCode => accessToken.hashCode;
}