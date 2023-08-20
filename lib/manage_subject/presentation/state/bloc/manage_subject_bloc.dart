import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:ez_learn/core/common/injection/injection.dart';
import 'package:ez_learn/core/common/network/exception/error_handler.dart';
import 'package:ez_learn/core/constant/src/url.dart';
import 'package:ez_learn/core/result_builder/result.dart';
import 'package:ez_learn/manage_subject/data/manage_subject_model.dart';

part 'manage_subject_event.dart';
part 'manage_subject_state.dart';

class ManageSubjectBloc extends Bloc<ManageSubjectEvent, ManageSubjectState> {
  ManageSubjectBloc() : super(ManageSubjectState()) {
    on<ManageSubjectEvent>((event, emit) async {
      if (event is GetAllName) {
        await getAllName(event, emit);
      } else if (event is AddSubjectId) {
        await addSubjectId(event, emit);
      } else if (event is UpserSubjecct) {
        await upserSubject(event, emit);
      }
    });
  }

  getAllName(GetAllName event, Emitter<ManageSubjectState> emit) async {
    emit(state.copyWith(filteredSubjectsName: const Result.loading()));
    final result = await throwAppException(() async {
      final response = await throwDioException(() async {
        final res = await getIt<Dio>().get(AppUrl.getAllNameSubject);
        return (res.data['response'] as List).map((e) => ManageSubjectModel.fromMap(e)).toList();
      });
      return response;
    });
    result.fold(
      (left) {
        emit(state.copyWith(
          filteredSubjectsName: Result.error(error: left),
          subjectsName: Result.error(error: left),
        ));
      },
      (right) {
        emit(
          state.copyWith(
            subjectsName: Result.loaded(data: right),
            filteredSubjectsName: Result.loaded(
                data: (right as List<ManageSubjectModel>)
                    .where((element) => element.year == event.year && element.semester == event.semester)
                    .toList()),
          ),
        );
      },
    );
  }

  addSubjectId(AddSubjectId event, Emitter<ManageSubjectState> emit) async {
    emit(state.copyWith(
      subjectIds: List.from(state.subjectIds)..add(event.id),
      filteredSubjectsName: state.filteredSubjectsName,
      subjectsName: state.filteredSubjectsName,
    ));
  }

  upserSubject(UpserSubjecct event, Emitter<ManageSubjectState> emit) async {
    BotToast.showLoading();
    final result = await throwAppException(() async {
      final response = await throwDioException(() async {
        final res = await getIt<Dio>().post(
          AppUrl.upsertSubject,
          data: {
            'subjectsIds': state.subjectIds,
          },
        );
        return true;
      });
      return response;
    });
    result.fold(
      (left) => BotToast.showText(text: 'حدث خطأ ما'),
      (right) => BotToast.showText(text: 'تم الاختيار بنجاح'),
    );
    BotToast.closeAllLoading();
  }
}
