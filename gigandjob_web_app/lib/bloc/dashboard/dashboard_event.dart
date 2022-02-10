part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class UpdateDashboard extends DashboardEvent {
  UpdateDashboard();
}
