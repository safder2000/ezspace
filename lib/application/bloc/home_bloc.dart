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
        emit(HomeState(suggesionList: suggestons));
      } catch (e) {
        print(e);
      }
    });
  }
}
