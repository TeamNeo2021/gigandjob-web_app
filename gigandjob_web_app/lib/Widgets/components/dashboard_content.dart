import 'package:flutter/material.dart';
import 'package:gigandjob_web_app/Views/candidate_create.dart';
import 'package:gigandjob_web_app/Views/create_candidate/create_candidate_view.dart';
import 'package:gigandjob_web_app/Views/dashboard.dart';
import 'package:gigandjob_web_app/Views/create_employer/create_employer_view.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key, required this.opcion_nav})
      : super(key: key);

  final String opcion_nav;
  @override
  Widget build(BuildContext context) {
    if (opcion_nav == "home") {
      return SafeArea(child: const Dashboard());
    } else if (opcion_nav == "CreateEmployer") {
      return SafeArea(child: CreateEmployerView());
    } else if (opcion_nav == "CreateCandidate") {
      return SafeArea(child: CreateCandidateView());
    } else {
      return SafeArea(child: const Dashboard());
    }
  }
}
