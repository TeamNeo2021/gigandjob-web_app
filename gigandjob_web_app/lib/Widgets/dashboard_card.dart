import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LineSeparator extends StatelessWidget {
  const LineSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.4,
        heightFactor: 1,
        child: Container(
            height: 2,
            color: Colors.blue.withOpacity(0.4),
            margin: const EdgeInsets.symmetric(vertical: 10)));
  }
}

class DashboardCard extends StatelessWidget {
  final int number;

  const DashboardCard({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        width: 200,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(4),
              alignment: Alignment.topLeft,
              child: const Text('Meetings'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    child: const Icon(Icons.verified)),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: const Text('13'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
