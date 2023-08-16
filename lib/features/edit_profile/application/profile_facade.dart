import 'package:either_dart/either.dart';
import 'package:ez_learn/features/auth/domain/entities/user.dart';
import 'package:ez_learn/features/edit_profile/domain/repository/profile_repsitory.dart';

class ProfileFacade {
  final ProfileRepository remote;
  ProfileFacade({required this.remote});

  Future<Either<String, bool>> modifyProfile(User user) => remote.modifyProfile(user);
}
