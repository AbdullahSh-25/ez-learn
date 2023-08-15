// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:either_dart/src/either.dart';
import 'package:ez_learn/core/common/injection/injection.dart';
import 'package:ez_learn/core/common/network/exception/error_handler.dart';

import 'package:ez_learn/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ez_learn/features/auth/data/datasources/local/auth_local.dart';
import 'package:ez_learn/features/auth/data/datasources/local/reactive_token_storage.dart';
import 'package:ez_learn/features/auth/data/models/auth_model.dart';
import 'package:ez_learn/features/auth/domain/entities/signup_param.dart';
import 'package:ez_learn/features/auth/domain/entities/user.dart';
import 'package:ez_learn/features/auth/domain/entities/user_param.dart';
import 'package:ez_learn/features/auth/domain/repositores/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remote;
  final ReactiveTokenStorage reactiveTokenStorage;
  final AuthLocal storageService;

  AuthRepositoryImpl({
    required this.remote,
    required this.reactiveTokenStorage,
    required this.storageService,
  });

  @override
  Future<Either<String, User>> login({required UserParam userParam}) {
    return throwAppException(() async {
      final respnse = await remote.login(userParam: userParam);
      _saveUser(respnse!);
      return respnse;
    });
  }

  @override
  Future<bool> logout() async {
    await storageService.removeUser();
    await reactiveTokenStorage.delete();
    return await getIt<SharedPreferences>().clear();
  }

  _saveUser(User user) {
    reactiveTokenStorage.write(AuthTokenModel(accessToken: user.accessToken, refreshToken: user.refreshToken));
    storageService.setUser(user);
  }

  @override
  Future<Either<String, User>> create({required SignupParam signupParam}) {
    return throwAppException(() async {
      final response = await remote.createUser(signupParam: signupParam);

      _saveUser(response!);
      return response;
    });
  }
}
