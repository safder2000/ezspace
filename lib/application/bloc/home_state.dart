part of 'home_bloc.dart';

@immutable
class HomeState {
  HomeState({required this.suggesionList});

  List<String> suggesionList;
}

class InitialState extends HomeState {
  InitialState()
      : super(
          suggesionList: [],
        );
}
