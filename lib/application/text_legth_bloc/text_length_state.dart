part of 'text_length_bloc.dart';

@immutable
class TextLengthState {
  TextLengthState({required this.totalChar});

  int totalChar;
}

class InitialState extends TextLengthState {
  InitialState() : super(totalChar: 0);
}
