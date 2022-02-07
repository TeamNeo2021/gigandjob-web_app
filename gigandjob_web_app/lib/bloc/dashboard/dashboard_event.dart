part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class UpdateMeetings extends DashboardEvent {
  UpdateMeetings();
}

class UpdateUsers extends DashboardEvent {
  final int number;

  UpdateUsers(this.number);
}

class UpdateEmployers extends DashboardEvent {
  final int number;

  UpdateEmployers(this.number);
}
