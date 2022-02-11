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
              key: const Key('homeButton'),
              title: "home",
              svgSrc: "logo",
              tap: () {
                Navigator.pushNamed(context, "dashboard_screen");
              }),
          DrawListTitle(
              title: "Administrate CVs",
              svgSrc: "logo",
              tap: () {
                Navigator.pushNamed(context, "candidate_create");
              }),
          DrawListTitle(
              title: "Administrate Meetings", svgSrc: "logo", tap: () {}),
          DrawListTitle(
              title: "Administrate Candidates", svgSrc: "logo", tap: () {}),
          DrawListTitle(
              key: const Key('createEmployerButton'),
              title: "Create Employer",
              svgSrc: "logo",
              tap: () {
                Navigator.pushNamed(context, "create_employer_view");
              }),
          DrawListTitle(
              title: "Administrate Employer", svgSrc: "logo", tap: () {}),
          DrawListTitle(title: "Create Offer", svgSrc: "logo", tap: () {}),
          DrawListTitle(
              title: "List Applicants offer", svgSrc: "logo", tap: () {}),
          DrawListTitle(title: "List Meetings", svgSrc: "logo", tap: () {}),
        ],
      ),
    );
  }
}
