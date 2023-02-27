import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ezspace/infrastrecture/fetch_Job_designations.dart';
import 'package:ezspace/model/job_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitialState()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchSuggesions>((event, emit) async {
      try {
        List<String> suggestons =
            await JobDesesignationRepo.fetchDesignations();
        log(suggestons.toString());
        emit(HomeState(suggesionList: suggestons, matchText: state.matchText));
      } catch (e) {
        print(e);
      }
    });
    on<MatchingText>((event, emit) {
      List<String> matches = <String>[];
      matches.addAll(state.suggesionList);

      matches.retainWhere((s) {
        return s.toLowerCase().contains(event.text.toLowerCase());
      });
      emit(HomeState(suggesionList: state.suggesionList, matchText: matches));
    });
  }
}
