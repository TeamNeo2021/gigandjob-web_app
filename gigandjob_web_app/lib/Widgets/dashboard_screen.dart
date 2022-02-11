import 'package:flutter/material.dart';
import 'package:gigandjob_web_app/Views/dashboard.dart';
import 'package:gigandjob_web_app/Widgets/components/dashboard_content.dart';
import 'package:gigandjob_web_app/Widgets/components/dashboards.dart';
import 'package:gigandjob_web_app/Widgets/components/drawer_menu.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key, required this.opcion_nav}) : super(key: key);

  final String opcion_nav;
//Navegacion lateral
  @override
  Widget build(BuildContext context) {
    if (opcion_nav == "home") {
      return dashboards(opcion_nav: "home");
    } else if (opcion_nav == "CreateEmployer") {
      return dashboards(opcion_nav: "CreateEmployer");
    } else if (opcion_nav == "CreateCandidate") {
      return dashboards(opcion_nav: "CreateCandidate");
    } else
      return dashboards(opcion_nav: "home");
  }
}
