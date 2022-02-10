import 'package:flutter/material.dart';
import 'package:gigandjob_web_app/Widgets/components/dashboard_content.dart';

class DrawListTitle extends StatelessWidget {
  const DrawListTitle(
      {Key? key, required this.title, required this.svgSrc, required this.tap})
      : super(key: key);

  final String title, svgSrc;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: tap,
      horizontalTitleGap: 0.0,
      title: Text(
        title,
      ),
    );
  }
}
