import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ez_learn/core/result_builder/result.dart';
import 'package:ez_learn/core/result_builder/result_builder.dart';
import 'package:ez_learn/features/subject/application/subject_facade.dart';
import 'package:ez_learn/features/subject/data/model/subject_model.dart';

part 'subject_event.dart';
part 'subject_state.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  final SubjectFacade _facade;

  SubjectBloc({required SubjectFacade facade})
      : _facade = facade,
        super(SubjectState()) {
    on<SubjectEvent>((event, emit) async {
      if (event is GetMySubject) {
        await getMySubject(event, emit);
      }
    });
  }

  getMySubject(GetMySubject event, Emitter<SubjectState> emit) async {
    emit(state.copyWith(mySubject: const Result.loading()));
    final result = await _facade.getMySubject();
    result.fold(
      (left) {
        emit(state.copyWith(mySubject: Result.error(error: left)));
      },
      (right) => emit(state.copyWith(mySubject: Result.loaded(data: right))),
    );
  }
}
