part of 'home_bloc.dart';

@immutable
class HomeState {
  HomeState({required this.suggesionList, required this.matchText});

  List<String> suggesionList;
  List<String> matchText;
}

class InitialState extends HomeState {
  InitialState()
      : super(
          suggesionList: [],
          matchText: [],
        );
}
