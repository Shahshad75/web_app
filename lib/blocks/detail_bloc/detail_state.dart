part of 'detail_bloc.dart';

abstract class DetailState {}

final class DetailInitial extends DetailState {}

final class DetailActionState extends DetailState {}

final class IsHoverState1 extends DetailState {
  String url;
  IsHoverState1({required this.url});
}

final class IsHoverState2 extends DetailState {
  String url;
  IsHoverState2({required this.url});
}

final class IsHoverState3 extends DetailState {
  String url;
  IsHoverState3({required this.url});
}

final class IsHoverState4 extends DetailState {
  String url;
  IsHoverState4({required this.url});
}

final class IsHoverFalseState extends DetailState {
 
}
