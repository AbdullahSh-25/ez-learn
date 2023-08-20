// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'subject_bloc.dart';

class SubjectState {
  Result<List<SubjectModel>> mySubject;
  SubjectState({
    this.mySubject = const Result.init(),
  });

  SubjectState copyWith({
    Result<List<SubjectModel>>? mySubject,
  }) {
    return SubjectState(
      mySubject: mySubject ?? this.mySubject,
    );
  }
}
