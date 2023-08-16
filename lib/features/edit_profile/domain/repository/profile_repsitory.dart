import 'package:either_dart/either.dart';
import 'package:ez_learn/features/auth/domain/entities/user.dart';

abstract class ProfileRepository {
  Future<Either<String, bool>> modifyProfile(User user);
}
