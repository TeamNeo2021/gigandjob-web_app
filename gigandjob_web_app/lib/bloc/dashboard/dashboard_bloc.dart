import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    on<DashboardEvent>((event, emit) {
      //I think its better using switch
      if (event is UpdateMeetings) {
        //recojo de BD
        int meetings = 50;
        emit(DashboardState(meetings: meetings));
      }
    });
  }
}
