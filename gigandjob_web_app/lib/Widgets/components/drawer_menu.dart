import 'package:flutter/material.dart';
import 'package:gigandjob_web_app/Views/dashboard.dart';
import 'package:gigandjob_web_app/Widgets/components/drawer_list_title.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawListTitle(
              title: "home",
              svgSrc: "logo",
              tap: () {
                Navigator.pushNamed(context, "dashboard_screen");
              }),
          DrawListTitle(
              title: "Create cndidate",
              svgSrc: "logo",
              tap: () {
                Navigator.pushNamed(context, "create_candidate_view");
              }),
          DrawListTitle(
              title: "Create Employer",
              svgSrc: "logo",
              tap: () {
                Navigator.pushNamed(context, "create_employer_view");
              }),
        ],
      ),
    );
  }
}
