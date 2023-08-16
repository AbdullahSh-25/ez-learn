// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:either_dart/src/either.dart';

import 'package:ez_learn/core/common/network/exception/error_handler.dart';
import 'package:ez_learn/features/auth/domain/entities/user.dart';
import 'package:ez_learn/features/edit_profile/data/datasources/remote/profile_remote.dart';
import 'package:ez_learn/features/edit_profile/domain/repository/profile_repsitory.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource remote;
  ProfileRepositoryImpl({
    required this.remote,
  });

  @override
  Future<Either<String, bool>> modifyProfile(User user) {
    return throwAppException(() async {
      final response = await remote.modifyProfile(user);
      return response;
    });
  }
}
