import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gigandjob_web_app/Widgets/dashboard_card.dart';

void main() {
  test(
      'Instantiation of DashboardCard with negative sizemultiplier should throw exception',
      () {
    expect(() {
      DashboardCard(label: 'testing', number: 0, sizemultiplier: -1);
    }, throwsException);
  });
}
