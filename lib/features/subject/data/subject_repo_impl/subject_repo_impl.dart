// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:either_dart/either.dart';

import 'package:ez_learn/core/common/network/exception/error_handler.dart';
import 'package:ez_learn/features/subject/data/datasources/remote/subject_remote_datasource.dart';
import 'package:ez_learn/features/subject/data/model/subject_model.dart';
import 'package:ez_learn/features/subject/domain/repository/subject_repository.dart';

class SubjectRepoImpl extends SubjectRepository {
  final SubjectRemoteDataSource remote;
  SubjectRepoImpl({
    required this.remote,
  });

  @override
  Future<Either<String, List<SubjectModel>>> getMySubject() async {
    return throwAppException(() async {
      final response = await remote.getMySubject();
      return response;
    });
  }
}
