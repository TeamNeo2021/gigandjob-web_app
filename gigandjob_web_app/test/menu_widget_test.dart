import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gigandjob_web_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:gigandjob_web_app/main.dart';

void main() {
  testWidgets('Menu renders correct widget', (WidgetTester tester) async {
    //Getting widgets
    final homeButton = find.byKey(const ValueKey('homeButton'));

    await tester.pumpWidget(const MyApp());

    await tester.tap(homeButton);

    //check if Dashboard is Rendered
  });
}
