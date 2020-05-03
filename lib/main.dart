import 'package:flutter/material.dart';
import 'package:quiz/landing_page.dart';

void main() {
  runApp(Root());
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(brightness: MediaQuery.platformBrightnessOf(context)),
    );
  }
}