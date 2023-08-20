// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:either_dart/either.dart';
import 'package:ez_learn/features/subject/data/model/subject_model.dart';
import 'package:ez_learn/features/subject/domain/repository/subject_repository.dart';

class SubjectFacade {
  final SubjectRepository remote;
  SubjectFacade({
    required this.remote,
  });

  Future<Either<String, List<SubjectModel>>> getMySubject() async => await remote.getMySubject();
}
