import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_web_app/Widgets/dashboard_card.dart';
import 'package:gigandjob_web_app/bloc/dashboard/dashboard_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    final dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    return GridView.count(crossAxisCount: 3, children: [
      Center(child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return DashboardCard(
              label: 'Today`s meetings', number: state.meetings);
        },
      )),
      Center(child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return DashboardCard(
              label: 'Registered employers', number: state.employers);
        },
      )),
      Center(child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return DashboardCard(label: 'Registered users', number: state.users);
        },
      ))
    ]);
  }
}
