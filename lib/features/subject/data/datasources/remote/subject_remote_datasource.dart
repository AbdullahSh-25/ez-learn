// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:ez_learn/core/common/network/exception/error_handler.dart';
import 'package:ez_learn/core/constant/src/url.dart';
import 'package:ez_learn/features/subject/data/model/subject_model.dart';

abstract class SubjectRemoteDataSource {
  Future<List<SubjectModel>> getMySubject();
}

class SubjectRemoteDataSourceImpl extends SubjectRemoteDataSource {
  final Dio dio;
  SubjectRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<List<SubjectModel>> getMySubject() {
    return throwDioException(() async {
      final response = await dio.get(AppUrl.getMySubjects);
      return (response.data['response'] as List).map((e) => SubjectModel.fromMap(e)).toList();
    });
  }
}
