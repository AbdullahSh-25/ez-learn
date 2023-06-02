import 'package:equatable/equatable.dart';


class OnBoardingState extends Equatable {
  @override
   int currentPage ;
 OnBoardingState({this.currentPage=0});
  @override
  List<Object> get props => [currentPage];
}