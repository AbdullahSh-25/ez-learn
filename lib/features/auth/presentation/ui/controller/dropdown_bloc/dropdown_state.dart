
import 'package:equatable/equatable.dart';



class DropDownChangeSelectState extends Equatable {
  final String? yearStudy;

  DropDownChangeSelectState({this.yearStudy});
  DropDownChangeSelectState copyWith({String? yearStudy}){
    return DropDownChangeSelectState(yearStudy: yearStudy?? this.yearStudy);
  }
  @override
  List<Object?> get props =>[yearStudy];
}
