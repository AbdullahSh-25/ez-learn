import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(ChangeIconState( [false, false, false, false]));
  List<bool> isCheck = [false, false, false, false];

  void changePasswordVisibility(int index) {
    isCheck[index] = !isCheck[index];
    emit(ChangeIconState( isCheck));
  }
}
