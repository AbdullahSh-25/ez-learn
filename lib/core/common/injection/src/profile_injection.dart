import 'package:dio/dio.dart';
import 'package:ez_learn/core/common/injection/injection.dart';
import 'package:ez_learn/features/edit_profile/application/profile_facade.dart';
import 'package:ez_learn/features/edit_profile/data/datasources/remote/profile_remote.dart';
import 'package:ez_learn/features/edit_profile/data/profile_repo_impl/profile_repo_impl.dart';
import 'package:ez_learn/features/edit_profile/domain/repository/profile_repsitory.dart';
import 'package:ez_learn/features/edit_profile/presentation/ui/state/bloc/profile_bloc.dart';

profileInjection() {
  //remote
  getIt.registerSingleton<ProfileRemoteDataSource>(
    ProfileRemoteDataSourceImpl(
      dio: getIt<Dio>(),
    ),
  );

  //repo
  getIt.registerSingleton<ProfileRepository>(
    ProfileRepositoryImpl(
      remote: getIt<ProfileRemoteDataSource>(),
    ),
  );

  //application
  getIt.registerSingleton<ProfileFacade>(
    ProfileFacade(
      remote: getIt<ProfileRepository>(),
    ),
  );

  //state
  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(
      facade: getIt<ProfileFacade>(),
    ),
  );
}
