// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'manage_subject_bloc.dart';

abstract class ManageSubjectEvent {}

class GetAllName extends ManageSubjectEvent {
  final int year;
  final int semester;
  GetAllName({
    required this.year,
    required this.semester,
  });
}

class AddSubjectId extends ManageSubjectEvent {
  final String id;
  AddSubjectId({
    required this.id,
  });
}

class UpserSubjecct extends ManageSubjectEvent {}
