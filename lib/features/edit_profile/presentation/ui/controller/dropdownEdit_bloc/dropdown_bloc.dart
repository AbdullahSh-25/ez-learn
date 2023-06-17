import 'package:bloc/bloc.dart';
import 'package:ez_learn/core/constant/strings/app_string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dropdown_event.dart';
import 'dropdown_state.dart';



class DropdownBloc extends Bloc<DropDownChangeSelectEvent, DropdownChangeSelectState> {
  static DropdownBloc get(context) => BlocProvider.of(context);
  DropdownBloc() : super(DropdownChangeSelectState()) {
    on<DropDownChangeSelect1Event>(_changeSelectionItem1);
    on<DropDownChangeSelect2Event>(_changeSelectionItem2);
  }

  var listItem1=const[
    AppString.year1,
    AppString.year2,
    AppString.year3,
    AppString.year4,
    AppString.year5,
  ];
  var listItem2=const[
    'هندسة برمجيات',
    'نظم تشغيل',
    'شبكات عصبونية',
  ];
  Future<void> _changeSelectionItem1(DropDownChangeSelect1Event event, Emitter<DropdownChangeSelectState> emit) async{
    emit(state.copyWith(yearStudy: event.yearStudy));
  }
  Future<void> _changeSelectionItem2(DropDownChangeSelect2Event event, Emitter<DropdownChangeSelectState> emit) async{
    emit(state.copyWith(subject: event.subject));
  }
}
