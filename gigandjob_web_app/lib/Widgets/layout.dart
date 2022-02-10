import 'package:flutter/material.dart';

class GigAndJobLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const GigAndJobLayout({
    required this.title,
    required this.child,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      backgroundColor: const Color(0xFFE2E2E2),
      body: child,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
