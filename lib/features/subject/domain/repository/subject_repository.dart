import 'package:either_dart/either.dart';
import 'package:ez_learn/features/subject/data/model/subject_model.dart';

abstract class SubjectRepository {
  Future<Either<String,List<SubjectModel>>> getMySubject();
}
