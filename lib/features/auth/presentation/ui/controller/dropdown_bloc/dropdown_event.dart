import 'package:equatable/equatable.dart';


class DropDownChangeSelectEvent extends Equatable{
  final String? yearStudy;

  DropDownChangeSelectEvent(this.yearStudy);
  @override
  // TODO: implement props
  List<Object?> get props =>[yearStudy];
}
