// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:ez_learn/core/common/network/exception/error_handler.dart';
import 'package:ez_learn/core/constant/src/url.dart';
import 'package:ez_learn/features/auth/domain/entities/signup_param.dart';

import 'package:ez_learn/features/auth/domain/entities/user.dart';
import 'package:ez_learn/features/auth/domain/entities/user_param.dart';

abstract class AuthRemoteDataSource {
  Future<User?> login({required UserParam userParam});
  Future<User?> createUser({required SignupParam signupParam});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  AuthRemoteDataSourceImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<User?> login({required UserParam userParam}) {
    return throwDioException(() async {
      final response = await _dio.post(
        AppUrl.login,
        data: await userParam.toMap(),
      );
      return User.fromMap(response.data['response']);
    });
  }

  @override
  Future<User?> createUser({required SignupParam signupParam}) {
    return throwDioException(() async {
      final response = await _dio.post(
        AppUrl.create,
        data: signupParam.toMap(),
      );
      return User.fromMap(response.data['response']);
    });
  }
}
