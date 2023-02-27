import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'text_length_event.dart';
part 'text_length_state.dart';

class TextLengthBloc extends Bloc<TextLengthEvent, TextLengthState> {
  TextLengthBloc() : super(InitialState()) {
    on<TextLengthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LenthChanges>((event, emit) {
      emit(TextLengthState(totalChar: event.newValue));
    });
  }
}
