part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchSuggesions extends HomeEvent {}

class MatchingText extends HomeEvent {
  MatchingText({required this.text});
  String text;
}
