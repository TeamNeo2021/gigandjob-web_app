// ignore_for_file: unnecessary_const, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final int number;
  final String label;
  double sizemultiplier;

  DashboardCard(
      {Key? key,
      required this.label,
      required this.number,
      this.sizemultiplier = 1})
      : super(key: key) {
    if (sizemultiplier < 1) {
      throw Exception('size multiplier cannot be negative');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 120 * sizemultiplier,
        width: 200 * sizemultiplier,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(6 * sizemultiplier),
              padding: EdgeInsets.all(8 * sizemultiplier),
              alignment: Alignment.topLeft,
              child: Text(label),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 4 * sizemultiplier,
                            horizontal: 4 * sizemultiplier),
                        child: Icon(
                          Icons.trending_up_rounded,
                          size: 30 * sizemultiplier,
                        ))),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12 * sizemultiplier),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 4 * sizemultiplier,
                          horizontal: 4 * sizemultiplier),
                      child: Text(
                        number.toString(),
                        style: TextStyle(fontSize: 80 * sizemultiplier / 2),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
