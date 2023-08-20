import 'package:dio/dio.dart';
import 'package:ez_learn/core/common/injection/injection.dart';
import 'package:ez_learn/features/subject/application/subject_facade.dart';
import 'package:ez_learn/features/subject/data/datasources/remote/subject_remote_datasource.dart';
import 'package:ez_learn/features/subject/data/subject_repo_impl/subject_repo_impl.dart';
import 'package:ez_learn/features/subject/domain/repository/subject_repository.dart';
import 'package:ez_learn/features/subject/presentation/state/bloc/subject_bloc.dart';

subject() {
  getIt.registerSingleton<SubjectRemoteDataSource>(
    SubjectRemoteDataSourceImpl(
      dio: getIt<Dio>(),
    ),
  );

  //repo
  getIt.registerSingleton<SubjectRepository>(
    SubjectRepoImpl(
      remote: getIt<SubjectRemoteDataSource>(),
    ),
  );

  //application
  getIt.registerSingleton<SubjectFacade>(
    SubjectFacade(remote: getIt<SubjectRepository>())
  );

  //state
  getIt.registerFactory<SubjectBloc>(() => SubjectBloc(facade: getIt<SubjectFacade>()));
}
