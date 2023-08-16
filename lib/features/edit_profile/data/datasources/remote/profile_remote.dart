// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:ez_learn/core/common/network/exception/error_handler.dart';
import 'package:ez_learn/core/constant/src/url.dart';

import 'package:ez_learn/features/auth/domain/entities/user.dart';

abstract class ProfileRemoteDataSource {
  Future<bool> modifyProfile(User user);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio _dio;
  ProfileRemoteDataSourceImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<bool> modifyProfile(User user) {
    return throwDioException(() async {
      await _dio.post(
        AppUrl.modify,
        data: user.toMapForProfile(),
      );
      return true;
    });
  }
}
