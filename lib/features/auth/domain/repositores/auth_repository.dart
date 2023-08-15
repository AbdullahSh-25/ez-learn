import 'package:either_dart/either.dart';
import 'package:ez_learn/features/auth/domain/entities/signup_param.dart';
import 'package:ez_learn/features/auth/domain/entities/user.dart';
import 'package:ez_learn/features/auth/domain/entities/user_param.dart';

abstract class AuthRepository {
  AuthRepository();

  Future<Either<String, User>> login({
    required UserParam userParam,
  });

  Future<Either<String, User>> create({
    required SignupParam signupParam,
  });

  Future<bool> logout();
}
