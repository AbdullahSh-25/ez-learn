// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'manage_subject_bloc.dart';

class ManageSubjectState {
  Result<List<ManageSubjectModel>> subjectsName;
  Result<List<ManageSubjectModel>> filteredSubjectsName;
  List<String> subjectIds;
  ManageSubjectState({
    this.subjectsName = const Result.init(),
    this.filteredSubjectsName = const Result.init(),
    this.subjectIds = const[],
  });

  ManageSubjectState copyWith({
    Result<List<ManageSubjectModel>>? subjectsName,
    Result<List<ManageSubjectModel>>? filteredSubjectsName,
    List<String>? subjectIds,
  }) {
    return ManageSubjectState(
      subjectsName: subjectsName ?? this.subjectsName,
      filteredSubjectsName: filteredSubjectsName ?? this.filteredSubjectsName,
      subjectIds: subjectIds ?? this.subjectIds,
    );
  }
}
