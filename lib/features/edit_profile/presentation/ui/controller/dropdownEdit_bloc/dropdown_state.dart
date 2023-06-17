
import 'package:equatable/equatable.dart';



class DropdownChangeSelectState extends Equatable {

  final String? subject;
  final String? yearStudy;
  const DropdownChangeSelectState({this.subject, this.yearStudy,}  );
  DropdownChangeSelectState copyWith({String? yearStudy,  String? subject}){
    return DropdownChangeSelectState(subject: subject?? this.subject,yearStudy:yearStudy??this.yearStudy);
  }
  @override
  List<Object?> get props =>[yearStudy,subject];
}
