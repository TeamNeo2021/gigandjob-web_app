import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_web_app/Dominio/Services/candidateService.dart';
import 'package:gigandjob_web_app/Utils/BlocObserver.dart';
import 'package:gigandjob_web_app/Views/create_candidate/bloc/candidateBloc.dart';
import 'package:gigandjob_web_app/Views/create_candidate/create_candidate_view.dart';
import 'Dominio/Repositories/CandidateRepository.dart';
import 'Widgets/layout.dart';
import 'package:gigandjob_web_app/Dominio/Services/employer_service.dart';
import 'package:gigandjob_web_app/Views/create_employer/create_employer_view.dart';
import 'Dominio/Repositories/employer_repository.dart';
import 'Views/create_employer/bloc/employer_cubit.dart';
import 'Widgets/layout.dart';
import 'package:gigandjob_web_app/Views/dashboard.dart';
import 'package:gigandjob_web_app/Widgets/components/dashboards.dart';
import 'package:gigandjob_web_app/Widgets/dashboard_screen.dart';
import 'package:gigandjob_web_app/bloc/dashboard/dashboard_bloc.dart';

Future<void> main() async {
  await BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }, blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => DashboardBloc()..add(UpdateDashboard())),
          BlocProvider(
              create: (_) => EmployerCubit(repository: EmployerService())),
          BlocProvider(
              create: (_) => CandidateCubit(repository: CandidateService()))
        ],
        child: MaterialApp(
          routes: {
            "dashboard_screen": (context) =>
                DashboardScreen(opcion_nav: "home"),
            "candidate_create": (context) =>
                DashboardScreen(opcion_nav: "CreateCandidate"),
            "create_employer_view": (context) => DashboardScreen(
                  opcion_nav: "CreateEmployer",
                ),
            "create_candidate_view": (context) => DashboardScreen(
                  opcion_nav: "CreateCandidate",
                )
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(body: DashboardScreen(opcion_nav: "home")),
        ));
  }
}
