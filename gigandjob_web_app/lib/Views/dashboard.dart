import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_web_app/Widgets/dashboard_card.dart';
import 'package:gigandjob_web_app/bloc/dashboard/dashboard_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => DashboardBloc())],
        child: const Center(child: DashboardCard(number: 0)));
  }
}
