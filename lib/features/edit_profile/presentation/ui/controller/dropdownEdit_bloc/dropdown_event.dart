import 'package:equatable/equatable.dart';


class DropDownChangeSelectEvent extends Equatable{

  const DropDownChangeSelectEvent();
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class DropDownChangeSelect1Event extends DropDownChangeSelectEvent {
  final String? yearStudy;


  const DropDownChangeSelect1Event(this.yearStudy);

  @override
  List<Object> get props => [yearStudy!];
}

class DropDownChangeSelect2Event extends DropDownChangeSelectEvent {
  final String? subject;

  const DropDownChangeSelect2Event( this.subject);

  @override
  List<Object> get props => [subject!];
}



