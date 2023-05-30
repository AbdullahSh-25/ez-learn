import 'package:bloc/bloc.dart';
import 'package:ez_learn/core/constant/strings/app_string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dropdown_event.dart';
import 'dropdown_state.dart';



class DropDownBloc extends Bloc<DropDownChangeSelectEvent, DropDownChangeSelectState> {
  static DropDownBloc get(context) => BlocProvider.of(context);
  DropDownBloc() : super(DropDownChangeSelectState()) {
    on<DropDownChangeSelectEvent>(_changeSelectionItem);
  }

  var listYear=const[
    AppString.year1,
    AppString.year2,
    AppString.year3,
    AppString.year4,
    AppString.year5,
  ];
  Future<void> _changeSelectionItem(DropDownChangeSelectEvent event, Emitter<DropDownChangeSelectState> emit) async{
    emit(state.copyWith(yearStudy: event.yearStudy));
  }
}
