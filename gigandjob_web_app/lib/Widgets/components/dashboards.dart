import 'package:flutter/material.dart';
import 'package:gigandjob_web_app/Widgets/components/drawer_menu.dart';
import 'package:gigandjob_web_app/Widgets/components/dashboard_content.dart';

class dashboards extends StatelessWidget {
  const dashboards({Key? key, required this.opcion_nav}) : super(key: key);

  final String opcion_nav;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Dashboard')),
        body: SafeArea(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: DrawerMenu()),
          Expanded(flex: 5, child: DashboardContent(opcion_nav: opcion_nav))
        ])));
  }
}
