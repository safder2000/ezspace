part of 'text_length_bloc.dart';

@immutable
abstract class TextLengthEvent {}

class LenthChanges extends TextLengthEvent {
  LenthChanges({required this.newValue});
  int newValue;
}
