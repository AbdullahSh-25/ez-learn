import 'package:dio/dio.dart';
import 'package:ez_learn/core/common/injection/injection.dart';
import 'package:ez_learn/core/common/utils/storage_service.dart';
import 'package:ez_learn/features/auth/application/auth_facade.dart';
import 'package:ez_learn/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ez_learn/features/auth/data/datasources/local/auth_local.dart';
import 'package:ez_learn/features/auth/data/datasources/local/reactive_token_storage.dart';
import 'package:ez_learn/features/auth/data/repositores/auth_repository_impl.dart';
import 'package:ez_learn/features/auth/domain/repositores/auth_repository.dart';
import 'package:ez_learn/features/auth/presentation/state/bloc/auth_bloc.dart';

authInjection() {
  getIt.registerSingleton<AuthLocal>(AuthLocal(local: getIt<StorageService<SharedStorage>>()));

  //remote
  getIt.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSourceImpl(
      dio: getIt<Dio>(),
    ),
  );

  // repo
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      remote: getIt<AuthRemoteDataSource>(),
      reactiveTokenStorage: getIt<ReactiveTokenStorage>(),
      storageService: getIt<AuthLocal>(),
    ),
  );

  //facade
  getIt.registerSingleton<AuthFacade>(
    AuthFacade(
      remote: getIt<AuthRepository>(),
    ),
  );

  //state
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      facade: getIt<AuthFacade>(),
    ),
  );
}
