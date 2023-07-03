part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class ChangeIconState extends QuizState {
 final List<bool> isCheck;

  ChangeIconState(this.isCheck);
}

